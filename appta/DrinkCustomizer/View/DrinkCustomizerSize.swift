//
//  DrinkCustomizerSize.swift
//  appta
//
//  Created by Assylzhan Tati on 12/4/23.
//

import SwiftUI

struct DrinkCustomizerSize: View {
    @State private var selectedSize: Size = sizes.first!
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("Size")
                    .font(.title3.bold())
                
                Text("Choose your favourite size")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 20)
            
            HStack(spacing: 65) {
                ForEach(sizes) { size in
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedSize = size
                        }
                    }) {
                        Text(size.title)
                            .font(.callout.bold())
                            .foregroundColor(selectedSize.id == size.id ? .white : .black)
                            .frame(minWidth: 80, minHeight: 45) // Set a minimum size for the button
                            .background(selectedSize.id == size.id ? Color("starbucks-rewardgold") : Color.white.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 5)) // Rounded rectangle shape
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("starbucks-rewardgold"), lineWidth: 1)
                            )
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
        }
        
    }
}


#Preview {
    DrinkCustomizerSize()
}
