//
//  CategoryRowStory.swift
//  appta
//
//  Created by Legato on 05.09.2023.
//

import SwiftUI

struct CategoryRowStory: View {
    var categoryName: String
    var items: [CoffeeShop]

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { coffeeshop in
                        CategoryItemStory(coffeeshop: coffeeshop)
                            
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRowStory_Previews: PreviewProvider {
    static var coffeeshops = ModelData().coffeeshops
    
    static var previews: some View {
        CategoryRowStory(
            categoryName: coffeeshops[0].category.rawValue,
            items: Array(coffeeshops.prefix(12))
        )
    }
}
