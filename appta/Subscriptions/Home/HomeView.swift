import SwiftUI
import Foundation

struct HomeView: View {
    @State private var selectedTab: Tab = .house
    @ObservedObject var globalVars: GlobalVars
    @Binding var str: Bool
    @Binding var nestr: Bool
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Image("vecfin")
//                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 600)
                    .offset(x: 0, y: -0)
                    .scaleEffect(1.9)
                    .blur(radius: 100)
                    .opacity(0.8)
               
                
                
                VStack {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .frame(width: UIScreen.main.bounds.width, height: 100)
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
                            ParallaxImageView(maximumMovement: 200) {_ in
                                Image("Vector")
                                //                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width, height: 600)
                                    .offset(x: -80, y: -100)
                                    .scaleEffect(1.4)
                                
                                Image("Vector-1")
                                //                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width, height: 600)
                                    .offset(x: 80, y: -680)
                                    .scaleEffect(1.4)
                            }
                            ParallaxImageView(maximumMovement: 100) {_ in
                                Image("Vector-2")
                                //                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width, height: 600)
                                    .offset(x: -80, y: -100)
                                    .scaleEffect(1.4)
                                
                                Image("Vector-3")
                                //                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width, height: 600)
                                    .offset(x: 120, y: -640)
                                    .scaleEffect(1.4)
                            }
                            ParallaxImageView(maximumMovement: 150) {_ in
                                Image("Vector-4")
                                //                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width, height: 600)
                                    .offset(x: -90, y: -500)
                                    .scaleEffect(1.4)
                                Image("Vector-5")
                                //                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width, height: 600)
                                    .offset(x: 60, y: -240)
                                    .scaleEffect(1.4)
                            }
                                
                            VStack{
//                                HStack(){
//                                    Text("Good Morning, Iska!")
//                                        .font(.headline.bold())
//                                    
//                                    Spacer()
//                                    
//                                    HStack(){
//                                        Image(systemName: "star.fill")
//                                            .frame(width: 15, height: 15)
//                                            .foregroundColor(Color("starbucks-rewardgold"))
//                                        
//                                        Text("Green Level")
//                                            .font(.callout.bold())
//                                            .foregroundColor(Color("starbucks-truegreen"))
//                                    }
//                                }
//                                .safeAreaPadding([.horizontal, .top], 10)
                                
//                                InfiniteCarousel()
//                                    .padding(.bottom, -20)
                                
    //                            MainMenuRoundedPanel(element: Element)
    //                                .padding(.bottom, 30)
                                
                                Spacer()
                                    .frame(height: 50)
                                
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.ultraThinMaterial)
                                    .frame(width: 370, height: 200)
                                
                                MenuRoundedPanel05(globalVars: globalVars)
                                    .padding(.bottom, 30)
                                    .offset(y: -200)
                                    
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.ultraThinMaterial)
                                    .frame(width: 370, height: 400)
                                    .offset(y: -200)
                                MenuReward03()
                                    .offset(y: -600)
                                
                                MenuRoundedPanel06()
                                    .padding(.bottom, 30)
                                    .padding(.top, 20)
                                
                                MenuRoundedPanel04()
                                    .padding(.bottom, 30)
                                
                                MenuRoundedPanel07()
                                    .padding(.bottom, 120)
                                
    //                            RewardCarouselView(rewardCarousel: RewardCarousels)
                                
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
}

struct ParallaxImageView<Content: View>: View {
    var maximumMovement: CGFloat = 150
    var usesFullWidth: Bool = false
    @ViewBuilder var content: (CGSize) -> Content
    var body: some View {
        GeometryReader {
            let size = $0.size
            // Movement Animation Properties
            let minY = $0.frame(in: .scrollView(axis: .vertical)).minY
            let scrollViewHeight = $0.bounds(of: .scrollView)?.size.height ?? 0
            let maximumMovement = min(maximumMovement, (size.height * 0.35))
            let stretchedSize: CGSize = .init(width: size.width, height: size.height + maximumMovement)
            
            let progress = minY / scrollViewHeight
            let cappedProgress = max(min(progress, 1.0), -1.0)
            let movementOffset = cappedProgress * -maximumMovement
            
            content(size)
                .offset(y: movementOffset)
                .frame(width: stretchedSize.width, height: stretchedSize.height)
                .frame(width: size.width, height: size.height)
                .clipped()
        }
        .containerRelativeFrame(usesFullWidth ? [.horizontal] : [])
    }
}

#Preview {
    HomeView(globalVars: GlobalVars(), str: .constant(false), nestr: .constant(false))
}
