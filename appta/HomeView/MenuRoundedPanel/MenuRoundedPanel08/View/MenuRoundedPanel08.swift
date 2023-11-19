//
//  MenuRoundedPanel08.swift
//  appta
//
//  Created by Assylzhan Tati on 11/19/23.
//

import SwiftUI

struct MenuRoundedPanel08: View {
    var body: some View {
        VStack(){
            HStack(){
                VStack(){
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 170, height: 170)
                        .foregroundColor(.white)
                        .shadow(radius: 2)
                }
                
                VStack(){
                    RoundedRectangle(cornerRadius: 10.0)
                        .frame(width: 170, height: 80)
                        .foregroundColor(.white)
                        .shadow(radius: 2)
                
                    HStack(){
                        RoundedRectangle(cornerRadius: 10.0)
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .shadow(radius: 2)
                        
                        RoundedRectangle(cornerRadius: 10.0)
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .shadow(radius: 2)
                    }
                }
            }
        }
    }
}

#Preview {
    MenuRoundedPanel08()
}
