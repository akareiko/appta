//
//  MapView.swift
//  appta
//
//  Created by Legato on 23.08.2023.
//

import SwiftUI
import Foundation


struct MapView: View {
    private var listOfCoffee = coffeeList
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(coffeeshops, id: \.self) { coffeeshop in
                    HStack {
                        Text(coffeeshop.capitalized)
                        Spacer()
                        Image(systemName: "mug.fill")
                            .foregroundColor(Color.brown)
                    }
                    .padding()
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Coffeeshops")
        }
    }
    var coffeeshops: [String] {
        let lcCoffees = listOfCoffee.map {
            $0.lowercased()
        }
        
        return searchText == "" ? lcCoffees : lcCoffees.filter {
            $0.contains(searchText.lowercased())
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
