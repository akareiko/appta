//
//  OptionScrollModel.swift
//  appta
//
//  Created by Assylzhan Tati on 12/4/23.
//

import SwiftUI

struct OptionType: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var image: String
    var image_gold: String
    var price: Int?
}

struct Option: Identifiable, Hashable {
    var id = UUID().uuidString
    var index: Int
    var title: String
    var image: String
    var image_gold: String
    var optionTypes: [OptionType]
}

var optionscroll: [Option] = [
    .init(
        index: 0,
        title: "Milk",
        image: "milk",
        image_gold: "milk-rewardgold",
        optionTypes: [
            OptionType(name: "Regular Milk", image: "milk", image_gold: "milk-rewardgold", price: nil),
            OptionType(name: "Low Fat Milk", image: "milk", image_gold: "milk-rewardgold", price: nil),
            OptionType(name: "Lactose Free Milk", image: "milk", image_gold: "milk-rewardgold", price: 200),
            OptionType(name: "Coconut Milk", image: "milk", image_gold: "milk-rewardgold", price: 300),
            OptionType(name: "Oat Milk", image: "milk", image_gold: "milk-rewardgold", price: 200),
            OptionType(name: "Soya Milk", image: "milk", image_gold: "milk-rewardgold", price: 300),
            OptionType(name: "Almond Milk", image: "milk", image_gold: "milk-rewardgold", price: 200),
            OptionType(name: "Hazelnut Milk", image: "milk", image_gold: "milk-rewardgold", price: 300)
        ]
    ),
    .init(
        index: 1,
        title: "Syrup",
        image: "syrup",
        image_gold: "syrup-rewardgold",
        optionTypes: [
            OptionType(name: "None", image: "none", image_gold: "none-rewardgold", price: nil),
            OptionType(name: "Caramel Syrup", image: "syrup", image_gold: "syrup-rewardgold", price: 100),
            OptionType(name: "Vanila Syrup", image: "syrup", image_gold: "syrup-rewardgold", price: 150),
            OptionType(name: "Hazelnut Syrup", image: "syrup", image_gold: "syrup-rewardgold", price: 100),
            OptionType(name: "Maple Syrup", image: "syrup", image_gold: "syrup-rewardgold", price: 200),
            OptionType(name: "Lavender Syrup", image: "syrup", image_gold: "syrup-rewardgold", price: 200),
        ]
    ),
    .init(
        index: 2,
        title: "Temperature",
        image: "temperature",
        image_gold: "temperature-rewardgold",
        optionTypes: [
            OptionType(name: "Hot", image: "temperature", image_gold: "temperature-red", price: nil),
            OptionType(name: "Cold", image: "temperature", image_gold: "temperature-lightblue", price: nil),
        ]
    ),
    .init(
        index: 3,
        title: "Blend",
        image: "blend",
        image_gold: "blend-rewardgold",
        optionTypes: [
            OptionType(name: "Arabica", image: "blend", image_gold: "blend-rewardgold", price: nil),
            OptionType(name: "Robusta", image: "blend", image_gold: "blend-rewardgold", price: 100),
            OptionType(name: "Excelsa", image: "blend", image_gold: "blend-rewardgold", price: 200),
            OptionType(name: "Liberica", image: "blend", image_gold: "blend-rewardgold", price: 150),
        ]
    ),
    .init(
        index: 4,
        title: "Strength",
        image: "coffeebeans",
        image_gold: "coffeebeans-rewardgold",
        optionTypes: [
            OptionType(name: "One Shot", image: "coffeebeans", image_gold: "coffeebeans-rewardgold", price: nil),
            OptionType(name: "Double Shot", image: "coffeebeans", image_gold: "coffeebeans-rewardgold", price: 200),
        ]
    ),
    
]
