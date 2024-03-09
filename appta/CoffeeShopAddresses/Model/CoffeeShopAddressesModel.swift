//
//  CoffeeShopAddressesModel.swift
//  appta
//
//  Created by Assylzhan Tati on 1/8/24.
//

import SwiftUI

//var addressmodel : [AddressModel] = [
//    .init(logo: "starbucks-logo", title: "Starbucks", address: "Dostyk street, 16"),
//    .init(logo: "starbucks-logo", title: "Starbucks", address: "MEGA Silk Way Mall, Kabanbay Batry street, 62"),
//    .init(logo: "starbucks-logo", title: "Starbucks", address: "Khan Shatyr Mall, Turan street, 37"),
//    .init(logo: "starbucks-logo", title: "Starbucks", address: "Keruen Mall, Dostyk street, 9"),
//    .init(logo: "starbucks-logo", title: "Starbucks", address: "Dinmukhamed Konaev street, 10"),
//    .init(logo: "starbucks-logo", title: "Starbucks", address: "Kabanbay Batyra street, 119"
//]

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





