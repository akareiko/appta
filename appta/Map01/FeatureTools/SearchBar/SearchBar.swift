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
                ZStack {
                    Circle()
                        .fill(.thinMaterial)
                        .frame(width: 40)
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.secondary)
                }
            })
            VStack{
                TextField("Search", text: $searchText)
                    .padding(.init(top: 8, leading: 14, bottom: 8, trailing: 14))
                    .font(.title3)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
        .onTapGesture {
            isSearching = true
        }
    }
}

#Preview {
    SearchBar(searchText: .constant(""), isSearching: .constant(false))
}
