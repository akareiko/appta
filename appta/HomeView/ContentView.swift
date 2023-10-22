import SwiftUI
import UIKit

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                switch selectedTab {
                case .house:
                    HomeView()
                case .magnifyingglass:
                    SearchView()
                case .qrcode:
                    QrcodeView()
                case .plus:
                    SubscriptionUpdatedView()
                case .person:
                    HomeView()
                }
            }
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
        //            .edgesIgnoringSafeArea(.bottom)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
