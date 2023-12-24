//
//  DrinkCustomizerStatistics.swift
//  appta
//
//  Created by Assylzhan Tati on 12/7/23.
//

import SwiftUI

struct DrinkCustomizerStatistics: View {
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Nutritions")
                .font(.title3.bold())
                .padding(.leading, 5)
            
            Text("Healthy facts about your beverage")
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.leading, 5)
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: UIScreen.main.bounds.width - 20, height: 160)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("starbucks-rewardgold"), lineWidth: 1)
                    )
                
                VStack(alignment: .leading){
                    Text("calories")
                        .font(.title3.bold())
                        .foregroundColor(.secondary)
                    
                    
                    Text("27 kcal")
                        .font(.title.bold())
                }
                .offset(CGSize(width: -110, height: -40))
                
                VStack(alignment: .center){
                    Text("portion size")
                        .font(.callout.bold())
                        .foregroundColor(.secondary)
                    
                    Text("100 g")
                        .font(.callout.bold())
                }
                .offset(CGSize(width: 10, height: -35))
                
                VStack(alignment: .center){
                    Text("caffeine")
                        .font(.callout.bold())
                        .foregroundColor(.secondary)
                    
                    Text("36 mg")
                        .font(.callout.bold())
                }
                .offset(CGSize(width: 120, height: -35))
                
                VStack(alignment: .center){
                    Text("sugar")
                        .font(.callout.bold())
                        .foregroundColor(.secondary)
                    
                    Text("2.5 g")
                        .font(.callout.bold())
                }
                .offset(CGSize(width: -120, height: 40))
                
                VStack(alignment: .center){
                    Text("protein")
                        .font(.callout.bold())
                        .foregroundColor(.secondary)
                    
                    Text("1.7 g")
                        .font(.callout.bold())
                }
                .offset(CGSize(width: 10, height: 40))
                
                VStack(alignment: .center){
                    Text("fat")
                        .font(.callout.bold())
                        .foregroundColor(.secondary)
                    
                    Text("1 g")
                        .font(.callout.bold())
                }
                .offset(CGSize(width: 120, height: 40))
            }
            .padding(.top, 5)
            
            HStack(){
                Text("by nutritionlive.org")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .offset(CGSize(width: UIScreen.main.bounds.width - 140, height: -2))
            }
        }
        .padding(.top, 30)
    }
}



#Preview {
    DrinkCustomizerStatistics()
}
