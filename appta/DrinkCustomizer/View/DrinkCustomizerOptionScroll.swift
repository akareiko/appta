//
//  OptionScroll.swift
//  appta
//
//  Created by Assylzhan Tati on 12/4/23.
//

import SwiftUI

struct DrinkCustomizerOptionScroll: View {
    @State var selectedEnlargedOption: OptionType = optionscroll[0].optionTypes.first!
    @State var selectedOption: Option = optionscroll.first!
    @State private var showEnlargedView = false
    
    @Binding var totalPrice: Int
    @Binding var optionArray: [Int : OptionType]
        var body: some View {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Options")
                        .font(.title3.bold())
                        .foregroundColor(.black)
                    
                    Text("Make your beverage even better!")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 20)
                
                let screenWidth = UIScreen.main.bounds.width // Adjust as necessary for your layout
                let spacing: CGFloat = 60
                let totalSpacing = spacing * 3 // Spacing for 3 gaps between 4 elements
                let elementWidth = (screenWidth - totalSpacing) / 4
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 50){
                        ForEach(optionscroll){thing in
                            Button(action: {                                
                                withAnimation(.spring()) {
                                    if selectedOption.id == thing.id && showEnlargedView {
                                        showEnlargedView.toggle()
                                        print(showEnlargedView)
                                    } else {
                                        selectedOption = thing
                                        showEnlargedView = true
                                        print(showEnlargedView)
                                    }
                                }
                            }) {
                                withAnimation(.spring()) {
                                    Image(selectedOption.id == thing.id && showEnlargedView ? thing.image_gold : thing.image)
                                        .resizable()
                                        .scaleEffect(selectedOption.id == thing.id && showEnlargedView ? 1.25 : 1.0)
                                        .frame(width: 35, height: 35)
                                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                                        .overlay(content:{
                                            if selectedOption.id == thing.id && showEnlargedView {
                                                Rectangle()
                                                    .frame(width: 40, height: 2)
                                                    .foregroundColor(Color("starbucks-rewardgold"))
                                                    .padding(.top, 85)
                                            }
                                            
                                            Text(thing.title)
                                                .font(.caption2)
                                                .scaleEffect(selectedOption.id == thing.id && showEnlargedView ? 1.25 : 1.0)
                                                .foregroundColor(selectedOption.id == thing.id && showEnlargedView ? Color("starbucks-rewardgold") : .secondary)
                                                .frame(width: 70)
                                                .padding(.top, 65)
                                            
                                        })
                                }
                            }
                            .frame(width: elementWidth)
                        }
                    }
                    .frame(height: 80)
                    .padding(.horizontal, 10)
                }
                .frame(width: screenWidth)
                .scrollTargetBehavior(.paging)
                .contentMargins(.leading, 5, for: .scrollContent)
                            
                if showEnlargedView == false {
                    Rectangle()
                        .frame(width: 220, height: 1)
                        .foregroundColor(Color("starbucks-rewardgold"))
                        .offset(CGSize(width: 100, height: 10))
                }
                
                if showEnlargedView {
                    DrinkCustomizerOptionEnlarged(selectedEnlargedOption: $selectedEnlargedOption, selectedIndex: $selectedOption.index, totalPrice: $totalPrice, optionArray: $optionArray)
                        .offset(CGSize(width: 90, height: 0))
                        .padding(.top, 30)
                
                }
            }
            
        }
}

#Preview {
//    DrinkCustomizer(selectedCoffee: DrinkModel(index: 0, image: "Caramel-Brule-Latte", title: "Caramel Brule Latte", description: "The Caramel-Brulé Latte is a luxurious coffee drink blending rich espresso with creamy milk, topped with a layer of frothy foam and a drizzle of caramel sauce, torched to create a caramelized topping reminiscent of crème brûlée. It's a perfect blend of bitter espresso and sweet, crunchy caramel, ideal for those who enjoy a sophisticated, dessert-like coffee experience.", prices: [1200, 1400, 1600], drinkSize: [300, 400, 500]))
    DrinkCustomizerOptionScroll(totalPrice: .constant(1200), optionArray: .constant([:]))
}

