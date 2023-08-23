import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    struct TextView: View {
        var body: some View {
            VStack {
                Text("special prices will continue until 29 Aug")
                    .font(
                        .custom("Helvetica", size: 20))
                    .padding(12)
                    .foregroundColor(.white)
            }
            .background(Color.black)
            .opacity(0)
            .padding(6)
            .offset(y: 45)
        }
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
                            .overlay(TextView())
                    }
                    .frame(height: 300)
                    
                    VStack {
                        Spacer()
                        Spacer()
                        Text("appta")
                            .font(
                                .custom("Helvetica", size: 30)
                            )
                    }
                    
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
                            .frame(width: 350, height: 100)
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
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
