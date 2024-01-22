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
    @State var customizedDrink: [OrderModel] = []
    @State var selectedSize: Size = sizes.first!
    @State var addToFavourites: Bool = false
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @Binding var nestr: Bool
//    @State private var opas = false
    @State var appeared: Double = 0.0
    
    @State var totalPrice: Int = 0
    @State var optionArray: [Int : OptionType] = [
        0 : optionscroll[0].optionTypes.first!,
        1 : optionscroll[1].optionTypes.first!,
        2 : optionscroll[2].optionTypes.first!,
        3 : optionscroll[3].optionTypes.first!,
        4 : optionscroll[4].optionTypes.first!,
    ]
    
    var body: some View{
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
                            nestr.toggle()
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
                            Text("KZT \(selectedCoffee.prices[selectedSize.index])")
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
                    
                    DrinkCustomizerSize(selectedSize: $selectedSize)
                        .padding(.horizontal, 20)
                    
                    DrinkCustomizerOptionScroll(totalPrice: $totalPrice, optionArray: $optionArray)
                        
                    DrinkCustomizerStatistics()
                        .padding(.bottom, 100)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                }
                .padding(.top, 80)
                .padding(.bottom, 30)
            }
            
                HStack(){
                    
                    Text("Total Price: \(calculateTotalPrice()) KZT")
                        .font(.callout)
                        .padding(.horizontal, 20)
                        
                    Spacer()
                    
                    Button {
                        addToFavourites.toggle()
                    } label: {
                        if addToFavourites {
                            withAnimation(.snappy){
                                Circle()
                                    .frame(width: 40)
                                    .foregroundColor(Color("starbucks-rewardgold"))
                                    .overlay(
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.white)
                                    )
                            }
                        } else {
                            withAnimation(.snappy){
                                Circle()
                                    .stroke(Color("starbucks-rewardgold"), lineWidth: 2)
                                    .frame(width: 40)
                                    .overlay(
                                        Image(systemName: "star.fill")
                                            .foregroundColor(Color("starbucks-rewardgold"))
                                    )
                            }
                        }
                    }
                    .offset(CGSize(width: 15, height: 0))
                    
                    Button(action: {
                        customizedDrink.append(OrderModel(image: selectedCoffee.image, title: selectedCoffee.title, customizedPrice: calculateTotalPrice(), drinkSize: selectedCoffee.prices[selectedSize.index], address: "", optionArray: optionArray))
                    })
                    {
                        NavigationLink(destination: BasketView(customizedDrink: customizedDrink)){
                            Circle()
                                .frame(width: 40)
                                .foregroundColor(Color("starbucks-rewardgold"))
                                .overlay(
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                )
                            }
                    }
                    .offset(CGSize(width: 18, height: 0))
                    
                    Button(action: {
                        customizedDrink.append(OrderModel(image: selectedCoffee.image, title: selectedCoffee.title, customizedPrice: calculateTotalPrice(), drinkSize: selectedCoffee.prices[selectedSize.index], address: "", optionArray: optionArray))
                    })
                    {
                        NavigationLink(destination: BasketView(customizedDrink: customizedDrink)){
                            Circle()
                                .frame(width: 40)
                                .foregroundColor(Color("starbucks-rewardgold"))
                                .overlay(
                                    Image(systemName: "chevron.forward")
                                        .foregroundColor(.white)
                                )
                            }
                    }
                    .padding(.horizontal, 20)
                }
                .frame(width: nil, height: 60)
                .background(.thinMaterial)
                .cornerRadius(30)
                .padding([.leading, .trailing], 30)
                .padding(.bottom, 30)
                .opacity(appeared)
//                .scaleEffect(appeared)
                .animation(Animation.spring(duration: 2.5), value: appeared)
                .onAppear {self.appeared = 1.0}
                .onDisappear {self.appeared = 0.0}
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            nestr.toggle()
        }
//        .opacity(opas ? 0 : 1)
//        .scaleEffect(opas ? 1 : 1.5)
//        .animation(.spring(), value: opas)
    }
}

extension DrinkCustomizer{
    func calculateTotalPrice() -> Int {
        return totalPrice + selectedCoffee.prices[selectedSize.index]
    }
}

#Preview {
    DrinkCustomizer(selectedCoffee: DrinkModel(index: 0, image: "Caramel-Brule-Latte", title: "Caramel Brule Latte", description: "The Caramel-Brulé Latte is a luxurious coffee drink blending rich espresso with creamy milk, topped with a layer of frothy foam and a drizzle of caramel sauce, torched to create a caramelized topping reminiscent of crème brûlée. It's a perfect blend of bitter espresso and sweet, crunchy caramel, ideal for those who enjoy a sophisticated, dessert-like coffee experience.", prices: [1200, 1400, 1600], drinkSize: [300, 400, 500]), nestr: .constant(false))
}
