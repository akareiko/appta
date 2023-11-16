//
//  MenuRoundedPanelModel05.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//

import SwiftUI

struct MenuRoundedPanelModel05: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var title: String
}

var MenuRPmodel05: [MenuRoundedPanelModel05] = [
    .init(image: "starbucks-horizontal", title: "Starbucks"),
    .init(image: "costacoffee-horizontal", title: "Costa Coffee"),
    .init(image: "timhortons-horizontal", title: "Tim Hortons"),
    .init(image: "arabica-horizontal", title: "Arabica"),
    .init(image: "pretamanger-horizontal", title: "Pret A Manger"),
]
