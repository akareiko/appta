import SwiftUI
import Combine

@MainActor
final class FavoriteModel: ObservableObject {
    @Published private(set) var userFavoriteProducts: [UserFavoriteProduct] = []
    private var cancellables = Set<AnyCancellable>()
    
    func addListenerForFavorites() {
        guard let authDataResult = try? AuthenticationManager.shared.getAuthenticatedUser() else { return }
//        UserManager.shared.addListenerForAllUserFavoriteProducts(userId: authDataResult.uid) { [weak self] products in
//            self?.userFavoriteProducts = products
//        }
        
        UserManager.shared.addListenerForAllUserFavoriteProducts(userId: authDataResult.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] products in
                self?.userFavoriteProducts = products
            }
            .store(in: &cancellables)
    }
    
//    func getFavorites() {
//        Task {
//            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
//            self.userFavoriteProducts = try await UserManager.shared.getAllUserFavoriteProducts(userId: authDataResult.uid)
//        }
//    }
    
    func removeFavorites(favoriteProductId: String) {
        Task {
            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
            try? await UserManager.shared.removeUserFavoriteProduct(userId: authDataResult.uid, favoriteProductId: favoriteProductId)
//            getFavorites()
        }
    }
}

struct Favorite: View {
    @StateObject private var viewModel = FavoriteModel()
    
    var body: some View {
        List {
            ForEach(viewModel.userFavoriteProducts, id: \.id.self) { item in
                ProductCellViewBuilder(productId: String(item.productId))
                    .contextMenu {
                        Button(action: {
                            viewModel.removeFavorites(favoriteProductId: item.id)
                        }) {
                            Text("Remove from favorites")
                        }
                    }
            }
        }
        .navigationTitle("Favorites")
//        .onAppear {
//            if !didAppear {
//                viewModel.addListenerForFavorites()
//                didAppear = true
//            }
//        }
        .onFirstAppear {
            viewModel.addListenerForFavorites()
        }
    }
}

#Preview {
    NavigationStack {
        Favorite()
    }
}

struct OnFirstAppearViewModifier: ViewModifier {
    @State private var didAppear: Bool = false
    let perform: (() -> Void)?
    func body(content: Content) -> some View {
        content
            .onAppear {
                if !didAppear {
                    perform?()
                    didAppear = true
                }
            }
    }
}

extension View {
    func onFirstAppear(perform: (() -> Void)?) -> some View {
        modifier(OnFirstAppearViewModifier(perform: perform))
    }
}
