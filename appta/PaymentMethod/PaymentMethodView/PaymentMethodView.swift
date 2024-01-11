//
//  PaymentMethodView.swift
//  appta
//
//  Created by Assylzhan Tati on 1/5/24.
//

import SwiftUI

struct PaymentMethodView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
//        NavigationStack{
            VStack(alignment: .leading){
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
                .offset(CGSize(width: -60, height: -330))
                
                Text("Choose Your Payment Method")
                    .font(.callout)
                
                Text("")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
//        }
    }
}

#Preview {
    PaymentMethodView()
}
