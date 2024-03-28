//
//  NavigationStateViewModel.swift
//  appta
//
//  Created by Assylzhan Tati on 3/25/24.
//

import Foundation

class NavigationStateViewModel: ObservableObject {
    
    @Published var currentView = DifferentViews.HomeView
    
    func onViewChanged(newView: DifferentViews){
        self.currentView = newView
    }
    
}

enum DifferentViews {
    case HomeView
    case ProfileView
}
