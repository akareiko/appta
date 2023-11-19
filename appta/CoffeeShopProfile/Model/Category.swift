//
//  Category.swift
//  Appta
//
//  Created by Assylzhan Tati on 11/18/23.
//

import SwiftUI

struct Category: Identifiable {
    
    var id: String = UUID().uuidString
    var title: String

}

var categories = [
    Category(title: "Specials"),
    Category(title: "Hot Coffee"),
    Category(title: "Ice Coffee"),
    Category(title: "Tea"),
    Category(title: "Sandwich"),
    Category(title: "Desserts"),
]

