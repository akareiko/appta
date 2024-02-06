//
//  CustomPopUpSheet.swift
//  appta
//
//  Created by Assylzhan Tati on 1/22/24.
//

import SwiftUI

struct CustomPopUpSheet: View {
    @ObservedObject var coffee: SelectedCoffee
    @ObservedObject var globalVar: GlobalModel
    
    var optionArrayMenu: [Int : OptionType] = [
        0 : optionscroll[0].optionTypes.first!,
        1 : optionscroll[1].optionTypes.first!,
        2 : optionscroll[2].optionTypes.first!,
        3 : optionscroll[3].optionTypes.first!,
        4 : optionscroll[4].optionTypes.first!,
    ]
    
    @State private var selectedSizeIndex: Int = 0
    @State private var toggleBasketViewCustomPopUp: Bool = false
    
    @Binding var customizedDrink: [OrderModel]
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack(spacing: .zero){
                HStack{
                    Button {
                        withAnimation(.snappy){
                            
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: UIScreen.main.bounds.width - 125, height: 50)
                            .foregroundColor(Color("starbucks-rewardgold").opacity(0.8))
                            .overlay(content: {
                                HStack{
                                    HStack{
                                        Image(systemName: "basket")
                                        
                                        Text("\(coffee.selectedCoffee.title)")
                                            .font(.callout.bold())
                                            .foregroundColor(.white)
                                    }
                                    .padding(.leading, 20)
                                    
                                    Spacer()
                                    
                                    Text("KZT \(calculatePricePoppUpSheet())")
                                        .font(.headline.bold())
                                        .padding(.horizontal, 20)
                                        .lineLimit(1)
                                }
                            })
                    }
                    .padding(.leading, 10)
                    .padding(.horizontal, 3)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        switch selectedSizeIndex {
                            case 0:
                                selectedSizeIndex = 1
                            case 1:
                                selectedSizeIndex = 2
                            case 2:
                                selectedSizeIndex = 0
                            default:
                                break
                        }
                        coffee.selectedSize = sizes[selectedSizeIndex]
                    }){
                        Text(coffee.selectedSize.title)
                            .font(.callout.bold())
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Color("starbucks-rewardgold").opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 5, y: 5)
                    }
                    
                    Button{
                        toggleBasketViewCustomPopUp.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("starbucks-rewardgold").opacity(0.8))
                            .overlay(content: {
                                Image(systemName: "chevron.forward")
                                    .font(.headline.bold())
                                    .foregroundColor(.white)
                            })
                            .sheet(isPresented: $toggleBasketViewCustomPopUp){
                                BasketView(coffee: coffee, globalVar: globalVar, customizedDrink: $customizedDrink)
                            }
                    }
                    .padding(.leading, -4)
                    .padding(.trailing, 15)
                }
                .padding(.bottom, 10)
            }
            .frame(width: UIScreen.main.bounds.width, height: 60)
            .padding(.vertical, 30)
            .background(.ultraThinMaterial)
            .shadow(color: .black.opacity(0.2), radius: 2)
            .cornerRadius(20)
            .multilineTextAlignment(.center)
            .transition(.move(edge: .bottom))
        }
        .ignoresSafeArea()
    }
}


extension CustomPopUpSheet {
    func calculatePricePoppUpSheet() -> Int {
        var totalPricePopUp = 0
        if let existingIndex = customizedDrink.firstIndex(where: { drink in
            // Compare selectedCoffee, selectedSize, and optionArray
            return drink.drink.title == coffee.selectedCoffee.title &&
            drink.drink.drinkSize[drink.drinkSizeIndex] == coffee.selectedSize.volume &&
                NSDictionary(dictionary: drink.optionArray).isEqual(to: optionArrayMenu)
        }) {
            if customizedDrink[existingIndex].quantity > 0 {
                totalPricePopUp = customizedDrink[existingIndex].quantity * coffee.selectedCoffee.prices[coffee.selectedSize.index]
            }
        }
        
        return totalPricePopUp
    }
}

