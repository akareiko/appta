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
    @State private var gradientColors: [Color] = [Color("starbucks-lightgold"), Color("starbucks-silver")]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.ultraThinMaterial)
            
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
        }
        .frame(height: 50)
        .gradientStroke(colors: gradientColors, lineWidth: 1)
        .onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: true)) {
                self.gradientColors = [Color("starbucks-silver"), Color("starbucks-lightgold")]
            }
        }
        .padding(.horizontal)
        .onTapGesture {
            isSearching = true
        }
    }
}
