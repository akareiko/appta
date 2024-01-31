//
//  PaymentView.swift
//  appta
//
//  Created by Legato on 31.01.2024.
//

import SwiftUI

struct PaymentView: View {
    @State private var cardNumber: String = "4444 4444 4444 4444"
    @State private var cvvNumber: String = "666"
    @State private var dueDateNumber: String = "05/25"
    
    var body: some View {
        Text("Эта страница находится на полном обеспечении CloudPlayments")
        
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.ultraThinMaterial)
                .frame(width: 200, height: 70)
            Text(cardNumber)
                .foregroundColor(.black)
        }
        
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.ultraThinMaterial)
                .frame(width: 200, height: 70)
            Text(cvvNumber)
                .foregroundColor(.black)
        }
        
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.ultraThinMaterial)
                .frame(width: 200, height: 70)
            Text(dueDateNumber)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    PaymentView()
}
