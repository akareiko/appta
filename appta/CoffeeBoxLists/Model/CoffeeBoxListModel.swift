//
//  CoffeeShopListModel.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//

import SwiftUI

struct CoffeeBoxListModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var title: String
    var num_rest: Int
}

var coffeeboxlist: [CoffeeBoxListModel] = [
    .init(image: "coffeebox01", title: "Seasonal", num_rest: 9),
    .init(image: "coffeebox02", title: "Ocean Layout", num_rest: 3),
    .init(image: "coffeebox03", title: "Paris to Rome", num_rest: 2),
    .init(image: "coffeebox04", title: "Davines", num_rest: 5),
    .init(image: "coffeebox05", title: "Bluorine", num_rest: 4),
    
]

