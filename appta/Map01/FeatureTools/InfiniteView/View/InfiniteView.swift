//
//  InfiniteView.swift
//  appta
//
//  Created by Assylzhan Tati on 11/30/23.
//

import SwiftUI

struct InfiniteView: View {
    @State private var items: [InfiniteViewModel] = [.red, .blue, .green, .yellow, .black].compactMap {
        return .init(color: $0) }
    var body: some View {
        ScrollView(.vertical){
            VStack{
                GeometryReader {
                    let size = $0.size
                    
                    LoopingScrollView(coffeeShopCardOffset: .constant(0), width: size.width, spacing: 0, items: items) { item in
                            RoundedRectangle(cornerRadius: 15)
                            .fill(item.color.gradient)
                            .padding(.horizontal, 15)
                    }
                    //.contentMargins(.horizontal, 15, for: .scrollContent)
                    .scrollTargetBehavior(.paging)
                }
                .frame(height: 220)

            }
            .padding(.vertical, 15)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    InfiniteView()
}
