//
//  SearchBar.swift
//  appta
//
//  Created by Assylzhan Tati on 11/20/23.
//
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                isSearching = true
            }, label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
            })
            VStack{
                TextField("Search", text: $searchText)
                    .padding(.horizontal, 15)
                    .font(Font.system(size: 21))
            }
        }
        .padding(.horizontal)
        .onTapGesture {
            isSearching = true
        }
    }
}
