//
//  ElementModel.swift
//  appta
//
//  Created by Assylzhan Tati on 10/22/23.
//

import SwiftUI

struct ElementModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var text: String
    var color: String
}

var Element : [ElementModel] = [
    .init(image: "creditcard", text: "Payment", color: "starbucks-rewardgold"),
    .init(image: "star", text: "Reward", color: "starbucks-rewardgold"),
    .init(image: "basket", text: "Shop", color: "starbucks-rewardgold")
]
    
