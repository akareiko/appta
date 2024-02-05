//
//  OffsetModifier.swift
//  ImageViewer
//
//  Created by Assylzhan Tati on 12/15/23.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    
    var tab: TabMenu
    @Binding var currentTab: String
    @State var index: Int = 0
    
    func body(content: Content) -> some View {
        content
            .overlay(
                //Getting Scroll Offset using Geometry Reader...
                GeometryReader{proxy in
                    Color.clear
                        .preference(key: OffsetKey1.self, value: proxy.frame(in: .named("SCROLL")))
                }
            )
            .onPreferenceChange(OffsetKey1.self) { proxy in
                let offset = proxy.minY
                            
                withAnimation(.easeInOut){
                    if let currentIndex = drinksmenu.firstIndex(where: { $0.id == currentTab }) {
                    if offset < 120 && -offset < (proxy.midX / 2) && currentTab != tab.id && currentIndex < drinksmenu.count - 1 {
                    // Scrolling down
                        currentTab = drinksmenu[currentIndex + 1].id
                    } else if offset > 120 && offset > -(proxy.midX / 2) && currentTab == tab.id && currentIndex > 0 {
                
                    currentTab = drinksmenu[currentIndex - 1].id
                    }
                }
            }
        }
    }
}

//Preference Key
struct OffsetKey1: PreferenceKey{
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () ->
                       CGRect) {
        value = nextValue()
    }
}
