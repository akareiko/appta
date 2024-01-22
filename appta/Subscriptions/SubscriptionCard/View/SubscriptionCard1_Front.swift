//
//  SubscriptionCard.swift
//  appta
//
//  Created by Assylzhan Tati on 10/6/23.
//

import SwiftUI

struct SubscriptionCard1_Front: View {
    @State var showPlansSheet: Bool = false
    @State var cardShape = CardShape(corners: [.topLeft, .bottomLeft])
    var subscriptionCards: [SubscriptionCardModel]
    var selectedIndex: Int
    @State private var gradientColors: [Color] = [Color("starbucks-lightgold"), Color("starbucks-silver")]
    
    var body: some View {
        if(selectedIndex != 5) {
            ZStack {
                Rectangle()
                    .fill(Color(subscriptionCards[selectedIndex].color))
                    .frame(width: 280 * 0.75, height: 200)
                    .clipShape(cardShape)
                    .offset(x: -40)
                
                Image(subscriptionCards[selectedIndex].pattern)
                    .resizable()
                    .frame(width: 280 * 0.75, height: 200)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(cardShape)
                    .offset(x: -40)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 280 * 0.25, height: 200)
                    .clipShape(CardShape(corners: [.topRight, .bottomRight]))
                    .offset(x: 280*0.35)
                
                Rectangle()
                    .fill(Color("silver").opacity(0.6))
                    .frame(width: 68, height: 30)
                    .offset(x: 99, y: 60)
                
                Image(subscriptionCards[selectedIndex].image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:40, height: 40)
                    .offset(x: 100, y: -65)
                
            }
    //        .shadow(color: Color.gray.opacity(0.05), radius: 20, x: 5, y: 5)
        }
        else {
            ZStack {
                Ellipse()
                    .fill(Color("starbucks-lightgold").gradient)
                    .frame(width: 200, height: 60)
                    .offset(x: -20, y: -20)
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.ultraThinMaterial)
                    .frame(width: 280, height: 200)
                //                    .offset(x: -6)
                    .gradientStroke(colors: gradientColors, lineWidth: 1)
                    .onAppear {
                        withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: true)) {
                            self.gradientColors = [Color("starbucks-silver"), Color("starbucks-lightgold")]
                        }
                    }
                    .onReceive([self.gradientColors].publisher.first()) { _ in
                        // Trigger redraw when gradientColors change
                    }
                
                Circle()
                    .fill(Color("starbucks-lightgold"))
                    .frame(width: 100, height: 100)
                Button(action: {
                    showPlansSheet.toggle()
                }){
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .sheet(isPresented: $showPlansSheet){
                            print("sheet dismissed")
                        } content: {
//                            PlansView()
//                                .presentationDetents([.large])
                                AnotherCarouselView()
                        }
                }
                
            }
        }
    }
}

#Preview {
    SubscriptionCard1_Front(subscriptionCards: SubscriptionCards, selectedIndex: 5)
}
