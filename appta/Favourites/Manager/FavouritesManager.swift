//
//  FavouritesManager.swift
//  appta
//
//  Created by Assylzhan Tati on 2/28/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class FavouritesManager {
    static let shared = FavouritesManager()
    private init() { }
    
    private let usersCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        usersCollection.document(userId)
    }
    
    private func chosenCoffeeshopCollection(userId: String) -> CollectionReference {
        userDocument(userId: userId).collection("chosen_coffeeshops")
    }
    
    private func chosenCoffeeshopDocument(userId: String, addressId: String) -> DocumentReference {
        chosenCoffeeshopCollection(userId: userId).document(addressId)
    }
    
    private func favouritesCollection(userId: String, addressId: String) -> CollectionReference {
        chosenCoffeeshopDocument(userId: userId, addressId: addressId).collection("favourites")
    }
    
    func getAllTabs(userId: String, addressId: String) async throws -> [OrderModel] {
        let snapshot = try await favouritesCollection(userId: userId, addressId: addressId).getDocuments()
        
        let favourites = try snapshot.documents.map ({ document in
            try document.data(as: OrderModel.self)
        })
        
        return favourites
    }
}

struct OrderModel: Codable, Identifiable, Hashable{
    var id: String = UUID().uuidString
    var drink: DrinksModel
    var customizedPrice: Int
    var drinkSizeIndex: Int
    var quantity: Int
    var address: String
    var optionArray: [Option : OptionType]
}
