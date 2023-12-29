//
//  DrinkCustomizer.swift
//  appta
//
//  Created by Assylzhan Tati on 11/19/23.
//

import SwiftUI

struct DrinkCustomizer: View {
    @Binding var isPresented: Bool
    @Binding var selectedCoffee: Coffee?
    @State private var isClicked = false
    @State private var isTextExpanded = false
    @State var options: [Option]
    @Binding var optionArray: [Int: OptionType]
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack{
            ZStack(alignment: .bottomTrailing) {
                ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading){
                    ZStack{
                        Text("Drink Customizer")
                            .font(.title.bold())
                        
                        Button(action: {
                            self.selectedCoffee = nil
                        }) {
                            Circle()
                                .frame(width: 30)
                                .foregroundColor(.black)
                                .overlay(
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                )
                        }
                        .offset(CGSize(width: 245, height: 0))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(CGSize(width: 0, height: -40))
                    .padding(.horizontal, 25)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        Image("Eggnog-Latte")
                            .resizable()
                            .frame(width: 400, height: 400)
                            .padding(.leading, 5)
                    }
                    HStack(){
                        VStack{
                            HStack{
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(Color("starbucks-rewardgold"))
                                
                                Text("Cappucino")
                                    .font(.title2.bold())
                            }
                        }
                        Spacer()
                        
                        Button(action: {
                            self.isClicked.toggle()
                        }) {
                            Text(isClicked ? "    Added  " : "+ Add   ")
                                .foregroundColor(isClicked ? Color.white : Color.black)
                                .fontWeight(.bold)
                                .padding(.init(top: 2, leading: 8, bottom: 2, trailing: 8))
                                .background(isClicked ? Color("starbucks-rewardgold") : Color.white)
                                .cornerRadius(20)
                                .overlay(content:{
                                    Capsule()
                                        .stroke(isClicked ? Color("starbucks-rewardgold") : Color.black, lineWidth: 1)
                                    
                                    Image(systemName: isClicked ? "star.fill" : "")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(.white)
                                        .offset(CGSize(width: -30, height: 0))
                                    
                                    
                                })
                        }
                        .offset(CGSize(width: -18, height: 2))
                    }
                    .padding(.horizontal, 20)
                    
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
                        
                        DrinkCustomizerInfoPanel()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    
                    DrinkCustomizerSize()
                        .padding(.horizontal, 20)
                    
                    VStack(){
                        DrinkCustomizerOptionScroll(options: optionscroll, optionArray: $optionArray)
                    }
                    
                    DrinkCustomizerStatistics()
                        .padding(.bottom, 100)
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                }
                .padding(.top, 80)
            }
            
                HStack(){
                    
                    Text("Total Price: \(calculateTotalPrice()) KZT")
                        .font(.callout)
                        .padding(.horizontal, 20)
                        
                    Spacer()
                }
                .frame(width: nil, height: 80)
                .background(.thinMaterial)
                .cornerRadius(30)
                .padding([.leading, .trailing], 30)
                .padding(.bottom)
                           
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}

extension DrinkCustomizer {
    func calculateTotalPrice() -> Int {
        var total = 0
            
        for (_, optionType) in optionArray {
            if let price = optionType.price {
                total += price
            }
        }
            
        return optionArray[3]?.price ?? 0
    }
}

#Preview {
    DrinkCustomizer(isPresented: .constant(true), selectedCoffee: .constant(nil), options: optionscroll, optionArray: .constant([:]))
}
