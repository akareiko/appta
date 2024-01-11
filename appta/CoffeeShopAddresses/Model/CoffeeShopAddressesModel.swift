//
//  CoffeeShopAddressesModel.swift
//  appta
//
//  Created by Assylzhan Tati on 1/8/24.
//

import SwiftUI

struct AddressModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var logo: String
    var title: String
    var address: String
}

var addressmodel : [AddressModel] = [
    .init(logo: "starbucks-logo", title: "Starbucks", address: "Dostyk street, 16"),
    .init(logo: "starbucks-logo", title: "Starbucks", address: "MEGA Silk Way Mall, Kabanbay Batry street, 62"),
    .init(logo: "starbucks-logo", title: "Starbucks", address: "Khan Shatyr Mall, Turan street, 37"),
    .init(logo: "starbucks-logo", title: "Starbucks", address: "Keruen Mall, Dostyk street, 9"),
    .init(logo: "starbucks-logo", title: "Starbucks", address: "Dinmukhamed Konaev street, 10"),
    .init(logo: "starbucks-logo", title: "Starbucks", address: "Kabanbay Batyra street, 119")
    
//    .init(image: "circle_04", title: "Coffee man", text: "Гранде в подарок", totalScore: 10, currentScore: 8),
//    .init(image: "circle_05", title: "Coffee woman", text: "Любой напиток в подарок", totalScore: 12, currentScore: 3),
//    .init(image: "circle_06", title: "Cappucino rash", text: "Любой напиток в подарок", totalScore: 12, currentScore: 7),
//    .init(image: "circle_07", title: "Бесплатный рефилл", text: "Мерч в подарок", totalScore: 12, currentScore: 7),
//    .init(image: "circle_08", title: "Coffee man", text: "Гранде в подарок", totalScore: 10, currentScore: 8),
//    .init(image: "circle_05", title: "Coffee woman", text: "Любой напиток в подарок", totalScore: 12, currentScore: 3),
]

enum ScrollableAddressTab: String, CaseIterable {
    case list = "List"
    case map = "Map"
    
    var systemImage: String {
        switch self {
        case .list:
            return "line.3.horizontal"
        case .map:
            return "map.fill"
        }
    }
}

struct BasketModel1: Identifiable, Hashable{
    var id: String = UUID().uuidString
}
