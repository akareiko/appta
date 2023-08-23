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
                .frame(width: 100, height: 120)
                .cornerRadius(20)
            Text(coffeeshop.name)
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
