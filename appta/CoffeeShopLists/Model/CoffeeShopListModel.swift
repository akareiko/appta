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
    var num_rest: Int
}

var coffeeshoplist: [CoffeeShopListModel] = [
    .init(image: "starbucks-horizontal", title: "Starbucks", num_rest: 9),
    .init(image: "pretamanger-horizontal", title: "Pret A Manger", num_rest: 3),
    .init(image: "arabica-horizontal", title: "Arabica", num_rest: 2),
    .init(image: "costacoffee-horizontal", title: "Costa Coffee", num_rest: 5),
    .init(image: "timhortons-horizontal", title: "Tim Horton's", num_rest: 4),
    
]

