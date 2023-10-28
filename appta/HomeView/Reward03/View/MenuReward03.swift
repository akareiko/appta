//
//  MenuReward03.swift
//  appta
//
//  Created by Assylzhan Tati on 10/25/23.
//

import SwiftUI

struct MenuReward03: View {
    @State var element03: [ElementModel03]

    var body: some View {
        VStack{
            Image(systemName: "star")
                .padding(.bottom, 5)
            Text("Today's Rewards")
                .font(.title2.bold())
        }
        .multilineTextAlignment(.center)
        .padding(.bottom, 40)
        
        ForEach(element03){element in
            RoundedRectangle(cornerRadius: 30)
                .frame(width: UIScreen.main.bounds.width, height: 80)
                .foregroundColor(.white)
                .shadow(radius: 2)
                .padding(.horizontal, 25)
                .padding(.bottom, 10)
                .overlay(content:{
                    HStack(spacing: 5){
                        Image(element.image)
                            .resizable()
                            .frame(width: 70, height: 70)
                            .offset(y: -5)
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text(element.title)
                                    .font(.title3.bold())
                                
                                Spacer()
                                
                                Text("\(element.currentScore) / \(element.totalScore)")
                                    .font(.callout.bold())
                                    .padding(.trailing, 30)
                            }
                            
                            Text(element.text)
                                .font(.callout)
                            
                            ProgressBar(barTotal: Float(element.totalScore), barValue: Float(element.currentScore))
                                .frame(width: 100)
                                .offset(x: -60)
                        }
                        .offset(y: 10)
                        
                    }
                    .padding(.horizontal, 30)
                })
        }
    }
}

#Preview {
    MenuReward03(element03: Element03)
}
