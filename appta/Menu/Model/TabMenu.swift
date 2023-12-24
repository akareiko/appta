//
//  Tab.swift
//  ImageViewer
//
//  Created by Assylzhan Tati on 12/15/23.
//

import SwiftUI

struct Food: Identifiable {
    var id = UUID().uuidString
    var title: String
    var price: String
    var image: String
}

var foods = [
    Food(title: "Americano", price: "600", image: "starbucks-americano"),
    Food(title: "Cappucino", price: "900", image: "starbucks-cappucino"),
    Food(title: "Latte", price: "1100", image: "starbucks-latte"),
    Food(title: "Coldbrew", price: "1000", image: "starbucks-cold-brew"),
    Food(title: "Raf", price: "1200", image: "starbucks-raf"),
    Food(title: "Caramel Ribbon Crunch Frappucino", price: "1500", image: "starbucks-caramel-ribbon-crunch-frappuccino"),
    Food(title: "Cinnamon Latte", price: "1600", image: "starbucks-cinnamon-latte"),
    Food(title: "Iced Pumpkin Spice Latte", price: "1500", image: "starbucks-iced-pumpkin-spice-latte"),
    Food(title: "Mocha Cookie Crumble Frappucino", price: "1400", image: "starbucks-mocha-cookie-crumble-frappuccino"),
    Food(title: "Pumpkin Spice Cream Cold Brew", price: "1300", image: "starbucks-pumpkin-spice-cream-cold-brew"),
    Food(title: "Pumpkin Spice Latte", price: "1600", image: "starbucks-pumpkin-spice-latte"),
    Food(title: "White Chocolate Mocha Frappucino", price: "1800", image: "starbucks-white-chocolate-mocha-frappuccino"),
]

// Tab Model...
struct TabMenu: Identifiable {
    var id = UUID().uuidString
    var tab: String
    var foods: [Food]
}

// Tab Items...
var tabsItems = [
    TabMenu(tab: "Home Style", foods: foods.shuffled()),
    TabMenu(tab: "Promotions", foods: foods.shuffled()),
    TabMenu(tab: "Black Coffee", foods: foods.shuffled()),
    TabMenu(tab: "White Coffee", foods: foods.shuffled()),
    TabMenu(tab: "Cold Drinks", foods: foods.shuffled()),
    TabMenu(tab: "Matcha", foods: foods.shuffled()),
    TabMenu(tab: "Signature Drinks", foods: foods.shuffled()),
    TabMenu(tab: "Tea", foods: foods.shuffled()),
    TabMenu(tab: "Hot Chocolate", foods: foods.shuffled()),
    TabMenu(tab: "Add Ons", foods: foods.shuffled()),
]
