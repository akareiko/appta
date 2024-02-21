//
//  ProductsView.swift
//  appta
//
//  Created by Legato on 13.02.2024.
//

import SwiftUI
import FirebaseFirestore

@MainActor
final class ProductsViewModel: ObservableObject {
    
    @Published private(set) var products: [Product] = []
    @Published var selectedFilter: FilterOption? = nil
    @Published var selectedCategory: CategoryOption? = nil
    private var lastDocument: DocumentSnapshot? = nil
    
    func downloadProductsAndUploadToFirebase() {
        
        guard let url = URL(string: "https://dummyjson.com/products") else { return }
        
        Task {
            do {
                let (data, _ /*response*/) = try await URLSession.shared.data(from: url)
                let products = try JSONDecoder().decode(ProductsArray.self, from: data)
                let productArray = products.products
                
                for product in productArray {
                    try? await ProductsManager.shared.uploadProduct(product: product)
                }
                
                print("SUCCESS")
                print(products.products.count)
                

            } catch {
                print(error)
            }
        }
    }
    
    enum FilterOption: String, CaseIterable {
        case priceHigh
        case priceLow
        case noFilter
        
        var priceDescending: Bool? {
            switch self {
            case .noFilter: return nil
            case .priceHigh: return true
            case .priceLow: return false
            }
        }
    }
    
    func filterSelected(option: FilterOption) async throws {
        self.selectedFilter = option
        self.products = []
        self.lastDocument = nil
        self.getProducts()
    }
    
    enum CategoryOption: String, CaseIterable {
        case noCategory
        case smartphones
        case laptops
        case fragrances
        
        var categoryKey: String? {
            if self == .noCategory {
                return nil
            }
            return self.rawValue
        }
    }
    
    func categorySelected(option: CategoryOption) async throws {
        self.selectedCategory = option
        self.products = []
        self.lastDocument = nil
        self.getProducts()
    }
    
    func getProducts() {
        Task {
            let (newProducts, lastDocument) = try await ProductsManager.shared.getAllProducts(priceDescending: selectedFilter?.priceDescending, forCategory: selectedCategory?.categoryKey, count: 10, lastDocument: lastDocument)
            self.products.append(contentsOf: newProducts)
            if let lastDocument {
                self.lastDocument = lastDocument
            }
        }
    }
    
    func getProductsByRating() {
        Task {
            let (newProducts, lastDocument) = try await ProductsManager.shared.getProductsByRating(count: 3, lastDocument: lastDocument)
            self.products.append(contentsOf: newProducts)
            self.lastDocument = lastDocument
        }
    }
    
    func addUserFavoriteProduct(productId: Int) {
        Task {
            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
            try? await UserManager.shared.addUserFavoriteProduct(userId: authDataResult.uid, productId: productId)
        }
    }
}

struct ProductsView: View {
    @StateObject private var viewModel = ProductsViewModel()
    
    var body: some View {
        List {
            Button(action : {
                viewModel.getProductsByRating()
            }) {
                Text("FETCH MORE OJBECTS")
                    .foregroundColor(.black)
            }
            ForEach(viewModel.products) { product in
                ProductCellView(product: product)
                    .contextMenu {
                        Button(action: {
                            viewModel.addUserFavoriteProduct(productId: product.id)
                        }) {
                            Text("Add to Favorites")
                        }
                    }
                
                if product == viewModel.products.last {
                    ProgressView()
                        .onAppear {
                            viewModel.getProducts()
                        }
                }
            }
        }
        .navigationTitle("Products")
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Menu("Filter: \(viewModel.selectedFilter?.rawValue ?? "NONE")") {
                    ForEach(ProductsViewModel.FilterOption.allCases, id: \.self) { option in
                        Button(option.rawValue) {
                            Task {
                                try? await viewModel.filterSelected(option: option)
                            }
                        }
                    }
                }
                .foregroundColor(.blue)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu("Category: \(viewModel.selectedCategory?.rawValue ?? "NONE")") {
                    ForEach(ProductsViewModel.CategoryOption.allCases, id: \.self) { option in
                        Button(option.rawValue) {
                            Task {
                                try? await viewModel.categorySelected(option: option)
                            }
                        }
                    }
                }
                .foregroundColor(.blue)
            }

        })
        .onAppear {
            viewModel.downloadProductsAndUploadToFirebase()
            viewModel.getProducts()
        }
    }
}

#Preview {
    NavigationStack {
        ProductsView()
    }
}
