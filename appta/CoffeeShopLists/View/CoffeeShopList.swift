//
//  CoffeeShopList.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//

import SwiftUI

struct CoffeeShopList: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""
    @State private var isSearching = false
    
    var filteredCoffeeShops: [CoffeeShopListModel] {
            if searchText.isEmpty {
                return coffeeshoplist
            } else {
                return coffeeshoplist.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
            }
        }
    
    var body: some View {
        VStack(){
            VStack(){
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color("starbucks-rewardgold"))
                    .padding(.bottom, -2)
                Text("Coffee Shops")
                    .font(.title.bold())
                    .foregroundColor(.black)
                Text("Find all your favorite establishments")
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 70)
            
            NavigationView{
                ScrollView(showsIndicators: false){
                    VStack(spacing: 30){
                        SearchBar(searchText: $searchText, isSearching: $isSearching)
                            .padding(.top, -10)
                        
                        ForEach(coffeeshoplist){thing in
                            ScrollView(.horizontal){
                                CoffeeShopPanel(image: thing.image, title: thing.title, num_rest: thing.num_rest)
                            }
                        }
                    }
                    .padding(.bottom, 100)
                    .padding(.top, 30)
                }
            }
            
        }
        .ignoresSafeArea(.all)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Circle()
                        .frame(width: 60)
                        .foregroundColor(.black)
                        .offset(CGSize(width: -10.0, height: 0.0))
                        .overlay(
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.white)
                                .offset(CGSize(width: -10.0, height: 0.0))
                        )
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("", displayMode: .inline)
    }
}

#Preview {
    CoffeeShopList()
}
