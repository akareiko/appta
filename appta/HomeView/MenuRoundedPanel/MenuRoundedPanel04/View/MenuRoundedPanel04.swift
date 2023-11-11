//
//  MenuRoundedPanel04.swift
//  appta
//
//  Created by Assylzhan Tati on 11/11/23.
//

import SwiftUI

struct MenuRoundedPanel04: View {
    @State var model04: [MenuRoundedPanelModel04]
    var body: some View {
        VStack(){
            VStack{
                Image(systemName: "star.fill")
                    .foregroundColor(Color("starbucks-rewardgold"))
                    .padding(.bottom, 5)
                Text("Explore")
                    .font(.title2.bold())
                Text("Check out all of our services")
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)

            }
            .multilineTextAlignment(.center)
            .padding(.bottom, 20)
            
            ScrollView(.horizontal){
                HStack(){
                    ForEach(model04){ thing in
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 100, height: 100)
                            .shadow(radius: 1)
                            .padding(2)
                            .foregroundColor(Color(.white))
                            .overlay(content: {
                                VStack{
                                    Image(thing.image)
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                    
                                    Text(thing.title)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                }
                            })
                    }
                }
            }
            .padding(.leading, 20)
        }
    }
}



#Preview {
    MenuRoundedPanel04(model04: MenuRPmodel04)
}
