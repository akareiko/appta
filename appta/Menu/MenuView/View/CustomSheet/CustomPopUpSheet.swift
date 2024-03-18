//
//  CustomPopUpSheet.swift
//  appta
//
//  Created by Assylzhan Tati on 1/22/24.
//

import SwiftUI

struct CustomPopUpSheet: View {
    @ObservedObject var coffee: SelectedCoffee
    @ObservedObject var globalVars: GlobalVars
    @ObservedObject var viewModelTab: TabMenuModel
    @ObservedObject var viewModelCoffeeshop: CoffeeshopViewModel
    
    @State private var selectedSizeIndex: Int = 0
    @State private var toggleBasketViewCustomPopUp: Bool = false
    
    @Binding var customizedDrink: [OrderModel]
    @Binding var chosenAddress: AddressModel
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack(spacing: .zero){
                HStack{
                    Button {
                        withAnimation(.snappy){
                            
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
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
                                    
                                    HStack(spacing: 3){
                                        Text("\(calculatePricePoppUpSheet())")
                                            .font(.headline.bold())
                                        
                                        Image(systemName: "tengesign")
                                            .resizable()
                                            .frame(width: 10, height: 10)
                                            .fontWeight(.bold)
                                    }
                                    .padding(.horizontal, 15)
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
                        coffee.selectedSize = coffee.selectedCoffee.drinksize[selectedSizeIndex]
                    }){
                        Text(selectedSizeIndex == 0 ? "S" : selectedSizeIndex == 1 ? "M" : selectedSizeIndex == 2 ? "L" : selectedSizeIndex > 2 ? "XL" : "")
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
                                BasketView(coffee: coffee, globalVars: globalVars, viewModelTab: viewModelTab, viewModelCoffeeshop: viewModelCoffeeshop, customizedDrink: $customizedDrink, chosenAddress: $chosenAddress)
                            }
                    }
                    .padding(.leading, -4)
                    .padding(.trailing, 15)
                }
                .padding(.bottom, 10)
            }
            .frame(width: UIScreen.main.bounds.width - 20, height: 25)
            .padding(.vertical, 30)
            .background(.ultraThinMaterial)
            .shadow(color: .black.opacity(0.2), radius: 2)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .multilineTextAlignment(.center)
            .transition(.move(edge: .bottom))
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom, 20)
        .ignoresSafeArea()
    }
}


extension CustomPopUpSheet {
    func calculatePricePoppUpSheet() -> Int {
        var totalPricePopUp = 0
        if let existingIndex = customizedDrink.firstIndex(where: { drink in
            // Compare selectedCoffee, selectedSize, and optionArray
            return drink.drink.title == coffee.selectedCoffee.title &&
            drink.drink.drinksize[drink.drinkSizeIndex] == coffee.selectedCoffee.drinksize[coffee.selectedSize] &&
            NSDictionary(dictionary: drink.optionArray).isEqual(to: viewModelTab.defaultArray)
        }) {
            if customizedDrink[existingIndex].quantity > 0 {
                totalPricePopUp = customizedDrink[existingIndex].quantity * coffee.selectedCoffee.prices[coffee.selectedSize]
            }
        }
        
        return totalPricePopUp
    }
}

#Preview{
    ContentView()
}
