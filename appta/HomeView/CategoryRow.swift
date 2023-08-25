import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [CoffeeShop]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { coffeeshop in
                        CategoryItem(coffeeshop: coffeeshop)
                            
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var coffeeshops = ModelData().coffeeshops

    static var previews: some View {
        CategoryRow(
            categoryName: coffeeshops[0].category.rawValue,
            items: Array(coffeeshops.prefix(12))
        )
    }
}
