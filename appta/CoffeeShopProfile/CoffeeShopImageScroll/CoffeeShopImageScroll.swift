//
//  CoffeeShopImageScroll.swift
//  appta
//
//  Created by Assylzhan Tati on 10/7/23.
//

import SwiftUI

struct CoffeeShopImageScroll: View {
    @State var coffeeShopImages = CoffeeShopImageModel( image: "starbucks2")
    
    @State var currentIndex: Int = 0
    var body: some View {
        @State var items: [Item] = [
            .init(color: "", title: "Starbucks", subTitle: "", image: "starbucks"),
            .init(color: "", title: "Starbucks", subTitle: "", image: "starbucks2"),
            .init(color: "", title: "Starbucks", subTitle: "", image: "starbucks3"),
            .init(color: "", title: "Starbucks", subTitle: "", image: "starbucks4")
        ]
        @State var showPagingControl: Bool = false
        @State var disablePagingInteraction: Bool = false
        @State var pagingSpacing: CGFloat = -140
        @State var titleScrollSpeed: CGFloat = 0.8
        @State var stretchContent: Bool = true
        VStack{
            CustomPagingSlider(showPagingControl: showPagingControl, disablePagingInteraction: disablePagingInteraction, titleScrollSpeed: titleScrollSpeed, pagingControlSpacing: pagingSpacing, spacing: 0, data: $items)
            { $item in
                Image(item.image).resizable().frame(height: 450).aspectRatio(1, contentMode: .fit).frame(width: UIScreen.main.bounds.width, height: 450).offset(y: -20)
                
                
            } titleContent: { $item in
                
            }
        }
        .animation(.easeInOut, value: currentIndex)
    }
}

#Preview {
    CoffeeShopImageScroll()
}
