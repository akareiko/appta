import SwiftUI
import Foundation

struct HomeView: View {
    @State private var selectedTab: Tab = .house
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .foregroundColor(.white)
                    .overlay(content: {
                        HStack(){
                            Image("starbucks-logo")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .offset(CGSize(width: 0.0, height: 3.0))
                            
                            Spacer()
                            
                            Text("DAILY CUP")
                                .font(.custom("Helvetica", size: 15))
                                .offset(CGSize(width: -8.0, height: 4.0))
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .offset(CGSize(width: 0.0, height: 3.0))
                                .frame(width: 20, height: 20)
                            
                        }
                        .offset(CGSize(width: 0, height: 20.0))
                        .padding(.horizontal, 20)
                    })
                
                ScrollView(showsIndicators: false){
                    ZStack(){
                        VStack{
                            Image("main_starbucks")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width, height: 300)
                                .aspectRatio(contentMode: .fill)
                            
                            Rectangle()
                                .fill(Color("starbucks-white"))
                                .frame(width: UIScreen.main.bounds.width, height: 420)
                                .aspectRatio(contentMode: .fill)
                                .padding(.top, -10)
                            
                            Rectangle()
                                .fill(Color("starbucks-white"))
                                .frame(width: UIScreen.main.bounds.width, height: 500)
                                .aspectRatio(contentMode: .fill)
                                .padding(.top, -10)
                            
                            MainMenuRoundedPanel(element: Element)
                                .offset(x: 0, y: -970)
                            
                            CategoryRow(                 categoryName: ModelData().coffeeshops[0].category.rawValue,        items: ModelData().coffeeshops)
                                .offset(x: 0, y: -400)
                            
                            MenuReward03(element03: Element03)
                                .offset(y: -1080)
                            
                            MenuReward02(menuReward02: menuReward02)
                                .padding(.bottom, 120)
                            
                            RewardCarouselView(rewardCarousel: RewardCarousels)
                                .offset(y: -1300)
                            
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
