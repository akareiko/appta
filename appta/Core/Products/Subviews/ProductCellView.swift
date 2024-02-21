import SwiftUI

struct ProductCellView: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.thumbnail ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 75, height: 75)
            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(product.title ?? "n/a")
                    .font(.headline)
                    .foregroundColor(.black)
                Text("Price: $" + String(product.price ?? 0))
                    .foregroundColor(.black)
                Text("Rating: " + String(product.rating ?? 0))
                Text("Category: " + (product.category ?? "n/a"))
                Text("Brand: " + (product.brand ?? "n/a"))
            }
            .font(.callout)
            .foregroundColor(.secondary)
        }
    }
}

#Preview {
    ProductCellView(product: Product(id: 1, title: "haha", description: "haha", price: 1, discountPercentage: 1, rating: 1, stock: 1, brand: "haha", category: "haha", thumbnail: "haha", images: []))
}
