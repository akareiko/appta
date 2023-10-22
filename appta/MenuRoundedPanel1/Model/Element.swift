//
//  Element.swift
//  appta
//
//  Created by Assylzhan Tati on 10/22/23.
//

import SwiftUI

struct ElementModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var text: String
}

var Element : [ElementModel] = [
    .init(image: "creditcard", text: "Credit Card"),
    .init(image: "bag", text: "Bag"),
    .init(image: "cart", text: "Cart"),
    .init(image: "basket", text: "Basket")
]
    
