//
//  RewardModel.swift
//  appta
//
//  Created by Assylzhan Tati on 12/24/23.
//

import SwiftUI

struct RewardModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var title: String
    var text: String
    var totalScore: Int
    var currentScore: Int
}

var rewardmodel : [RewardModel] = [
    .init(image: "circle_01", title: "Награды Дня Рождения", text: "Гранде в подарок", totalScore: 10, currentScore: 8),
    .init(image: "circle_02", title: "Бесплатный напиток", text: "Мерч в подарок", totalScore: 12, currentScore: 3),
    .init(image: "circle_03", title: "Бесплатный рефилл", text: "Мерч в подарок", totalScore: 12, currentScore: 7),
    .init(image: "circle_04", title: "Coffee man", text: "Гранде в подарок", totalScore: 10, currentScore: 8),
    .init(image: "circle_05", title: "Coffee woman", text: "Любой напиток в подарок", totalScore: 12, currentScore: 3),
    .init(image: "circle_06", title: "Cappucino rash", text: "Любой напиток в подарок", totalScore: 12, currentScore: 7),
    .init(image: "circle_07", title: "Бесплатный рефилл", text: "Мерч в подарок", totalScore: 12, currentScore: 7),
    .init(image: "circle_08", title: "Coffee man", text: "Гранде в подарок", totalScore: 10, currentScore: 8),
    .init(image: "circle_05", title: "Coffee woman", text: "Любой напиток в подарок", totalScore: 12, currentScore: 3),
]

//
//  ScrollableTab.swift
//  ImageViewer
//
//  Created by Assylzhan Tati on 12/25/23.
//

enum ScrollableTab: String, CaseIterable {
    case rewards = "Rewards"
    case acheived = "Achieved"
    case bonuses = "Bonuses"
    
    var systemImage: String {
        switch self {
        case .rewards:
            return "star"
        case .acheived:
            return "clock.arrow.circlepath"
        case .bonuses:
            return "gift"
        }
    }
}

