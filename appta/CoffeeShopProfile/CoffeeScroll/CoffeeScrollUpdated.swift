//
//  CoffeeScroll.swift
//  appta
//
//  Created by Assylzhan Tati on 12/1/23.
//

import SwiftUI

struct CoffeeScrollUpdated: View {
    @State var coffees: [Coffee]
    var body: some View {
        VStack(alignment: .leading){
            LoopingScrollView(width: 100, spacing: 50, items: coffees){ thing in
                Button(action: {
                    withAnimation(.spring()) {
                        
                    }
                }) {
                    VStack{
                        Image(thing.image)
                            .resizable()
                            .frame(width: 180, height: 180)
                        
                        Text(thing.title)
                            .font(.callout.bold())
                        
                        Text(thing.price)
                            .font(.footnote.bold())
                    }
                    .frame(height: 100)
                }
            }
            .contentMargins(.leading, 40, for: .scrollContent)
        }
    }
}

#Preview {
    CoffeeScrollUpdated(coffees: coffees)
}
