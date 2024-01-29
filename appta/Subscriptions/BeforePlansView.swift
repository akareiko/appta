//
//  BeforePlansView.swift
//  appta
//
//  Created by Legato on 22.01.2024.
//

import SwiftUI

struct BeforePlansView: View {
//    @State private var items: [InfiniteViewModel] = [.red, .blue, .green, .yellow, .black].compactMap {
//        return .init(color: $0, names: "Starbucks") }
//    @State private var items: [PlansModel] = ["arabica-logo", "cinnabon-logo", "coffeeday-logo", "costacoffee-logo", "pretamanger-logo", "starbucks-logo", "timhortons-logo", "veneziano-logo", "zebracoffee-logo"].compactMap {
//        return .init(imageName: $0, names: "Starbucks")
//    }
    @EnvironmentObject var obj: GlobalWars
    @State private var searchText = ""
    @State private var isSearching = false
    
    var body: some View {
        VStack {
            Text("Step One")
                .font(.title)
                .foregroundColor(.black)
                .fontWeight(.bold)
            Text("Choose Your CoffeeShop  ")
                .font(.title2)
                .foregroundColor(.black)
            +
            Text(Image(systemName: "mug.fill"))
        }
        
        Spacer()
            .frame(height: 30)
        
        SearchBar(searchText: $searchText, isSearching: $isSearching)
        
        Spacer()
            .frame(height: 30)
        
        GeometryReader {
            let size = $0.size
            
            ScrollViewReader{ reader in
                LoopingScrollView(width: size.width, spacing: 0, items: obj.coffeeShopArray, searchText: searchText) { item in
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.black)
                            .frame(width: 300)
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .clipShape(Circle())
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
    BeforePlansView()
        .environmentObject(GlobalWars())
}
