//
//  GlobalModel.swift
//  appta
//
//  Created by Assylzhan Tati on 2/1/24.
//

import SwiftUI

@MainActor class GlobalModel: ObservableObject {
//    @Published var userData: [UserDataModel]
//    @Published var shopData: [ShopDataModel]
    @Published var favouritesArray: [OrderModel] = []
//    @Published var coffee: SelectedCoffee
}

struct UserDataModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
//    var personalInfo: [PersonalInfoModel]
}


