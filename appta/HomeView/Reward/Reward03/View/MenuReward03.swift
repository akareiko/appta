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
        HStack {
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color("starbucks-rewardgold"))
                    
                    Text("Награды")
                        .font(.title3.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 30)
                
                Text("Зарабатывайте очки каждый день")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
            }
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color("starbucks-rewardgold"))
                .padding(.trailing, 30)
        }
        .padding(.bottom, 10)
        
        ForEach(element03){element in
            RoundedRectangle(cornerRadius: 20)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color("starbucks-lightgold"), Color("starbucks-lightgold")]), startPoint: .leading, endPoint: .trailing), lineWidth: 1)
                .frame(width: UIScreen.main.bounds.width - 50, height: 70)
//                .foregroundColor(Color("starbucks-white"))
                .foregroundColor(.white)
                .shadow(radius: 3)
                .padding(.horizontal, 25)
                .padding(.bottom, 10)
                .overlay(content:{
                    HStack(spacing: 5){
                        Image(element.image)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x: 5, y: -5)
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text(element.title)
                                    .font(.subheadline.bold())
                                
                                Spacer()
                                
                                Text("\(element.currentScore) / \(element.totalScore)")
                                    .font(.subheadline.bold())
                                    .padding(.trailing, 30)
                                    .foregroundColor(.secondary)
                            }
                            
                            Text(element.text)
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            ProgressBar(barTotal: Float(element.totalScore), barValue: Float(element.currentScore))
                                .frame(width: 100)
                                .offset(x: -63)
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
