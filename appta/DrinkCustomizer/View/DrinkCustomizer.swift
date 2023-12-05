//
//  DrinkCustomizer.swift
//  appta
//
//  Created by Assylzhan Tati on 11/19/23.
//

import SwiftUI

struct DrinkCustomizer: View {
    @State private var isClicked = false
    @State private var isTextExpanded = false
    @State var options: [Option]
    var body: some View {
        
        VStack(alignment: .leading){
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading){
                    HStack{
                        Text("Drink Customizer")
                            .multilineTextAlignment(.leading)
                            .font(.title.bold())
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 25)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        Image("Eggnog-Latte")
                            .resizable()
                            .frame(width: 350, height: 350)
                            .padding(.leading, 20)
                    }
                    HStack(){
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color("starbucks-rewardgold"))
                        
                        Text("Cappucino")
                            .font(.title2.bold())
                        
                        Spacer()
                        
                        Button(action: {
                            self.isClicked.toggle()
                        }) {
                            Text("+ Add   ")
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                                .padding(.init(top: 2, leading: 8, bottom: 2, trailing: 8))
                                .background(Color.white)
                                .cornerRadius(20)
                                .overlay(
                                    Capsule()
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                        .offset(CGSize(width: -18, height: 2))
                    }
                    .padding(.horizontal, 15)
                    
                    VStack(alignment: .leading){
                        Text("A cappuccino is a delightful espresso-based drink that blends rich espresso with creamy steamed milk and a frothy milk foam topping. Its bold coffee flavor harmonizes perfectly with the smoothness of milk, creating a luxurious and comforting beverage that's both aromatic and indulgent.")
                            .font(.footnote)
                            .foregroundColor(.black)
                            .lineLimit(isTextExpanded ? nil : 3)
                        
                        Button(action: {
                            withAnimation {
                                isTextExpanded.toggle()
                            }
                        }) {
                            Text(isTextExpanded ? "Show less" : "Show more")
                                .font(.caption)
                                .foregroundColor(Color(.systemGray))
                            
                            Image(systemName: isTextExpanded ? "chevron.up" : "chevron.down")
                                .foregroundColor(Color(.systemGray))
                                .imageScale(.small)
                                .padding(.leading, -5)
                        }
                        .padding(.top, 0.5)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    
                    
                    DrinkCustomizerSize()
                    
                    DrinkCustomizerOptionScroll(options: optionscroll)
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                    
                    Spacer()
                    
                    
                }
            }
        }
    }
}

#Preview {
    DrinkCustomizer(options: optionscroll)
}
