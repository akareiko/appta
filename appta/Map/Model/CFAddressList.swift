//
//  Album.swift
//  appta
//
//  Created by Assylzhan Tati on 10/2/23.
//

import SwiftUI

// MARK: Album Model And Sample Data
struct Album: Identifiable {
    var id = UUID().uuidString
    var CFName: String
    var CFImage: String
    var isLiked: Bool = false
}

var albums: [Album] = [
    Album(CFName: "Starbucks", CFImage: "starbucks-logo"),
    Album(CFName: "Costa Coffee", CFImage: "costacoffee-logo"),
    Album(CFName: "Cinnabon", CFImage: "cinnabon-logo"),
    Album(CFName: "ZebraCoffee", CFImage: "zebracoffee-logo"),
    Album(CFName: "CoffeeDay", CFImage: "coffeeday-logo"),
    Album(CFName: "Tim Hortons", CFImage: "timhortons-logo"),
    Album(CFName: "Veneziano", CFImage: "veneziano-logo"),
    Album(CFName: "Arabica", CFImage: "arabica-logo"),
    Album(CFName: "pretamanger", CFImage: "pretamanger-logo")
]
