//
//  AnimatedHeaderModel.swift
//  appta
//
//  Created by Assylzhan Tati on 12/30/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var offset: CGFloat = 0
    
    // Selected Tab...
    @Published var selectedTab = drinksmenu.first!.tab
}
