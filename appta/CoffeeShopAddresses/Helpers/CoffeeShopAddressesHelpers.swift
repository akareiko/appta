//
//  CoffeeShopAddressHelpers.swift
//  appta
//
//  Created by Assylzhan Tati on 1/8/24.
//

import SwiftUI

// Offset Key
struct OffsetKey4: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

//extension View {
//    @ViewBuilder
//    func offsetX(completion: @escaping (CGFloat) -> ()) -> some View {
//        self
//            .overlay {
//                GeometryReader {
//                    let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX
//
//                    Color.clear
//                        .preference(key: OffsetKey2.self, value: minX)
//                        .onPreferenceChange(OffsetKey2.self, perform: completion)
//                }
//            }
//    }
//
//    // Tab Bar Masking
//    @ViewBuilder
//    func tabMask(_ tabProgress: CGFloat) -> some View {
//        ZStack{
//            self
//                .foregroundStyle(.gray)
//
//            self
//                .symbolVariant(.fill)
//                .foregroundColor(Color("starbucks-rewardgold"))
//                .mask{
//                    GeometryReader {
//                        let size = $0.size
//                        let capsuleWidth = size.width / CGFloat(ScrollableTab.allCases.count)
//
//                        Capsule()
//                            .frame(width: capsuleWidth)
//                            .offset(x: tabProgress * (size.width - capsuleWidth))
//
//                    }
//                }
//        }
//    }
//}

#Preview {
    ScrollableTabView()
}
