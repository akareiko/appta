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
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundColor(Color("starbucks-rewardgold"))
                .padding(.bottom, -2)
            Text("Explore")
                .font(.title3.bold())
            Text("Check out all of our services")
                .font(.callout)
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
