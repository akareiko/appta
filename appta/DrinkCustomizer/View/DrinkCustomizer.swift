//
//  DrinkCustomizer.swift
//  appta
//
//  Created by Assylzhan Tati on 11/19/23.
//

import SwiftUI

struct DrinkCustomizer: View {
    @ObservedObject var coffee: SelectedCoffee
    @EnvironmentObject var globalVar: GlobalModel
    
    @State private var isClicked: Bool = false
    @State private var isTextExpanded: Bool = false
    @State private var toggleBasketViewDrinkCustomizer: Bool = false
    @State private var toggleFavourites: Bool = false
    
    @Binding var customizedDrink: [OrderModel]
    
    @State var totalPrice: Int = 0
    @State var optionArray: [Int : OptionType] = [
        0 : optionscroll[0].optionTypes.first!,
        1 : optionscroll[1].optionTypes.first!,
        2 : optionscroll[2].optionTypes.first!,
        3 : optionscroll[3].optionTypes.first!,
        4 : optionscroll[4].optionTypes.first!,
    ]
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        VStack{
            ZStack(alignment: .bottomTrailing) {
                ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Drink Customizer")
                                .font(.title.bold())
                                .foregroundColor(.black)
                            
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
                        Image(coffee.selectedCoffee.image)
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
                                    Text(coffee.selectedCoffee.title)
                                        .font(.title2.bold())
                                        .foregroundColor(.black)
                                    
                                    Text("Classic")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text("KZT \(coffee.selectedCoffee.prices[coffee.selectedSize.index])")
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
                        Text(coffee.selectedCoffee.description)
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
                    
                    DrinkCustomizerSize(coffee: coffee)
                        .padding(.horizontal, 20)
                    
                    DrinkCustomizerOptionScroll(totalPrice: $totalPrice, optionArray: $optionArray)
                        
                    DrinkCustomizerStatistics()
                        .padding(.bottom, 100)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                }
                .padding(.top, 30)
                .padding(.bottom, 20)
            }
                
                HStack(){
                    
                    Text("Total Price: \(calculateTotalPrice()) KZT")
                        .font(.callout)
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                        .lineLimit(1)
                        
                    Spacer()
                    
                    Button {
                        addToFavourites()
                    } label: {
                        if checkFavourites() {
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
                    .sheet(isPresented: $toggleFavourites){
                        FavouritesView()
                            .presentationBackground(.ultraThinMaterial)
                    }

                    Button {
                        addOrUpdateDrinkInOrder()
                    } label: {
                        withAnimation(.snappy){
                            Circle()
                                .frame(width: 40)
                                .foregroundColor(Color("starbucks-rewardgold"))
                                .overlay(
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                )
                        }
                    }
                    .offset(CGSize(width: 15, height: 0))
                    
                    Button(action: {
                        toggleBasketViewDrinkCustomizer.toggle()
                    })
                    {
                        Circle()
                            .frame(width: 40)
                            .foregroundColor(Color("starbucks-rewardgold"))
                            .overlay(
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(.white)
                            )
                            .sheet(isPresented: $toggleBasketViewDrinkCustomizer){
                                BasketView(coffee: coffee, customizedDrink: $customizedDrink)
                                    .presentationBackground(.ultraThinMaterial)
                            }
                    }
                    .padding(.horizontal, 15)
                }
                .frame(width: nil, height: 80)
                .background(.thinMaterial)
                .cornerRadius(30)
                .padding([.leading, .trailing], 20)
                .padding(.bottom, 30)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)

    }
}

extension DrinkCustomizer{
    func calculateTotalPrice() -> Int {
        return totalPrice + coffee.selectedCoffee.prices[coffee.selectedSize.index]
    }
    
    func addOrUpdateDrinkInOrder() {
            // Check if a similar drink already exists in the order
            if let existingIndex = customizedDrink.firstIndex(where: { drink in
                // Compare selectedCoffee, selectedSize, and optionArray
                return drink.drink.title == coffee.selectedCoffee.title &&
                drink.drink.drinkSize[drink.drinkSizeIndex] == coffee.selectedSize.volume &&
                    NSDictionary(dictionary: drink.optionArray).isEqual(to: optionArray)
            }) {
                // Update the quantity if the drink already exists
                customizedDrink[existingIndex].quantity += 1
            } else {
                // Add a new entry if the drink doesn't exist
                customizedDrink.append(OrderModel(
                    drink: coffee.selectedCoffee,
                    customizedPrice: calculateTotalPrice(),
                    drinkSizeIndex: coffee.selectedSize.index,
                    quantity: 1,
                    address: "",
                    optionArray: optionArray
                ))
            }
        }
    
    func addToFavourites(){
        if let existingIndex = globalVar.favouritesArray.firstIndex(where: {
            drink in
            // Compare selectedCoffee, selectedSize, and optionArray
            return drink.drink.title == coffee.selectedCoffee.title &&
            drink.drink.drinkSize[drink.drinkSizeIndex] == coffee.selectedSize.volume &&
                NSDictionary(dictionary: drink.optionArray).isEqual(to: optionArray)
        }) {
            if checkFavourites() {
                globalVar.favouritesArray.remove(at: existingIndex)
            }
        } else {
            globalVar.favouritesArray.append(OrderModel(
                drink: coffee.selectedCoffee,
                customizedPrice: calculateTotalPrice(),
                drinkSizeIndex: coffee.selectedSize.index,
                quantity: 1,
                address: "",
                optionArray: optionArray))
        }
    }
    
    func checkFavourites() -> Bool {
        if let existingIndex = globalVar.favouritesArray.firstIndex(where: {
            drink in
            // Compare selectedCoffee, selectedSize, and optionArray
            return drink.drink.title == coffee.selectedCoffee.title &&
            drink.drink.drinkSize[drink.drinkSizeIndex] == coffee.selectedSize.volume &&
                NSDictionary(dictionary: drink.optionArray).isEqual(to: optionArray)
        }) {
            if globalVar.favouritesArray[existingIndex].quantity == 1 {
                return true
            }
        }
        
        return false
    }
}

#Preview{
    ContentView()
        .environmentObject(GlobalModel())
}


