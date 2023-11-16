//
//  CoffeeShopPanel.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//

import SwiftUI

struct CoffeeShopPanel: View {
    @State var image: String
    @State var title: String
    @State var raiting: String
    
    var body: some View {
        VStack(){
            Image(image)
                .resizable()
                .frame(width: 370, height: 200)
                .scaledToFit()
                .foregroundColor(.white)
                .shadow(radius: 3)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(content:{
                    HStack(){
                        RoundedRectangle(cornerRadius: 3)
                            .frame(width: 55, height: 27)
                            .foregroundColor(.white)
                            .offset(CGSize(width: -110, height: -60))
                            .overlay(content: {
                                HStack(spacing: 4){
                                    Image(systemName:"star.fill")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(Color("starbucks-rewardgold"))
                                        .fontWeight(.bold)
                                    
                                    Text(raiting)
                                        .font(.footnote)
                                        .bold()
                                }
                                .offset(CGSize(width: -110, height: -60))
                            })
                        Spacer()
                        
                    }
                    .offset(CGSize(width: 120.0, height: 0.0))
                    
                    RoundedRectangle(cornerRadius: 6)
                        .frame(width: 350, height: 60)
                        .foregroundColor(.white)
                        .offset(CGSize(width: 0.0, height: 60.0))
                        .overlay(content: {
                            VStack(){
                                HStack(){
                                    Text(title)
                                        .font(.headline.bold())
                                        .offset(CGSize(width: 10.0, height: 0.0))
                                        
                                    Spacer()
                                    
                                    HStack(){
                                        Image(systemName: "location.fill")
                                            .resizable()
                                            .foregroundColor(Color("starbucks-rewardgold"))
                                            .frame(width: 15, height: 15)
                                            .offset(CGSize(width: 0.0, height: 1.0))
                                        
                                        Text("1.2km")
                                            .font(.footnote.bold())
                                    }
                                    .offset(CGSize(width: -10.0, height: 0.0))
                                }
                                
                                HStack(){
                                   Text("Coffee, Western, Local")
                                        .font(.footnote.bold())
                                        .foregroundColor(.secondary)
                                        .offset(CGSize(width: 10.0, height: 0.0))
                                    
                                    Spacer()
                                    
                                    HStack(){
                                        Text("Details")
                                            .font(.footnote.bold())
                                        
                                        Image(systemName: "chevron.right")
                                            .resizable()
                                            .frame(width: 8, height: 8)
                                            .foregroundColor(Color("starbucks-rewardgold"))
                                            .fontWeight(.bold)
                                    }
                                    .padding(.trailing, 20)
                                }
                            }
                            .offset(CGSize(width: 0.0, height: 60.0))
                        })
                })
        }
    }
}

#Preview {
    CoffeeShopPanel(image: "starbucks-horizontal", title: "Starbucks", raiting: "4.8")
}
