//
//  MenuRoundedElements02.swift
//  appta
//
//  Created by Assylzhan Tati on 10/24/23.
//

import SwiftUI

struct MenuRewardModel02: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var title: String
    var text: String
}

var menuReward02 : [MenuRewardModel02] = [
    .init(image: "rewards_01", title: "Fun Freebies", text: "Not only can you earn free coffee, look forward to a birthday treat plus coffee and tea refills."),
    .init(image: "rewards_02", title: "Order & pay ahead", text: "Enjoy the convenience of in-store, curbside or drive-thru pickup at select stores."),
    .init(image: "rewards_03", title: "Get to free faster", text: "Earn Stars even quicker with Bonus Star challenges, Double Star Days and exciting games.")
]
