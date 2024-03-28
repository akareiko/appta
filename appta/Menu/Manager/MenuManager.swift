//
//  MenuManager.swift
//  appta
//
//  Created by Assylzhan Tati on 2/21/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class MenuManager {
    static let shared = MenuManager()
    private init() { }
    
    private let coffeeshopCollection = Firestore.firestore().collection("coffeeshops")
    
    private func coffeeshopDocument(coffeeshopId: String) -> DocumentReference {
        coffeeshopCollection.document(coffeeshopId)
    }
    
    private func addressesCollection(coffeeshop_id: String) -> CollectionReference {
        coffeeshopDocument(coffeeshopId: coffeeshop_id).collection("addresses")
    }
    
    private func addressDocument(coffeeshop_id: String, addressId: String) -> DocumentReference {
        addressesCollection(coffeeshop_id: coffeeshop_id).document(addressId)
    }
    
    private func menuCollection(coffeeshop_id: String, addressId: String) -> CollectionReference {
        addressDocument(coffeeshop_id: coffeeshop_id, addressId: addressId).collection("menu")
    }
    
    private func menuDocument(coffeeshop_id: String, addressId: String, menuId: String) -> DocumentReference {
        menuCollection(coffeeshop_id: coffeeshop_id, addressId: addressId).document(menuId)
    }
    
    private func drinklistCollection(coffeeshop_id: String, addressId: String, menuId: String) -> CollectionReference {
        menuDocument(coffeeshop_id: coffeeshop_id, addressId: addressId, menuId: menuId).collection("drinklist")
    }
    
    private func defaultOptionCollection(coffeeshop_id: String) -> CollectionReference {
        coffeeshopDocument(coffeeshopId: coffeeshop_id).collection("defaultOptions")
    }
    
    private func defaultOptionDocument(coffeeshop_id: String, optionId: String) -> DocumentReference {
        defaultOptionCollection(coffeeshop_id: coffeeshop_id).document(optionId)
    }
    
    private func defaultOptiontypeCollection(coffeeshop_id: String, optionId: String) -> CollectionReference {
        defaultOptionDocument(coffeeshop_id: coffeeshop_id, optionId: optionId).collection("optiontypes")
    }
    
    private func defaultOptiontypeDocument(coffeeshop_id: String, optionId: String, defaultOptiontypeId: String) -> DocumentReference {
        defaultOptiontypeCollection(coffeeshop_id: coffeeshop_id, optionId: optionId).document(defaultOptiontypeId)
    }
    
    func getAllTabs(coffeeshop_id: String, addressId: String) async throws -> [TabMenu] {
        let snapshot = try await menuCollection(coffeeshop_id: coffeeshop_id, addressId: addressId).getDocuments()
        
        let tabs = try snapshot.documents.map ({ document in
            try document.data(as: TabMenu.self)
        })
        
        return tabs
    }

    func getAllDrinks(coffeeshop_id: String, addressId: String, menuId: String) async throws -> [DrinksModel] {
        let snapshot = try await drinklistCollection(coffeeshop_id: coffeeshop_id, addressId: addressId, menuId: menuId).getDocuments()
        
        let drinks = try snapshot.documents.map({ document in
            try document.data(as: DrinksModel.self)
        })
        print(drinks)
        return drinks
    }
    
    func getAllOptions(coffeeshop_id: String) async throws -> [Option] {
        let snapshot = try await defaultOptionCollection(coffeeshop_id: coffeeshop_id).getDocuments()
        
        let options = try snapshot.documents.map ({ document in
            try document.data(as: Option.self)
        })
        
        return options
    }
    
    func getAllOptiontypes(coffeeshop_id: String, optionId: String) async throws -> [OptionType] {
        let snapshot = try await defaultOptiontypeCollection(coffeeshop_id: coffeeshop_id, optionId: optionId).getDocuments()
        
        let optiontypes = try snapshot.documents.map ({ document in
            try document.data(as: OptionType.self)
        })
        
        return optiontypes
    }
}

struct DrinksModel: Codable, Identifiable, Hashable {
    var id: String 
    var image: String
    var title: String
    var description: String
    var prices: [Int]
    var drinksize: [Int]
    var status: Bool
}

struct TabMenu: Codable, Identifiable, Hashable{
    var id: String = UUID().uuidString
    var tab: String
}

