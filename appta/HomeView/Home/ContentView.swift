import SwiftUI
import UIKit

class GlobalVars: ObservableObject {
    @Published var str: Bool = false
    @Published var nestr: Bool = false
    
    @Published var abc: Bool = false
}

class GlobalModel: ObservableObject {
//    @Published var userData: [UserDataModel]
//    @Published var shopData: [ShopDataModel]
    @Published var favouritesArray: [OrderModel] = []
//    @Published var coffee: SelectedCoffee
}

class GlobalWars: ObservableObject {
    @Published var abc: Bool = false
    
    var coffeeShopArray: [PlansModel] = [
        .init(imageName: "arabica-logo", names: "Arabica"),
        .init(imageName: "cinnabon-logo", names: "Cinnabon"),
        .init(imageName: "coffeeday-logo", names: "Coffeeday"),
        .init(imageName: "pretamanger-logo", names: "Pretamanger"),
        .init(imageName: "starbucks-logo", names: "Starbucks"),
        .init(imageName: "timhortons-logo", names: "Timhortons"),
        .init(imageName: "veneziano-logo", names: "Veneziano"),
        .init(imageName: "zebracoffee-logo", names: "Zebra"),
        ]
}

struct ContentView: View {
    @State private var selectedTab: Tab = .house

    @StateObject var globalVar = GlobalModel()
    @ObservedObject var globalvars = GlobalVars()
    @State private var keks: Double = 1.0
    
    @StateObject var obj = GlobalWars()
    
    @Environment(\.isPresented) private var isPresented
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                switch selectedTab {
                case .house:
                    HomeView(globalVar: globalVar, str: $globalvars.str, nestr: $globalvars.nestr)
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
