//
//  DrinkCustomizerSize.swift
//  appta
//
//  Created by Assylzhan Tati on 12/4/23.
//

import SwiftUI

struct DrinkCustomizerSize: View {
    @ObservedObject var coffee: SelectedCoffee
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("Size")
                    .font(.title3.bold())
                    .foregroundColor(.black)
                
                Text("Choose your favourite size")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            HStack(spacing: 65) {
                ForEach(sizes) { size in
                    Button(action: {
                        withAnimation(.spring()) {
                            coffee.selectedSize = size
                        }
                    }){
                        VStack{
                            Text(size.title)
                                .font(.callout.bold())
                                .foregroundColor(coffee.selectedSize.id == size.id ? .white : .black)
                                .frame(minWidth: 80, minHeight: 45) // Set a minimum size for the button
                                .background(coffee.selectedSize.id == size.id ? Color("starbucks-rewardgold") : Color.white.opacity(0.3))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("starbucks-rewardgold"), lineWidth: 1)
                                )
                            
                            Text("\(String(size.volume)) ml")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .frame(minWidth: 80, minHeight: 40)
                                .offset(CGSize(width: 0, height: -15))
                        }
                    }
                }
            }
            .padding(.top, 10)
        }
    }
}
