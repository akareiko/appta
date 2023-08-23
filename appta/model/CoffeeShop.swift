/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A representation of a single landmark.
*/

import Foundation
import SwiftUI
import CoreLocation

struct CoffeeShop: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var city: String

    var category: Category
    enum Category: String, CaseIterable, Codable {
        case featured = "Featured"
        case special = "Special Offer"
        case new = "New"
    }

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
