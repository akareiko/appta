//
//  MenuRoundedPanelModel07.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//

import SwiftUI

struct MenuRoundedPanelModel07: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var title: String
}

var MenuRPmodel07: [MenuRoundedPanelModel07] = [
    .init(image: "coffeebox01", title: "Seasonal"),
    .init(image: "coffeebox02", title: "Ocean Layout"),
    .init(image: "coffeebox03", title: "Paris to Rome"),
    .init(image: "coffeebox04", title: "Davines"),
    .init(image: "coffeebox05", title: "Bluorine"),
]
