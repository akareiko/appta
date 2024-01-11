//
//  DrinkCustomizer.swift
//  appta
//
//  Created by Assylzhan Tati on 11/19/23.
//

import SwiftUI

struct DrinkCustomizer: View {
    @State var selectedCoffee: DrinkModel
    @State private var isClicked = false
    @State private var isTextExpanded = false
    @State var options: [Option]
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    @State private var totalPrice: Int = 0
    
    var body: some View {
        
        VStack{
            ZStack(alignment: .bottomTrailing) {
                ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Drink Customizer")
                                .font(.title.bold())
                            
                            Text("Customize your drinks as you like")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal, 20)
                           
                        Spacer()
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Circle()
                                .frame(width: 30)
                                .foregroundColor(.black)
                                .overlay(
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                )
                        }
                        .padding(.horizontal, 20)
                    }
                        

                    ScrollView(.horizontal, showsIndicators: false){
                        Image(selectedCoffee.image)
                            .resizable()
                            .frame(width: 400, height: 400)
                            .padding(.leading, 5)
                    }
                    HStack(){
                        VStack(alignment: .leading){
                            HStack{
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(Color("starbucks-rewardgold"))
                                    .offset(CGSize(width: 0, height: -10.0))
                                VStack(alignment: .leading){
                                    Text(selectedCoffee.title)
                                        .font(.title2.bold())
                                    
                                    Text("Classic")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                }
                            }
                            
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text("KZT \(selectedCoffee.prices[0])")
                                .foregroundColor(Color("starbucks-rewardgold"))
                                .fontWeight(.bold)
                                .padding(.init(top: 8, leading: 14, bottom: 8, trailing: 14))
                                .background(Color.white)
                                .cornerRadius(20)
                                .overlay(
                                    Capsule()
                                        .stroke(Color("starbucks-rewardgold"), lineWidth: 1)
                                )
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    
                    VStack(alignment: .leading){
                        Text(selectedCoffee.description)
                            .font(.footnote)
                            .foregroundColor(.black)
                            .lineLimit(isTextExpanded ? nil : 3)
                        
                        Button(action: {
                            withAnimation {
                                isTextExpanded.toggle()
                            }
                        }) {
                            Text(isTextExpanded ? "Show less" : "Show more")
                                .font(.caption)
                                .foregroundColor(Color(.systemGray))
                            
                            Image(systemName: isTextExpanded ? "chevron.up" : "chevron.down")
                                .foregroundColor(Color(.systemGray))
                                .imageScale(.small)
                                .padding(.leading, -5)
                        }
                        .padding(.top, 0.5)
                        
                        DrinkCustomizerInfoPanel()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    
                    DrinkCustomizerSize()
                        .padding(.horizontal, 20)
                    
                    VStack(){
                        DrinkCustomizerOptionScroll(options: optionscroll, totalPrice: $totalPrice)
                    }
                    
                    DrinkCustomizerStatistics()
                        .padding(.bottom, 100)
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                }
                .padding(.top, 80)
            }
            
                HStack(){
                    
                    Text("Total Price: \(totalPrice) KZT")
                        .font(.callout)
                        .padding(.horizontal, 20)
                        
                    Spacer()
                    
                    Button(action: {
                    }) {
                        NavigationLink(destination: BasketView()){
                            Circle()
                                .frame(width: 40)
                                .foregroundColor(Color("starbucks-rewardgold"))
                                .offset(CGSize(width: -10.0, height: 0.0))
                                .overlay(
                                    Image(systemName: "chevron.forward")
                                        .foregroundColor(.white)
                                        .offset(CGSize(width: -10.0, height: 0.0))
                                )
                        }
                    }
                        
                }
                .frame(width: nil, height: 80)
                .background(.thinMaterial)
                .cornerRadius(30)
                .padding([.leading, .trailing], 30)
                .padding(.bottom, 40)
                           
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DrinkCustomizer(selectedCoffee: DrinkModel(index: 0, image: "Caramel-Brule-Latte", title: "Caramel Brule Latte", description: "The Caramel-Brulé Latte is a luxurious coffee drink blending rich espresso with creamy milk, topped with a layer of frothy foam and a drizzle of caramel sauce, torched to create a caramelized topping reminiscent of crème brûlée. It's a perfect blend of bitter espresso and sweet, crunchy caramel, ideal for those who enjoy a sophisticated, dessert-like coffee experience.", prices: [1200, 1400, 1600], drinkSize: [300, 400, 500]), options: optionscroll)
}
