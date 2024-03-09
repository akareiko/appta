//
//  DrinkCustomizerManager.swift
//  appta
//
//  Created by Assylzhan Tati on 3/2/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class DrinkCustomizerManager {
    let coffeeshopId = "mqkKxYkBMX30XJaXgkWn"
    let optionId = "02lP4MavYgP5mV0r1Fjm"
    let optiontypeId = "0vRhpZ3d3RGbFNE24Wn4"
    
    static let shared = DrinkCustomizerManager()
    private init() { }
    
    private let coffeeshopCollection = Firestore.firestore().collection("coffeeshops")
    
    private func coffeeshopDocument(coffeeshopId: String) -> DocumentReference {
        coffeeshopCollection.document(coffeeshopId)
    }
    
    private func optionCollection(coffeeshop_id: String) -> CollectionReference {
        coffeeshopDocument(coffeeshopId: coffeeshop_id).collection("options")
    }
    
    //MARK
    private func optionDocument(coffeeshop_id: String, optionId: String) -> DocumentReference {
        optionCollection(coffeeshop_id: coffeeshop_id).document(optionId)
    }
    
    private func optiontypeCollection(coffeeshop_id: String, optionId: String) -> CollectionReference {
        optionDocument(coffeeshop_id: coffeeshop_id, optionId: optionId).collection("optiontypes")
    }
    
    private func optiontypeDocument(coffeeshop_id: String, optionId: String, optiontypeId: String) -> DocumentReference {
        optiontypeCollection(coffeeshop_id: coffeeshop_id, optionId: optionId).document(optiontypeId)
    }
    
    func getAllOptions(coffeeshop_id: String) async throws -> [Option] {
        let snapshot = try await optionCollection(coffeeshop_id: coffeeshop_id).getDocuments()
        
        let options = try snapshot.documents.map ({ document in
            try document.data(as: Option.self)
        })
        
        return options
    }
    
    func getAllOptiontypes(coffeeshop_id: String, optionId: String) async throws -> [OptionType] {
        let snapshot = try await optiontypeCollection(coffeeshop_id: coffeeshop_id, optionId: optionId).getDocuments()
        
        let optiontypes = try snapshot.documents.map ({ document in
            try document.data(as: OptionType.self)
        })
        
        return optiontypes
    }
}

struct OptionType: Codable, Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var image: String
    var imagegold: String
    var price: Int? = nil
}

struct Option: Codable, Identifiable, Hashable {
    var id: String = UUID().uuidString
    var index: Int
    var title: String
    var image: String
    var imagegold: String
}

var optiontype: [OptionType] = [
    OptionType(name: "Regular Milk", image: "milk", imagegold: "milk-rewardgold", price: nil),
    OptionType(name: "Low Fat Milk", image: "milk", imagegold: "milk-rewardgold", price: nil),
    OptionType(name: "Lactose Free Milk", image: "milk", imagegold: "milk-rewardgold", price: 200),
    OptionType(name: "Coconut Milk", image: "milk", imagegold: "milk-rewardgold", price: 300),
    OptionType(name: "Oat Milk", image: "milk", imagegold: "milk-rewardgold", price: 200),
    OptionType(name: "Soya Milk", image: "milk", imagegold: "milk-rewardgold", price: 300),
    OptionType(name: "Almond Milk", image: "milk", imagegold: "milk-rewardgold", price: 200),
    OptionType(name: "Hazelnut Milk", image: "milk", imagegold: "milk-rewardgold", price: 300)
    
]


