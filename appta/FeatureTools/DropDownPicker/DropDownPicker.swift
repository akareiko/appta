//
//  DropDownPicker.swift
//  appta
//
//  Created by Assylzhan Tati on 11/23/23.
//

import SwiftUI

struct DropDownPicker: View {
    @State private var selection: String?
    var body: some View {
        NavigationStack {
            VStack(spacing: 15){
                DropDownView(hint: "Select", options: ["YouTube", "Instagram", "X (Twitter)", "Snapchat", "TikTok"], selection: $selection)
            }
            .navigationTitle("Dropdown Picker")
        }
    }
}

#Preview {
    DropDownPicker()
}
