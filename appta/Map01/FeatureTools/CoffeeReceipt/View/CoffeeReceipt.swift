//
//  CustomCoffeeReceipt.swift
//  appta
//
//  Created by Assylzhan Tati on 11/11/23.
//

import SwiftUI

struct CoffeeReceipt: View {
    @State var receipt: [CoffeeReceiptModel]
    var body: some View {
        VStack(){
            RoundedRectangle(cornerRadius: 15.0)
                .frame(width: 180, height: 370)
                .foregroundColor(.white)
                .shadow(radius: 3)
                .overlay(content:{
                    Rectangle()
                        .frame(width: 150, height: 340)
                        .foregroundColor(Color("starbucks-ceramic").opacity(0.3))
                    VStack(spacing: 4){
                        ForEach(receipt){thing in
                            Text(thing.title)
                                .font(.callout)
                            
                            Rectangle()
                                .stroke(Color.black.opacity(0.6), lineWidth: 2)
                                .padding(2)
                                .frame(width: 45, height: 25)
                            
                        }
                    }
                    .padding(.bottom, 10)
                })
        }
    }
}

#Preview {
    CoffeeReceipt(receipt: receipt)
}
