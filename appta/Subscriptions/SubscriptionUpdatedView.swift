//
//  SubscriptionViewUpdated.swift
//  appta
//
//  Created by Assylzhan Tati on 9/22/23.
//

import SwiftUI

struct SubscriptionUpdatedView: View {
    @State var items: [Item] = [
        .init(color: "starbucks-green", title: "Starbucks", subTitle: "Crafting Premium Coffee Experiences Worldwide, One Cup at a Time.", image: "starbucks-logo"),
        .init(color: "timhortons-red", title: "Tim Hortons", subTitle: "Bringing Global Coffee Excellence to Your Daily Brew with Passion.", image: "timhortons-logo"),
        .init(color: "costacoffee-purple", title: "Costa Coffee", subTitle: "Innovative Coffee Blends, Elevating Your Daily Brew to New Heights.", image: "costacoffee-logo"),
        .init(color: "pretamanger-red", title: "Pret A Manger", subTitle: "Bringing Joy and Community Through Exceptional Daily Coffee Experiences.", image: "pretamanger-logo"),
        .init(color: "pretamanger-red", title: "Coffee Day", subTitle: "Creating Moments of Delight Through Daily Coffee Rituals.", image: "pretamanger-logo")
    ]
    @State private var showPagingControl: Bool = true
    @State private var disablePagingInteraction: Bool = false
    @State private var pagingSpacing: CGFloat = 20
    @State private var titleScrollSpeed: CGFloat = 0.6
    @State private var stretchContent: Bool = true
    
    var body: some View {
        VStack{
            ScrollView(){
                
                CustomPagingSlider(showPagingControl: showPagingControl, disablePagingInteraction: disablePagingInteraction, titleScrollSpeed: titleScrollSpeed, pagingControlSpacing: pagingSpacing,  data: $items)
                { $item in
                    let index = items.firstIndex(where: { $0.id == $item.wrappedValue.id }) ?? 0
                    SubscriptionCard1_Front(subscriptionCards: SubscriptionCards, selectedIndex: index)
                } titleContent: { $item in
                    
                    VStack(spacing: 5){
                        
                        Text(item.title)
                            .font(.largeTitle.bold())
                        Text(item.subTitle)
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                            .frame(height: 45)
                    }
                    .safeAreaPadding([.horizontal], 35)
                    .padding(.bottom, 20)
                    .padding(.top, 60)
                
                } bottomContent:{ $item in
                    VStack(alignment: .leading, spacing: 10){
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("starbucks-rewardgold"))
                            .offset(CGSize(width: 160, height: -400))
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text("Subscription Info")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .padding(.top, 20)
                            
                            
                            Text("Discover the joy of a fresh cup of coffee delivered to your doorstep every week. With our coffee subscription, you'll enjoy:")
                                .font(.body)
                                .foregroundColor(.secondary)
                            
                            Text("Plan: Basic")
                                .font(.body)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                        }
                        .frame(width: 350)
                        
                    }
                        
                }

                
            }
        }
    }
}

#Preview {
    SubscriptionUpdatedView()
}

