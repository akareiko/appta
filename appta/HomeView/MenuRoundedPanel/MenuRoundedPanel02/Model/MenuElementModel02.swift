//
//  MenuElementModel02.swift
//  appta
//
//  Created by Assylzhan Tati on 10/25/23.
//

import Foundation

struct ElementModel02: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var text: String
}

var Element02: [ElementModel02] = [
    .init(image: "creditcard", text: "Credit Card"),
    .init(image: "gift", text: "Reward"),
    .init(image: "cart", text: "Payment"),
    .init(image: "basket", text: "Basket")
]
   
