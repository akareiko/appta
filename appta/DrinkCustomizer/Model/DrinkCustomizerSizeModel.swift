//
//  DrinkCustomizerSizeModel.swift
//  appta
//
//  Created by Assylzhan Tati on 12/4/23.
//

import SwiftUI

struct Size: Identifiable {
    
    var id: String = UUID().uuidString
    var title: String
    var volume: Int

}

var sizes = [
    Size(title: "S", volume: 300),
    Size(title: "M", volume: 400),
    Size(title: "L", volume: 500)
]

