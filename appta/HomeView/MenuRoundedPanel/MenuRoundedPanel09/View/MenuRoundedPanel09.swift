//
//  MenuRoundedPanel09.swift
//  appta
//
//  Created by Assylzhan Tati on 11/30/23.
//

import SwiftUI

struct MenuRoundedPanel09: View {
    @State var items: [MenuRoundedPanelModel09]
    var body: some View {
        ScrollView(.vertical){
            VStack{
                GeometryReader {
                    let size = $0.size
                    
                    LoopingScrollView(width: size.width - 100, spacing: 0, items: items) { item in
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white)
                                .padding()
                                .padding(.horizontal, 15)
                                .shadow(radius: 2)
                    }
                    //.contentMargins(.horizontal, 15, for: .scrollContent)
                    .scrollTargetBehavior(.paging)
                    
                }
                .frame(height: 120)

            }
            .padding(.vertical, 15)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    MenuRoundedPanel09(items: MenuRPmodel09)
}
