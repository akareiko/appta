//
//  SubscriptionCard.swift
//  appta
//
//  Created by Assylzhan Tati on 10/6/23.
//

import SwiftUI

struct SubscriptionCard1_Front: View {
    @State var cardShape = CardShape(corners: [.topLeft, .bottomLeft])
    var subscriptionCards: [SubscriptionCardModel]
    var selectedIndex: Int
    
    var body: some View {
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
}

#Preview {
    SubscriptionCard1_Front(subscriptionCards: SubscriptionCards, selectedIndex: 0)
}
