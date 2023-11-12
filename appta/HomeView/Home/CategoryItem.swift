/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a single category item.
*/

import SwiftUI

struct CategoryItem: View {
    var coffeeshop: CoffeeShop

    var body: some View {
        VStack(alignment: .leading) {
            coffeeshop.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 290, height: 190)
                .cornerRadius(20)
            Text(coffeeshop.name)
                .truncationMode(.tail)
                .frame(width: 250, height: 20)
                .foregroundColor(.primary)
                .font(
                    .caption
                    .weight(.bold)
                )
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(coffeeshop: ModelData().coffeeshops[0])
    }
}
