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

}

var sizes = [
    Size(title: "S"),
    Size(title: "M"),
    Size(title: "L")
]

