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
        RoundedRectangle(cornerRadius: 10)
            .frame(width: UIScreen.main.bounds.width - 20, height: 160)
            .foregroundColor(.white)
            .offset(y: 10)
            .shadow(radius: 15)
            .overlay(content:{
                HStack(){
                    Text("Total Card Balance: ")
                    
                    Spacer()
                    
                    Text("192.00$")
                }
                .padding(.horizontal)
                .padding(.bottom, 60)
                
                Divider()
                
                Spacer()
                
                HStack(){
                    ForEach(element){ thing in
                        Image("\(thing.image)")
                            .frame(width: 30, height: 30)
                    }
                }
            })
    }
}

#Preview {
    MainMenuRoundedPanel(element: Element)
}
