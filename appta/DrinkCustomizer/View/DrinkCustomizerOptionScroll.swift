//
//  OptionScroll.swift
//  appta
//
//  Created by Assylzhan Tati on 12/4/23.
//

import SwiftUI

struct DrinkCustomizerOptionScroll: View {
    @State var options: [Option]
    @State private var selectedOption: Option = optionscroll.first!
    @State private var showEnlargedView = false
    var body: some View {
        VStack(alignment: .leading){
            
            VStack(alignment: .leading){
                Text("Options")
                    .font(.title3.bold())
                
                Text("Make your beverage even better!")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 20)
            
            
            LoopingScrollView(width: 80, spacing: 20, items: options){ thing in
                    
                Button(action: {
                    withAnimation(.spring()) {
                        selectedOption = thing
                        print("\(selectedOption.index)")
                        showEnlargedView.toggle()
                        
                    }
                }) {
                    Image(selectedOption.id == thing.id ? thing.image_gold : thing.image)
                        .resizable()
                        .frame(width: 35, height: 35)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                        .overlay(content:{
                            if selectedOption.id == thing.id {
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(Color("starbucks-rewardgold"))
                                    .padding(.top, 45)
                            }
                        })
                    }
                }
                .scrollTargetBehavior(.paging)
                .padding(.top, 15)
                .frame(height: 60)
                .contentMargins(.leading, 5, for: .scrollContent)
            
            ForEach(0..<optionscroll.count, id: \.self) { thing in
                if thing == selectedOption.index {
                    DrinkCustomizerOptionEnlarged(selectedIndex: selectedOption.index, options: options)
                        .offset(x: 50, y: -130)
                }
            }
            
                
        }
        .padding(.top, 30)
    }
}

#Preview {
    DrinkCustomizerOptionScroll(options: optionscroll)
}
