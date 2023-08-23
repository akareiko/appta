import SwiftUI

let symbolMappings: [Tab: String] = [
    .house: "house",
    .magnifyingglass: "magnifyingglass",
    .qrcode: "qrcode.viewfinder",
    .plus: "plus.circle",
    .person: "person"
]

enum Tab: String, CaseIterable {
    case house
    case magnifyingglass
    case qrcode
    case plus
    case person
    
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        symbolMappings[selectedTab] ?? selectedTab.rawValue
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .black
        case .magnifyingglass:
            return .green
        case .qrcode:
            return .green
        case .plus:
            return .orange
        case .person:
            return .indigo
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: symbolMappings[tab] ?? tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? tabColor : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}
