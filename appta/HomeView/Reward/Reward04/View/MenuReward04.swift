//
//  MenuReward04.swift
//  appta
//
//  Created by Assylzhan Tati on 10/26/23.
//

import SwiftUI

struct MenuReward04: View {
    @State var cardShape = CardShape(corners: [.topLeft, .bottomLeft])
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 30)
                .frame(width: UIScreen.main.bounds.width, height: 120)
                .foregroundColor(.white)
                .shadow(radius: 2)
            
            Image("reward04")
                .resizable()
                .frame(width: UIScreen.main.bounds.width-270, height: 120)
                .clipShape(CardShape(corners: [.topLeft, .bottomLeft]))
                .scaledToFill()
                
        }
        
    }
}

#Preview {
    MenuReward04()
}
