//
//  CoffeeShopImageModel.swift
//  appta
//
//  Created by Assylzhan Tati on 10/7/23.
//

import SwiftUI

struct CoffeeShopImageModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
}

var coffeeshopimage: [CoffeeShopImageModel] = [
    .init(image: "starbucks"),
    .init(image: "starbucks2"),
    .init(image: "starbucks3"),
    .init(image: "starbucks4")
]
