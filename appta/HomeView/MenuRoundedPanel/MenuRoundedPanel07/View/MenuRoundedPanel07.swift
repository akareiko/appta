//
//  MenuRoundedPanel07.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//

import SwiftUI

struct MenuRoundedPanel07: View {
    @State var shops: [MenuRoundedPanelModel07]
    var body: some View {
        VStack(){
            HStack {
                VStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("starbucks-rewardgold"))
                        
                        Text("Coffee Boxes")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.leading, 30)
                    
                    Text("Treat yourself with kindness")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                }
                
                Text("all...")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.trailing, 30)
            }

            ScrollView(.horizontal, showsIndicators: false){
                HStack(){
                    ForEach(shops){thing in
                        Image(thing.image)
                            .resizable()
                            .frame(width: 280, height: 140)
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                            .padding([.top, .bottom], 5)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(content: {
                                Text(thing.title)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 20)
                                    .font(.title2.bold())
                                    .offset(CGSize(width: 0, height: 45))
                                    .foregroundColor(.white)
                            })
                    }
                    .padding(.leading, 10)
                }
            }
            .padding(.leading, 10)
        }
    }
}

#Preview {
    MenuRoundedPanel07(shops: MenuRPmodel07)
}
