//
//  SwiftUIView.swift
//  appta
//
//  Created by Assylzhan Tati on 10/24/23.
//

import SwiftUI

struct MenuReward02: View {
    @State var menuReward02: [MenuRewardModel02]
    var body: some View {
        VStack(){
            VStack{
                Image(systemName: "star.fill")
                    .foregroundColor(Color("starbucks-rewardgold"))
                    .padding(.bottom, 10)
                
                Text("Rewards are awaiting")
                    .font(.title2.bold())
            }
            .padding(.bottom, 40)
                
            VStack{
                HStack(spacing: 40){
                    
                    Image(menuReward02[0].image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .offset(CGSize(width: 0.0, height: -10.0))
                    VStack(alignment: .leading){
                        Text(menuReward02[0].title)
                            .font(.title3.bold())
                            .padding(.bottom, 5)
                        
                        Text(menuReward02[0].text)
                            .font(.callout)
                            .frame(width: 200)
                    }
                }
                .padding(.bottom, 50)
                
                HStack(spacing: 20){
                    VStack(alignment: .leading){
                        Text(menuReward02[1].title)
                            .font(.title3.bold())
                            .padding(.bottom, 5)
                        
                        Text(menuReward02[1].text)
                            .font(.callout)
                            .frame(width: 200)
                    }
                    
                    Image(menuReward02[1].image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .offset(CGSize(width: 0.0, height: -10.0))
                    
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 40){
                    Image(menuReward02[2].image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .offset(CGSize(width: 0.0, height: 10.0))
                    
                    VStack(alignment: .leading){
                        Text(menuReward02[2].title)
                            .font(.title3.bold())
                            .padding(.bottom, 5)
                            .offset(CGSize(width: 7.0, height: 0.0))
                            
                            
                        Text(menuReward02[2].text)
                            .font(.callout)
                            .frame(width: 200)
                    }
                }
            }
        }
    }
}

#Preview {
    MenuReward02(menuReward02: menuReward02)
}
