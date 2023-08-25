import SwiftUI
import Foundation

struct TextViewHom: View {
    var body: some View {
        Text("appta")
            .font(.custom("Helvetica", size: 15))
            .bold()
            .padding(9)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(15)
            .padding(45)
    }
}

struct HomeView: View {
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = false
    }
    
    var body: some View {
        ZStack {
            Color.white
            
            ScrollView {
                VStack(spacing: 0) {
                    GeometryReader { geometry in
                        Image("hehone")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(
                                width: geometry.size.width,
                                height: geometry.safeAreaInsets.top + 300
                            )
                            .clipped()
                            .offset(y: -geometry.safeAreaInsets.top)
//                            .luminanceToAlpha()
                            .overlay(TextViewHom())
                    }
                    .frame(height: 300)
                    
                    VStack {
                        CategoryRow(
                            categoryName: ModelData().coffeeshops[0].category.rawValue,
                            items: ModelData().coffeeshops
                        )
                        Spacer()
                    }
                    
                    VStack {
                        Image("hehtwo")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 350, height: 150)
                            .cornerRadius(10)
                            
                        Spacer()
                    }
                    VStack {
                        CategoryRow(
                            categoryName: "Subscription+",
                            items: ModelData().coffeeshops
                        )
                        Spacer()
                    }
                }
            }
            
//            TabView{
//                Iska_2()
//                    .tabItem{
//                        Image(systemName: "house")
//                    }
//                Iska()
//                    .tabItem{
//                        Image(systemName: "person")
//                    }
//            }
        
//            VStack {
//                Spacer()
//                CustomTabBar(selectedTab: $selectedTab)
//            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
