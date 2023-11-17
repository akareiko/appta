//
//  MenuRoundedPanel06.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//

import SwiftUI

struct MenuRoundedPanel06: View {
    var body: some View {
        VStack(){
            Image(systemName: "star.fill")
                .foregroundColor(Color("starbucks-rewardgold"))
                .padding(.bottom, -2)
            Text("Explore")
                .font(.title2.bold())
            Text("Check out all of our services")
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            ScrollView(.horizontal){
                Image("arabica-horizontal")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width - 20, height: 150)
                    .foregroundColor(.white)
                    .shadow(radius: 3)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .padding(.leading, 10)
        }
    }
}

#Preview {
    MenuRoundedPanel06()
}
