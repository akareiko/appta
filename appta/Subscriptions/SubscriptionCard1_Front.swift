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
    var coffeeshop: Coffeeshop
    @State private var gradientColors: [Color] = [Color("starbucks-lightgold"), Color("starbucks-silver")]
    
    var body: some View {
        if(coffeeshop.id != "default_id") {
            ZStack {
                Rectangle()
                    .fill(Color(coffeeshop.color))
                    .frame(width: 280 * 0.75, height: 200)
                    .clipShape(cardShape)
                    .offset(x: -40)
                
                Image(coffeeshop.pattern)
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
                
                Image(coffeeshop.image_url)
                    .resizable()
                    .scaledToFit()
                    .frame(width:40, height: 40)
                    .offset(x: 100, y: -65)
                
                AsyncImage(url: URL(string: coffeeshop.image_url)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .offset(x: 100, y: -65)
                } placeholder: {
                ProgressView()
                        .frame(width: 40, height: 40)
                }
                
            }
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
                    showPlansSheet = true
                }){
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .sheet(isPresented: $showPlansSheet){
                            print("sheet dismissed")
                        } content: {
                            GuideView()
                        }
                }
                
            }
        }
    }
}

#Preview {
    SubscriptionCard1_Front(coffeeshop: Coffeeshop(id: "default_id", name: "Default Coffeeshop", image_url: "default_image_url", description: "Default Description", color: "default_color", pattern: "default_pattern"))
}
