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
    var customizedPrice: Int
    var drinkSize: Int
    var address: String
    var optionArray: [Int : OptionType]
}

var ordermodel : [OrderModel] = [
    
]

struct BasketModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
}
