//
//  BeforePlansView.swift
//  appta
//
//  Created by Legato on 22.01.2024.
//

import SwiftUI

struct BeforePlansView: View {
    @EnvironmentObject var obj: GlobalWars
    @State private var searchText = ""
    @State private var isSearching = false
    @Binding var haha: String
    
    
    var body: some View {
        Spacer()
            .frame(height: 30)
        
        SearchBar(searchText: $searchText, isSearching: $isSearching)
            .frame(width: UIScreen.main.bounds.width - 20)
        
        Spacer()
            .frame(height: 30)
        
        GeometryReader {
            let size = $0.size
            
            ScrollViewReader{ reader in
                LoopingScrollView(width: size.width, spacing: 0, items: obj.coffeeShopArray) { item in
                    Button(action: {
                        haha = item.names
                    }) {
                        ZStack {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .clipShape(Circle())
                                .scaleEffect(1.1)
                            
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.ultraThinMaterial)
                                .frame(width: 300)
                                .shadow(radius: 3)
                                .scaleEffect(0.95)
                            
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .clipShape(Circle())
                        }
                    }
                }
                .onChange(of: searchText) { _, newSearchText in
                    if let matchingPage = obj.coffeeShopArray.first(where: { $0.names.description.lowercased() == newSearchText.lowercased() }) {
                        withAnimation(.easeIn){
                            reader.scrollTo(matchingPage.id, anchor: .topLeading)
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
        }
        .frame(height: 220)
    }
}

#Preview {
    BeforePlansView(haha: .constant(""))
        .environmentObject(GlobalWars())
}
