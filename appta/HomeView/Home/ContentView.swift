import SwiftUI
import UIKit

class GlobalVars: ObservableObject {
    @Published var str: Bool = false
    @Published var nestr: Bool = false
    
    @Published var abc: Bool = false
}

class GlobalWars: ObservableObject {
    @Published var abc: Bool = false
    
    var coffeeShopArray: [PlansModel] = [
        .init(imageName: "arabica-logo", names: "arabica"),
        .init(imageName: "cinnabon-logo", names: "cinnabon"),
        .init(imageName: "coffeeday-logo", names: "coffeeday"),
        .init(imageName: "pretamanger-logo", names: "pretamanger"),
        .init(imageName: "starbucks-logo", names: "starbucks"),
        .init(imageName: "timhortons-logo", names: "timhortons"),
        .init(imageName: "veneziano-logo", names: "veneziano"),
        .init(imageName: "zebracoffee-logo", names: "zebra"),
        ]
}

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    @Environment(\.isPresented) private var isPresented
    @ObservedObject var globalvars = GlobalVars()
    @State private var keks: Double = 1.0
    
    @StateObject var obj = GlobalWars()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                switch selectedTab {
                case .house:
                    HomeView(str: $globalvars.str, nestr: $globalvars.nestr)
                case .magnifyingglass:
                    SearchView()
                case .qrcode:
                    QrcodeView()
                case .plus:
                    SubscriptionUpdatedView()
                case .person:
                    ProfileView()
                }
            }
            VStack {
                Spacer()
                if(globalvars.nestr == false) {
                    CustomTabBar(selectedTab: $selectedTab, str: $globalvars.str)
                        .opacity(keks)
//                        .scaleEffect(keks)
                        .animation(Animation.spring(duration: 1.0), value: keks)
                        .onAppear {self.keks = 1.0}
                        .onDisappear {self.keks = 0.0}
                }
            }
        }
        .environmentObject(obj)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
