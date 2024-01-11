//
//  OptionScroll.swift
//  appta
//
//  Created by Assylzhan Tati on 12/4/23.
//

import SwiftUI

struct DrinkCustomizerOptionScroll: View {
    
    @State var options: [Option]
    @State private var selectedOption: Option?
    @State private var showEnlargedView = false
//    @Binding var optionArray: [Int : OptionType]
    
    @Binding var totalPrice: Int
    
        var body: some View {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Options")
                        .font(.title3.bold())
                    
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
                        ForEach(options){thing in
                            Button(action: {
                                withAnimation(.spring()) {
                                    if selectedOption?.id == thing.id && showEnlargedView {
                                        showEnlargedView.toggle()
                                    } else {
                                        selectedOption = thing
                                        showEnlargedView = true
                                    }
                                }
                            }) {
                                Image(selectedOption?.id == thing.id && showEnlargedView ? thing.image_gold : thing.image)
                                    .resizable()
                                    .scaleEffect(selectedOption?.id == thing.id && showEnlargedView ? 1.25 : 1.0)
                                    .frame(width: 35, height: 35)
                                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                                    .overlay(content:{
                                        if selectedOption?.id == thing.id && showEnlargedView {
                                            Rectangle()
                                                .frame(width: 40, height: 2)
                                                .foregroundColor(Color("starbucks-rewardgold"))
                                                .padding(.top, 85)
                                        }
                                        
                                        Text(thing.title)
                                            .font(.caption2)
                                            .scaleEffect(selectedOption?.id == thing.id && showEnlargedView ? 1.25 : 1.0)
                                            .foregroundColor(selectedOption?.id == thing.id && showEnlargedView ? Color("starbucks-rewardgold") : .secondary)
                                            .frame(width: 70)
                                            .padding(.top, 65)
                                        
                                    })
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
                        .frame(width: UIScreen.main.bounds.width - 200, height: 1)
                        .padding(.leading, 110)
                        .padding(.top, 10)
                        .foregroundColor(Color("starbucks-rewardgold"))
                }
                
                if let selectedIndex = selectedOption?.index, showEnlargedView {
                    DrinkCustomizerOptionEnlarged(
                        totalPrice: $totalPrice,
                        selectedIndex: selectedOption?.index ?? 0,
                        options: optionscroll,
                        optionArray: [:],
                        isClicked: []
                        )
                    .offset(CGSize(width: 90, height: 0))
                    .padding(.top, 30)
                
                }
            }
            
        }
}
