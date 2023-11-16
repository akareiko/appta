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
            RoundedRectangle(cornerRadius: 15.0)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color("starbucks-lightgold"), Color("starbucks-lightgold")]), startPoint: .leading, endPoint: .trailing), lineWidth: 1)
                .frame(width: UIScreen.main.bounds.width - 40, height: 120)
//                .foregroundColor(Color("starbucks-white"))
                .foregroundColor(.white)
                .shadow(radius: 3)
                .overlay(content: {
                    HStack(){
                        VStack(alignment: .leading){
                            Text("Награды Старбакс")
                                .font(.title3)
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .offset(CGSize(width: -80.0, height: 15.0))
                            
//                            Text("50 / 100")
//                                .font(.title3)
//                                .foregroundColor(.black)
//                                .fontWeight(.semibold)
//                                .offset(CGSize(width: -80.0, height: -10.0))
//                                .padding(.top, 20)
                            
                            Text("50 / 100")
                                .font(.title3)
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .offset(CGSize(width: -80.0, height: -5.0))
                                .padding(.top, 10)
                            
                                
                            ProgressBar01(barTotal: barLimit, barValue: progressValue)
                                .offset(CGSize(width: -60.0, height: -10.0))
                            
                            Text("50 Звёзд до награды")
                                .font(.callout)
                                .foregroundColor(.secondary)
                                .offset(CGSize(width: -80.0, height: -15.0))
                        }
                        .offset(CGSize(width: 100.0, height: 0.0))
                            
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .offset(CGSize(width: -40, height: 0.0))
                            .offset(y: -5)
                            .foregroundColor(Color("starbucks-lightgold"))
                            .overlay(content: {
                                Text("2")
                                    .font(.title2)
                                    .foregroundColor(Color("starbucks-white"))
                                    .bold()
                                    .offset(y: -5)
                                    .offset(CGSize(width: -40, height: 3.0))
                            })
                        
//                        Text("250 Stars to \n Gold Level")
//                            .font(.headline)
//                            .foregroundColor(.black)
//                            .offset(CGSize(width: -10.0, height: 0.0))
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
                    .foregroundColor(Color("starbucks-lightgold").opacity(0.5))
                    .frame(width: 180)
                
                RoundedRectangle(cornerRadius: .infinity)
                    .foregroundColor(Color("starbucks-lightgold"))
                    .frame(width: 180 * CGFloat(barValue)/CGFloat(barTotal))
            }
            .frame(width: 140, height: 5)
            
        }
    }
}

#Preview {
    MenuRoundedPanel03()
}
