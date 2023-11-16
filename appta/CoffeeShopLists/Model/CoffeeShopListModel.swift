//
//  CoffeeShopListModel.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//

import SwiftUI

struct CoffeeShopListModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var title: String
    var raiting: String
}

var coffeeshoplist: [CoffeeShopListModel] = [
    .init(image: "starbucks-horizontal", title: "Starbucks", raiting: "4.8"),
    .init(image: "costacoffee-horizontal", title: "Costa Coffee", raiting: "4.5"),
    .init(image: "arabica-horizontal", title: "Arabica", raiting: "5.0"),
    .init(image: "timhortons-horizontal", title: "Tim Horton's", raiting: "4.9"),
    .init(image: "pretamanger-horizontal", title: "Pret A Manger", raiting: "4.8"),
]

