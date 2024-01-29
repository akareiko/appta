/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Storage for model data.
*/

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var coffeeshops: [CoffeeShop] = load("coffeeshops.json")


    var categories: [String: [CoffeeShop]] {
        Dictionary(
            grouping: coffeeshops,
            by: { $0.category.rawValue }
        )
    }
}

final class ModelModelData: ObservableObject {
    @Published var plansplans: [PlanPlan] = load("hehehehe.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
