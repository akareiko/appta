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
                    .shadow(radius: 1)
                    .padding(.bottom, -7)
                    .overlay(content: {
                        HStack(){
                            Image("starbucks-logo")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .offset(CGSize(width: 0.0, height: 3.0))
                            
                            Text("DAILY CUP")
                                .font(.custom("Helvetica", size: 17))
                                .offset(CGSize(width: -8.0, height: 4.0))
                                .fontWeight(.semibold)
                                .padding(.leading, 15)
                            
                            Spacer()
                            
                            Image(systemName: "bell")
                                .resizable()
                                .offset(CGSize(width: 0.0, height: 3.0))
                                .frame(width: 20, height: 20)
                                .overlay(content:{
                                    Circle()
                                        .foregroundColor(.red)
                                        .frame(width: 10, height: 10)
                                        .offset(CGSize(width: 10, height: -10))
                                })
                            
                        }
                        .offset(CGSize(width: 0, height: 20.0))
                        .padding(.horizontal, 20)
                        .padding(.top, -5)
                    })
                
                ScrollView(showsIndicators: false){
                    ZStack(){
                        VStack{
                            HStack(){
                                Text("Good Morning, Iska!")
                                    .font(.headline.bold())
                                
                                Spacer()
                                
                                HStack(){
                                    Image(systemName: "star.fill")
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(Color("starbucks-rewardgold"))
                                    
                                    Text("Green Level")
                                        .font(.callout.bold())
                                        .foregroundColor(Color("starbucks-truegreen"))
                                }
                            }
                            .safeAreaPadding([.horizontal, .top], 10)
                            
                            InfiniteCarousel()
                                .frame(width: UIScreen.main.bounds.width - 20)
                                .scaledToFit()
                                .offset(CGSize(width: 0.0, height: 0.0))
                                .padding(.bottom, 0)
                            
//                            MainMenuRoundedPanel(element: Element)
//                                .padding(.bottom, 30)
                            
                            MenuRoundedPanel05(shops: MenuRPmodel05)
                                .padding(.bottom, 30)
                                
                            
                            MenuReward03(element03: Element03)
                            
                            MenuRoundedPanel06()
                                .padding(.bottom, 30)
                                .padding(.top, 20)
                            
                            MenuRoundedPanel04(model04: MenuRPmodel04)
                                .padding(.bottom, 30)
                            
                            MenuRoundedPanel07(shops: MenuRPmodel07)
                                .padding(.bottom, 120)
                            
//                            RewardCarouselView(rewardCarousel: RewardCarousels)
//                                .offset(y: -760)
                            
//                            MenuReward02(menuReward02: menuReward02)
//                                .offset(CGSize(width: 0.0, height: -700.0)).padding(.bottom, 120)
                            
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
