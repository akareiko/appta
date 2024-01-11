//
//  BasketModel.swift
//  appta
//
//  Created by Assylzhan Tati on 1/3/24.
//

import SwiftUI

struct OrderModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var title: String
    var price: Int
    var volume: String
    var quantity: Int
    var customization: String
}

var ordermodel : [OrderModel] = [
    .init(image: "starbucks-americano", title: "Americano", price: 800, volume: "300 ml", quantity: 1, customization: ""),
    .init(image: "starbucks-latte", title: "Latte", price: 1200, volume: "400 ml", quantity: 1, customization: ""),
    .init(image: "starbucks-cappucino", title: "Cappucino", price: 2000, volume: "500 ml", quantity: 1, customization: ""),
    .init(image: "starbucks-hot-chocolate", title: "Hot Chocolate", price: 1500, volume: "400 ml", quantity: 1, customization: ""),
    .init(image: "starbucks-pumpkin-spice-cream-cold-brew", title: "Pumpkin Spice Cream Cold Brew", price: 2500, volume: "500 ml", quantity: 1, customization: ""),
    .init(image: "starbucks-raf", title: "Raf", price: 1100, volume: "300 ml", quantity: 1, customization: "")
    
//    .init(image: "circle_04", title: "Coffee man", text: "Гранде в подарок", totalScore: 10, currentScore: 8),
//    .init(image: "circle_05", title: "Coffee woman", text: "Любой напиток в подарок", totalScore: 12, currentScore: 3),
//    .init(image: "circle_06", title: "Cappucino rash", text: "Любой напиток в подарок", totalScore: 12, currentScore: 7),
//    .init(image: "circle_07", title: "Бесплатный рефилл", text: "Мерч в подарок", totalScore: 12, currentScore: 7),
//    .init(image: "circle_08", title: "Coffee man", text: "Гранде в подарок", totalScore: 10, currentScore: 8),
//    .init(image: "circle_05", title: "Coffee woman", text: "Любой напиток в подарок", totalScore: 12, currentScore: 3),
]

struct BasketModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
}
