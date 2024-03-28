//
//  NavigationLinkView.swift
//  appta
//
//  Created by Assylzhan Tati on 3/25/24.
//

import SwiftUI

struct NavigationLinkView: View {
    @EnvironmentObject var navigationStateViewModel: NavigationStateViewModel
    
    @ObservedObject var globalVars: GlobalVars
    @ObservedObject var viewModelCoffeeshop: CoffeeshopViewModel
    var body: some View {
        switch(navigationStateViewModel.currentView){
        case .HomeView:
            HomeView(globalVars: globalVars, viewModelCoffeeshop: viewModelCoffeeshop, str: $globalVars.str, nestr: $globalVars.nestr)
        case .ProfileView:
            ProfileView()
        }
    }
}

#Preview {
    NavigationLinkView(globalVars: GlobalVars(), viewModelCoffeeshop: CoffeeshopViewModel())
}
