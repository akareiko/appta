import SwiftUI
import CoreLocation
import Foundation

struct PlansModel: Identifiable {
    var id: UUID = .init()
    var imageName: String
    var names: String
}

struct PlanPlan: Hashable, Codable, Identifiable {
    var id: Int
    var imageName: String
    var title: String
    var description: String
    var price: String
}
