////
////  SubscriptionCard.swift
////  appta
////
////  Created by Assylzhan Tati on 10/6/23.
////
//
//import SwiftUI
//
//struct SubscriptionCard1_Back: View {
//    @State var cardShape = CardShape(corners: [.topRight, .bottomRight])
//    @State var items = Item(color: "", title: "", subTitle: "", image: "")
//    var subscriptionCards: [SubscriptionCardModel]
//    var selectedIndex: Int
//    
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(Color(subscriptionCards[selectedIndex].color))
//                .frame(width: 280 * 0.7, height: 200)
//                .clipShape(cardShape)
//                .offset(x: 280*0.15)
//            
//            Rectangle()
//                .fill(Color.gray.opacity(0.2))
//                .frame(width: 280 * 0.3, height: 200)
//                .clipShape(CardShape(corners: [.topLeft, .bottomLeft]))
//                .offset(x: -280*0.35)
//            
//            Rectangle()
//                .fill(LinearGradient(gradient: Gradient(colors: [Color("silver"), Color.white, Color("silver"), Color("silver")]), startPoint: .leading, endPoint: .trailing))
//                .frame(width: 280, height: 30)
//                .offset(x: -0, y: 60)
//            
//            Image(subscriptionCards[selectedIndex].image)
//                .resizable()
//                .scaledToFit()
//                .opacity(0.5)
//                .frame(width: 40, height: 40)
//                .offset(x: -100, y: -65)
//            
//            VStack{
//                Text("Your Card Number: ")
//                    .font(.caption2)
//                    .offset(x: 10, y: -70)
//                
//                Text("0000 0000 0000 0000")
//                    .font(Font.custom("CREDC___", size: 12))
//                    .offset(x: 20, y: -70)
//            }
//            .opacity(0.5)
//        }
//    }
//}
//
//#Preview {
//    SubscriptionCard1_Back(subscriptionCards: SubscriptionCards, selectedIndex: 0)
//}
