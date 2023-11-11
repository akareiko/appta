//
//  MenuRoundedPanelModel04.swift
//  appta
//
//  Created by Assylzhan Tati on 11/11/23.
//

import SwiftUI

struct MenuRoundedPanelModel04: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var title: String
}

var MenuRPmodel04: [MenuRoundedPanelModel04] = [
    .init(image: "circle_01", title: "Our Menu"),
    .init(image: "circle_02", title: "Merchandise"),
    .init(image: "circle_03", title: "Stores"),
    .init(image: "circle_04", title: "Promotion"),
    .init(image: "circle_05", title: "Gift Cards"),
    .init(image: "circle_06", title: "Rewards"),
    .init(image: "circle_07", title: "About"),
    .init(image: "circle_08", title: "Boxes")
]
