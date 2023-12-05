//
//  MenuRoundedPanel09Model.swift
//  appta
//
//  Created by Assylzhan Tati on 11/30/23.
//

import SwiftUI

struct MenuRoundedPanelModel09: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var title: String
    var text: String
    var color: String
}

var MenuRPmodel09: [MenuRoundedPanelModel09] = [
    .init(image: "", title: "Seasonal", text: "Coffee comes from subcontinental area", color: "starbucks-white"),
    .init(image: "", title: "Ocean Layout", text: "Maybe coffee is not the best drink to have in the ocean, but it's definetly worth trying", color: "starbucks-white"),
    .init(image: "", title: "Paris to Rome", text: "Try your coffee in different places, it tastes different", color: "starbucks-white"),
    .init(image: "", title: "Bluorine", text: "Bluorine sounds like a cool thing but i made it up", color: "starbucks-white"),
    .init(image: "", title: "Cordoroy Cordomom", text: "Cordomom is one of the best speci for your favourite drinks", color: "starbucks-white"),
]
