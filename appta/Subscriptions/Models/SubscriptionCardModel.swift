//
//  SubscriptionCardModel.swift
//  appta
//
//  Created by Assylzhan Tati on 10/6/23.
//

import SwiftUI

struct SubscriptionCardModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var color: String
    var pattern: String
}

var SubscriptionCards: [SubscriptionCardModel] = [
    .init(image: "starbucks-logo", color: "starbucks-green", pattern: "subscriptioncard-pattern01"),
    .init(image: "timhortons-logo", color: "timhortons-red", pattern: "subscriptioncard-pattern02"),
    .init(image: "costacoffee-logo", color: "costacoffee-purple", pattern: "subscriptioncard-pattern01"),
    .init(image: "pretamanger-logo", color: "pretamanger-red", pattern: "subscriptioncard-pattern03"),
    .init(image: "coffeeday-logo", color: "coffeeday-green", pattern: "subscriptioncard-pattern01"),
    .init(image: "", color: "starbucks-black", pattern: "subscriptioncard-pattern01"),
]

