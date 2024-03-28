//
//  MenuSearchBar.swift
//  appta
//
//  Created by Assylzhan Tati on 3/23/24.
//

import SwiftUI

struct MenuSearchBar: View {
    var body: some View {
        Button {
            
        } label: {
            HStack{
                Spacer()
                
                HStack(spacing: 10){
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("Search")
                        .font(.headline.bold())
                }
                .foregroundColor(.primary)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .foregroundColor(.clear)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    MenuSearchBar()
}
