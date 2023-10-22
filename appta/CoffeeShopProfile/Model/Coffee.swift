//
//  Milkshake.swift
//  appta
//
//  Created by Assylzhan Tati on 9/28/23.
//

import SwiftUI

struct Coffee: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var title: String
    var price: String
    var image: String
}

var coffees: [Coffee] = [
    .init(title: "Milk Frappe", price: "$26.99", image: "Caramel-Brule-Latte"),
    .init(title: "Frappucino", price: "$49.99", image: "Gingerbread-Latte-1"),
    .init(title: "Espresso", price: "$19.99", image: "Irish-Cream-Americano-"),
    .init(title: "Creme Frappucino", price: "$39.99", image: "Irish-Cream-Cold-Brew"),
    .init(title: "Milk & Chocolate Frappe", price: "$29.99", image: "Peppermint-Mocha")
]
