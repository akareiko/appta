//
//  SwiftUIView.swift
//  appta
//
//  Created by Assylzhan Tati on 11/11/23.
//

import SwiftUI

struct MenuRoundedPanel03: View {
    @State private var barLimit: Float = 200
    @State private var progressValue: Float = 100
    
    var body: some View {
        VStack(){
            RoundedRectangle(cornerRadius: 30.0)
                .frame(width: UIScreen.main.bounds.width, height: 120)
                .foregroundColor(Color("starbucks-green"))
                .overlay(content: {
                    HStack(){
                        VStack(alignment: .leading){
                            Text("Starbucks Rewards")
                                .font(.title3)
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .offset(CGSize(width: -80.0, height: 10.0))
                            
                            Text("50 / 100")
                                .font(.title3)
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .offset(CGSize(width: -80.0, height: -10.0))
                                .padding(.top, 20)
                                
                            ProgressBar01(barTotal: barLimit, barValue: progressValue)
                                .offset(CGSize(width: -60.0, height: -15.0))
                            
                            Text("50 Stars till next reward")
                                .font(.headline)
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .offset(CGSize(width: -80.0, height: -15.0))
                        }
                        .offset(CGSize(width: 100.0, height: 0.0))
                            
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .offset(CGSize(width: -10, height: 0.0))
                            .foregroundColor(Color("starbucks-ceramic"))
                            .overlay(content: {
                                Text("2")
                                    .font(.title2)
                                    .foregroundColor(Color("starbucks-green"))
                                    .bold()
                                    .offset(CGSize(width: -10, height: 3.0))
                            })
                        
                        Text("250 Stars to \n Gold Level")
                            .font(.headline)
                            .foregroundColor(.white)
                            .offset(CGSize(width: -10.0, height: 0.0))
                    }
                })
        }
    }
}

struct ProgressBar01: View {
    
    let barTotal: Float
    let barValue: Float
    
    var body: some View {
        GeometryReader{ screen in
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: .infinity)
                    .foregroundColor(Color("starbucks-rewardgold").opacity(0.5))
                    .frame(width: 180)
                
                RoundedRectangle(cornerRadius: .infinity)
                    .foregroundColor(Color("starbucks-rewardgold"))
                    .frame(width: 180 * CGFloat(barValue)/CGFloat(barTotal))
            }
            .frame(width: 140, height: 5)
            
        }
    }
}

#Preview {
    MenuRoundedPanel03()
}
