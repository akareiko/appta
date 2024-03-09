//
//  CoffeeShopAddressesManager.swift
//  appta
//
//  Created by Assylzhan Tati on 2/27/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class CoffeeShopAddressesManager {
    static let shared = CoffeeShopAddressesManager()
    private init() { }
    
    private let coffeeshopCollection = Firestore.firestore().collection("coffeeshops")
    
    private func coffeeshopDocument(coffeeshopId: String) -> DocumentReference {
        coffeeshopCollection.document(coffeeshopId)
    }
    
    func getCoffeeShopData(coffeeshopId: String) async throws -> CoffeeShopDataModel {
        let documentSnapshot = try await coffeeshopDocument(coffeeshopId: coffeeshopId).getDocument()
        
        return try documentSnapshot.data(as: CoffeeShopDataModel.self)
        
    }
    
    private func addressesCollection(coffeeshop_id: String) -> CollectionReference {
        coffeeshopDocument(coffeeshopId: coffeeshop_id).collection("addresses")
    }
    
    func getAllAddresses(coffeeshop_id: String) async throws -> [AddressModel] {
        let snapshot = try await addressesCollection(coffeeshop_id: coffeeshop_id).getDocuments()
        
        let addresses = try snapshot.documents.map ({ document in
            try document.data(as: AddressModel.self)
        })
        
        return addresses
    }
}

struct AddressModel: Codable, Identifiable, Hashable{
    var id: String = UUID().uuidString
    var address_name: String
}

struct CoffeeShopDataModel: Codable, Identifiable, Hashable {
    var id: String = UUID().uuidString
    var description: String
    var image_url: String
    var name: String
    var pattern: String
    var color: String
}

enum CoffeeShopError: Error {
    case documentNotFound
    // Add more cases as needed
}
