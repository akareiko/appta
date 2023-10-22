//
//  SubscriptionCard.swift
//  appta
//
//  Created by Assylzhan Tati on 10/6/23.
//

import SwiftUI

struct SubscriptionCard2_Front: View {
    @State var cardShape = CardShape(corners: [.topLeft, .bottomLeft])
    var subscriptionCards: [SubscriptionCardModel]
    var selectedIndex: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.gray))
                .frame(width: 280 * 0.75, height: 200)
                .clipShape(cardShape)
                .offset(x: -40)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 280 * 0.25, height: 200)
                .clipShape(CardShape(corners: [.topRight, .bottomRight]))
                .offset(x: 280*0.35)
            
            Rectangle()
                .fill(Color("silver").opacity(0.7))
                .frame(width: 280 * 0.25, height: 30)
                .offset(x: 280 * 0.35, y: 60)
            
            Image(subscriptionCards[selectedIndex].image)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .offset(x: 100, y: -65)
            
            Image(subscriptionCards[selectedIndex].frontimage)
                .resizable()
                .scaledToFit()
                .frame(width: 230, height: 150)
                .offset(x: 0, y: 25)
        }
    }
}

#Preview {
    SubscriptionCard2_Front(subscriptionCards: SubscriptionCards, selectedIndex: 0)
}
