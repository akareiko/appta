//
//  AnotherAnotherView.swift
//  appta
//
//  Created by Legato on 22.01.2024.
//

import SwiftUI

struct AnotherAnotherView: View {
    var body: some View {
        TabView(selection: .constant(1),
                content:  {
            Text("Tab Content 1").tabItem { Text("Tab Label 1") }.tag(1)
            Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2)
        })
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

#Preview {
    AnotherAnotherView()
}
