//
//  CoffeeShopPanel.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//

import SwiftUI

struct CoffeeShopPanel: View {
    @State var image: String
    @State var title: String
    @State var num_rest: Int
    
    var body: some View {
        VStack(alignment: .leading){
            Image(image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width-15, height: 200)
                .scaledToFit()
                .foregroundColor(.white)
                .shadow(radius: 3)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.leading, 10)
                
            HStack(){
                VStack(alignment: .leading){
                    Text(title)
                        .font(.headline.bold())
                    
                    Text("\(num_rest) coffee shops")
                        .font(.footnote)
                }
                
                Spacer()
                
                HStack(){
                    Text("See all stores")
                        .font(.footnote)
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color("starbucks-rewardgold"))
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CoffeeShopPanel(image: "starbucks-horizontal", title: "Starbucks", num_rest: 9)
}
