//
//  RewardCarouselModel.swift
//  appta
//
//  Created by Assylzhan Tati on 10/23/23.
//

import SwiftUI

struct RewardCarouselModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var text: String
}

var RewardCarousels: [RewardCarouselModel] = [
    .init(image: "rewards-carousel01", text: "Let us treat you—earn and \nredeem Stars for free \ndrinks, food and more."),
    .init(image: "rewards-carousel02", text: "Customize your order in \nthe app and pick it up \nwhen it’s ready."),
    .init(image: "rewards-carousel03", text: "Stop in on your birthday \nfor a special treat on the \nhouse.")
]
