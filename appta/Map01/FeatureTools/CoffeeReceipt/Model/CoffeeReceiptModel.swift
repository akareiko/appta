//
//  CoffeeReceiptModel.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//

import SwiftUI

struct CoffeeReceiptModel: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
}

var receipt: [CoffeeReceiptModel] = [
    .init(title: "Decaf"),
    .init(title: "Decaf"),
    .init(title: "Decaf"),
    .init(title: "Decaf"),
    .init(title: "Decaf"),
    .init(title: "Decaf"),
]



