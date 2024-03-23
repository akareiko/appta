//
//  SubscriptionViewUpdated.swift
//  appta
//
//  Created by Assylzhan Tati on 9/22/23.
//

import SwiftUI

struct SubscriptionUpdatedView: View {
//    @State var items: [Item] = [
//        .init(color: "starbucks-green", title: "Starbucks", subTitle: "Crafting Premium Coffee Experiences Worldwide, One Cup at a Time.", image: "starbucks-logo"),
//        .init(color: "timhortons-red", title: "Tim Hortons", subTitle: "Bringing Global Coffee Excellence to Your Daily Brew with Passion.", image: "timhortons-logo"),
//        .init(color: "costacoffee-purple", title: "Costa Coffee", subTitle: "Innovative Coffee Blends, Elevating Your Daily Brew to New Heights.", image: "costacoffee-logo"),
//        .init(color: "pretamanger-red", title: "Pret A Manger", subTitle: "Bringing Joy and Community Through Exceptional Daily Coffee Experiences.", image: "pretamanger-logo"),
//        .init(color: "coffeeday-green", title: "Coffee Day", subTitle: "Creating Moments of Delight Through Daily Coffee Rituals.", image: "pretamanger-logo"),
//        .init(color: "starbucks-white", title: "Add a new", subTitle: "Subscription card of your favourite coffee shops", image: "starbucks-logo")
//    ]
    @State private var showPagingControl: Bool = true
    @State private var disablePagingInteraction: Bool = false
    @State private var pagingSpacing: CGFloat = 20
    @State private var titleScrollSpeed: CGFloat = 0.6
    @State private var stretchContent: Bool = true
    @StateObject private var viewModelCoffeeshop = CoffeeshopViewModel()
    
    
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false){
                CustomPagingSlider(showPagingControl: showPagingControl, disablePagingInteraction: disablePagingInteraction, titleScrollSpeed: titleScrollSpeed, pagingControlSpacing: pagingSpacing,  data: viewModelCoffeeshop.subscriptions)
                { item in
                    SubscriptionCard1_Front(coffeeshop: item.coffeeshop)
                } titleContent: { item in
                    ZStack {
                        Image("Rectangle")
                            .resizable()
                            .frame(width: 400, height: 200)
                            .offset(x: -20, y: 400)
                            .colorMultiply(Color(item.coffeeshop.color))
                            .blur(radius: 100)
                        
                        VStack(spacing: 5){
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("starbucks-rewardgold"))
                            
                            Text(item.coffeeshop.name)
                                .font(.largeTitle.bold())
                            Text(item.coffeeshop.description)
                                .foregroundStyle(.gray)
                                .multilineTextAlignment(.center)
                                .frame(height: 45)
                        }
                        .safeAreaPadding([.horizontal], 35)
                        .padding(.bottom, 20)
                        .padding(.top, 60)
                    }
                    
                } bottomContent:{ item in
                    ZStack {
//                        Image("Rectangle")
//                            .resizable()
//                            .frame(width: 400, height: 400)
//                            .offset(x: -20, y: -630)
//                            .colorMultiply(Color(item.color))
//                            .blur(radius: 100)
                        
                        ParallaxImageView(maximumMovement: 250) {_ in
                            Image("Rectangle")
                                .resizable()
                                .frame(width: 400, height: 400)
                                .offset(x: -10, y: -400)
                                .colorMultiply(Color(item.coffeeshop.color))
                        }
                        
                        VStack(alignment: .leading, spacing: 10){
                            Spacer()
                            .frame(height: 30)
                            
                            VStack(alignment: .leading, spacing: 10){
                                Text("Subscription Info")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                Text("Plan: \(item.plan.plan_name)")
                                    .font(.title)
                                
                                RoundedRectangle(cornerRadius: 15.0)
                                    .fill(.ultraThinMaterial)
                                    .frame(width: UIScreen.main.bounds.width - 50, height: 100)
                                    .shadow(radius: 2)
                                    .overlay(content: {
                                        HStack {
                                            ForEach(item.plan.plan_features.indices, id: \.self) { kek in
                                                Text(Image(systemName: item.plan.plan_features_image[kek]))
                                                    .foregroundColor(.primary)
                                                    .font(.title3)
                                                Text(item.plan.plan_features[kek])
                                                    .foregroundColor(.primary)
                                                    .font(.caption)
                                            }
                                        }
                                        .padding(.horizontal, 20)
                                    })
                                
                                RoundedRectangle(cornerRadius: 15.0)
                                    .fill(.ultraThinMaterial)
                                    .frame(width: UIScreen.main.bounds.width - 50, height: 100)
                                    .shadow(radius: 2)
                                    .overlay(content:{
                                        HStack(){
                                            Text("Your Coffee Tokens: ")
                                            
                                            Spacer()
                                            
                                            GrowingCircle()
                                                .padding(.top, -15)
                                        }
                                        .padding(.horizontal, 20)
                                    })
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, -20)
                            .padding(.bottom, 1000)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(.all)
        .task {
            try? await viewModelCoffeeshop.getSubscriptions()
        }
        
    }
}

#Preview {
    SubscriptionUpdatedView()
}

