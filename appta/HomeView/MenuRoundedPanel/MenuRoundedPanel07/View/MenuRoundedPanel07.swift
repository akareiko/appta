//
//  MenuRoundedPanel07.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//

import SwiftUI

struct MenuRoundedPanel07: View {
    
    var body: some View {
        VStack(){
            HStack {
                VStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color("starbucks-rewardgold"))
                        
                        Text("Coffee Boxes")
                            .font(.title3.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.leading, 30)
                    
                    Text("Treat yourself with kindness")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                }
                
                NavigationLink(destination: CoffeeBoxList(coffeeboxlist: coffeeboxlist)) {
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("starbucks-rewardgold"))
                            .padding(.trailing, 30)
                    }
            }

            ScrollView(.vertical){
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    GeometryReader {
                        let size = $0.size
                        
                        LoopingScrollView(coffeeShopCardOffset: .constant(0), width: 280, spacing: 30, items: MenuRPmodel07) { thing in
                            Image(thing.image)
                                .resizable()
                                .frame(width: 280, height: 140)
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                                .padding([.top, .bottom], 5)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay(content: {
                                    Text(thing.title)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 20)
                                        .font(.title2.bold())
                                        .offset(CGSize(width: 0, height: 45))
                                        .foregroundColor(.white)
                                })
                        }
                        .padding(.leading, 10)
                        //.contentMargins(.horizontal, 15, for: .scrollContent)
                    }
                    .frame(height: 140)

                }
                .padding(.vertical, 15)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    MenuRoundedPanel07()
}
