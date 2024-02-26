//
//  OffsetModifier.swift
//  ImageViewer
//
//  Created by Assylzhan Tati on 12/15/23.
//

import SwiftUI

@MainActor
final class OffsetModifierModel: ObservableObject {
    let coffeeshop_id = "mqkKxYkBMX30XJaXgkWn"
    let address_id = "srKh0QPkKzKK0VSr94rA"

    @Published private(set) var tabs: [TabMenu] = []
    
    func getAllTabs() async throws {
        self.tabs = try await MenuManager.shared.getAllTabs(coffeeshop_id: coffeeshop_id, addressId: address_id)
    }
}

struct OffsetModifier: ViewModifier {
    
    var tab: TabMenu
    @StateObject var viewModelOffset = OffsetModifierModel()
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
                    if let currentIndex = viewModelOffset.tabs.firstIndex(where: { $0.id == currentTab }) {
                    if offset < 120 && -offset < (proxy.midX / 2) && currentTab != tab.id && currentIndex < viewModelOffset.tabs.count - 1 {
                    // Scrolling down
                        currentTab = viewModelOffset.tabs[currentIndex + 1].id
                    } else if offset > 120 && offset > -(proxy.midX / 2) && currentTab == tab.id && currentIndex > 0 {
                
                    currentTab = viewModelOffset.tabs[currentIndex - 1].id
                        }
                    }
                }
            }
            .task{
                try? await viewModelOffset.getAllTabs()
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
