//
//  MainMenuRoundedPanel.swift
//  appta
//
//  Created by Assylzhan Tati on 10/22/23.
//

import SwiftUI

struct MainMenuRoundedPanel: View {
    var element: [ElementModel]
    var body: some View {
        VStack(){
            RoundedRectangle(cornerRadius: 30)
                .frame(width: UIScreen.main.bounds.width, height: 130)
                .foregroundColor(.white)
                .offset(y: 10)
                .shadow(radius: 5)
                .overlay(content:{
                    HStack(){
                        
                        Image(systemName: "dollarsign.circle")
                            .font(.title3)
                        
                        Text("Card Balance: ")
                            .font(.title3.bold())
                        
                        Spacer()
                        
                        Text("192.62$")
                            .font(.headline)
                            .foregroundColor(Color("starbucks-trueblack"))
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, 60)
                    
                    Divider()
                        .padding(.horizontal, 15)
                        .padding(.bottom, 20)
                    
                    HStack(spacing: 20){
                        ForEach(element){ thing in
                            VStack(){
                                Image(systemName:"\(thing.image)")
                                    .resizable()
                                    .frame(width: 25, height: 23)
                                    .padding(.bottom, 5)
                                    .foregroundColor(Color(thing.color))
                                    
                                Text(thing.text)
                                    .font(.footnote.bold())
                                    .frame(width: 120)
                            }
                        }
                        .frame(width: 100)
                    }
                    .padding(.bottom, 20)
                    .offset(CGSize(width: 0.0, height: 45.0))
                })
        }
    }
}

#Preview {
    MainMenuRoundedPanel(element: Element)
}
