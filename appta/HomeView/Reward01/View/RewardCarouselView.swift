//
//  RewardCarouselView.swift
//  appta
//
//  Created by Assylzhan Tati on 10/23/23.
//

import SwiftUI

struct RewardCarouselView: View {
    @State var rewardCarousel: [RewardCarouselModel]
    @State private var isClicked = false
    @State private var showPagingControl: Bool = false
    @State private var showIndicator: Bool = true
    @State private var disablePagingInteraction: Bool = true
    @State private var pagingSpacing: CGFloat = 30
    @State private var titleScrollSpeed: CGFloat = 0.6
    @State private var stretchContent: Bool = true
    var body: some View {
        VStack{
            Image(systemName: "star")
                .padding(.bottom, 5)
            Text("Daily Cup Rewards")
                .font(.title2.bold())
        }
        .multilineTextAlignment(.center)
        .padding(.bottom, 40)
        
        CustomPagingSlider(showPagingControl: showPagingControl, disablePagingInteraction: disablePagingInteraction, titleScrollSpeed: titleScrollSpeed, pagingControlSpacing: pagingSpacing,  data: $rewardCarousel)
        { $reward in
            let index = rewardCarousel.firstIndex(where: { $0.id == $reward.wrappedValue.id }) ?? 0
            
        } titleContent: { $reward in
            VStack(spacing: 5){
                Image(reward.image)
                    .resizable()
                    .frame(width: 300, height: 190)
                    .cornerRadius(15)
                    .padding(.bottom, 30)
                
                Text(reward.text)
                    .font(.title3)
                
            }
            .multilineTextAlignment(.center)
            .padding(.bottom, 25)
        }
        HStack(spacing: 23){
            Button(action: {
                self.isClicked.toggle()
            }) {
                Text("Join now")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.init(top: 8, leading: 14, bottom: 8, trailing: 14))
                    .background(Color.black)
                    .cornerRadius(20)
                    .overlay(
                        Capsule()
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
            
            Button(action: {
                self.isClicked.toggle()
            }) {
                Text("Learn More")
                    .foregroundColor(Color.black)
                    .fontWeight(.bold)
                    .padding(.init(top: 8, leading: 14, bottom: 8, trailing: 14))
                    .background(Color.white)
                    .cornerRadius(20)
                    .overlay(
                        Capsule()
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
        }
        .padding(.bottom, 60)
    }
}



#Preview {
    RewardCarouselView(rewardCarousel: RewardCarousels)
}
