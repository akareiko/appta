//
//  RewardModel03.swift
//  appta
//
//  Created by Assylzhan Tati on 10/25/23.
//

import SwiftUI

struct ElementModel03: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var title: String
    var text: String
    var totalScore: Int
    var currentScore: Int
}

var Element03 : [ElementModel03] = [
    .init(image: "circle_01", title: "Birthday Rewards", text: "A complementary grande", totalScore: 10, currentScore: 8),
    .init(image: "circle_02", title: "Reedem free drink", text: "A complementary merchandise", totalScore: 12, currentScore: 3),
    .init(image: "circle_03", title: "Free in store refill", text: "A complementary merchandise", totalScore: 12, currentScore: 7)
]
