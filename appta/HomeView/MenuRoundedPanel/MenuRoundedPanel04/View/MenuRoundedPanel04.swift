//
//  MenuRoundedPanel04.swift
//  appta
//
//  Created by Assylzhan Tati on 11/11/23.
//

import SwiftUI

struct MenuRoundedPanel04: View {
    
    var body: some View {
        VStack(){
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color("starbucks-rewardgold"))
                    
                    Text("Services")
                        .font(.title3.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 30)
                
                Text("We make our lives easier")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(){
                    ForEach(MenuRPmodel04){ thing in
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
                                        .font(.footnote.bold())
                                }
                            })
                    }
                }
                .padding(.leading, 20)
            }
            .frame(maxWidth: .infinity)
        }
    }
}



#Preview {
    MenuRoundedPanel04()
}
