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
    
    func getAllTabs(coffeeshop_id: String, addressId: String) async throws -> [TabMenuuu] {
        let snapshotTabs = try await menuCollection(coffeeshop_id: coffeeshop_id, addressId: addressId).getDocuments()

        var tabMenuArray: [TabMenuuu] = []

        for document in snapshotTabs.documents {
            let tempTab: TabMenuuu = TabMenuuu()
            tempTab.tabmenu = try document.data(as: TabMenu.self)
            let snapshotDrinks = try await drinklistCollection(coffeeshop_id: coffeeshop_id, addressId: addressId, menuId: tempTab.tabmenu.id).getDocuments()
            
            var drinks: [DrinksModel] = []
            for document in snapshotDrinks.documents {
                let temp = try document.data(as: DrinksModel.self)
                drinks.append(temp)
            }
            tempTab.drinks = drinks
            tabMenuArray.append(tempTab)
        }
        print(tabMenuArray)

        return tabMenuArray
    }
    
//    func getAllTabs(coffeeshop_id: String, addressId: String) async throws -> [TabMenu] {
//        let snapshot = try await menuCollection(coffeeshop_id: coffeeshop_id, addressId: addressId).getDocuments()
//        
//        var tabs = try snapshot.documents.map({ document in
//            try document.data(as: TabMenu.self)
//        })
//        return tabs
//    }
    
    func getAllDrinks(coffeeshop_id: String, addressId: String, menuId: String) async throws -> [DrinksModel] {
        let snapshot = try await drinklistCollection(coffeeshop_id: coffeeshop_id, addressId: addressId, menuId: menuId).getDocuments()
        
        var drinks = try snapshot.documents.map({ document in
            try document.data(as: DrinksModel.self)
        })
        print(drinks)
        return drinks
    }
}

struct DrinksModel: Codable, Identifiable, Hashable {
    var id: String 
    var image: String
    var title: String
    var description: String
    var prices: [Int]
    var drink_size: [Int]
}

struct TabMenu: Codable, Identifiable, Hashable{
    var id: String
    var tab: String
}

class TabMenuuu {
    var tabmenu: TabMenu = TabMenu(id: "", tab: "")
    var drinks: [DrinksModel] = []
}
