//
//  CategoryItemStory.swift
//  appta
//
//  Created by Legato on 05.09.2023.
//

import SwiftUI

struct CategoryItemStory: View {
    var coffeeshop: CoffeeShop

    var body: some View {
        VStack(alignment: .leading) {
            coffeeshop.imagestory
                .renderingMode(.original)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .overlay() {
                    Circle()
                        .stroke(.green, lineWidth: 2)
                        .frame(width: 68, height: 68)
                }
            Text(coffeeshop.name)
                .truncationMode(.tail)
                .frame(width: 70, height: 20)
                .foregroundColor(.primary)
                .font(
                    .caption
                        .weight(.bold)
                )
        }
        .padding(.leading, 15)
    }
}

struct CategoryItemStory_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemStory(coffeeshop: ModelData().coffeeshops[0])
    }
}
