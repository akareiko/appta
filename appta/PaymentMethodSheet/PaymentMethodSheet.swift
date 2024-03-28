//
//  PlaceOrderSheet.swift
//  appta
//
//  Created by Assylzhan Tati on 3/22/24.
//

import SwiftUI

struct PaymentMethodSheet: View {
    
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                Text("Payment Method")
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 10)
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Circle()
                        .frame(width: 30)
                        .foregroundColor(.black)
                        .overlay(
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                        )
                }
            }
            
            HStack(spacing: 10){
                Image("visa")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, 20)
                
                VStack(alignment: .leading){
                    Text("Credit Card")
                        .font(.headline.bold())
                        .foregroundColor(.primary)
                    
                    Text("4400 •••• •••• 5611")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "circle")
                    .foregroundColor(.primary)
                    .padding(.horizontal, 20)
            }
            .frame(height: 70)
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .foregroundColor(.clear)
            
            Button {
                
            } label: {
                HStack(spacing: 10){
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.primary)
                        .padding(.leading, 20)
                    
                    Text("Add another payment method")
                        .font(.headline.bold())
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.primary)
                        .padding(.horizontal, 20)
                }
                .frame(height: 70)
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .foregroundColor(.clear)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PaymentMethodSheet()
}
