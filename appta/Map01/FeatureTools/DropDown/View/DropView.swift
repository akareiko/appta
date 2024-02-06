//
//  DropView.swift
//  ImageViewer
//
//  Created by Assylzhan Tati on 1/11/24.
//

import SwiftUI

struct DropView: View {
    @State private var selection: String?
    var body: some View {
        NavigationStack{
            VStack(spacing: 15){
                DropDownPickerView(
                    hint: "Payment Method",
                    options: [
                    PaymentOption(title: "Pay with Card", subtitle: "Visa, MasterCard", icon: "Cardadd_logo", images: []),
                    PaymentOption(title: "Get the credit", subtitle: "Halyk Credit", icon: "Halyk_logo", images: []),
                    PaymentOption(title: "Kaspi.kz", subtitle: "Gold, Credit", icon: "Kaspi_logo", images: []),
                    PaymentOption(title: "UnionPay", subtitle: "You must already have a valid UnionPay card", icon: "Unionpay_logo", images: []),
                    PaymentOption(title: "Apple Pay", subtitle: "", icon: "Applepay_logo", images: []),
                    ],
                    anchor: .top,
                    selection: $selection
                )
            }
        }
    }
}

#Preview {
    DropView()
}
