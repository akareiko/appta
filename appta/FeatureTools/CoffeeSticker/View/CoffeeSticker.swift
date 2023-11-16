//
//  CoffeeSticker.swift
//  appta
//
//  Created by Assylzhan Tati on 11/11/23.
//

import SwiftUI

struct CustomCoffeeReceipt: View {
    var body: some View {
        VStack(){
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 250, height: 350)
                .foregroundColor(.white)
                .shadow(radius: 3)
                .overlay(content:{
                    VStack(alignment: .leading){
                        Text("Item 1 of 8")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                        
                        Text("Items in order: 1")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("* Iskendir *")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                        
                        Text("Iced Quad Espresso")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("5 pumps Toffee Nut Syrup")
                            .font(.footnote)
                            .fontWeight(.bold)
                        
                        Text("3 pumps Vanilla")
                            .font(.footnote)
                            .fontWeight(.bold)
                        
                        Text("With 2% Milk")
                            .font(.footnote)
                            .fontWeight(.bold)
                        
                        Text("Van Sc Cold Fm")
                            .font(.footnote)
                            .fontWeight(.bold)
                        
                        Text("In a Venti Cup")
                            .font(.footnote)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("< MOBILE >")
                            .font(.callout)
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                    }
                    .padding()
                    .offset(CGSize(width: -10.0, height: 0.0))
                })
        }
    }
}

#Preview {
    CustomCoffeeReceipt()
}
