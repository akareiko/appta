//
//  CardView.swift
//  appta
//
//  Created by Assylzhan Tati on 12/30/23.
//

import SwiftUI

struct MenuCardView: View {
    
    var tab: TabMenu
    @ObservedObject var coffee: SelectedCoffee
    @ObservedObject var globalVar: GlobalModel
    
    var optionArrayMenu: [Int : OptionType] = [
        0 : optionscroll[0].optionTypes.first!,
        1 : optionscroll[1].optionTypes.first!,
        2 : optionscroll[2].optionTypes.first!,
        3 : optionscroll[3].optionTypes.first!,
        4 : optionscroll[4].optionTypes.first!,
    ]
    
    @State private var toggleDrinkCustomizerMenuCard: Bool = false
    
    @Binding var currentTab: String
    @Binding var customizedDrink: [OrderModel]
    @Binding var cardToggles: [String : Bool]
    
    let columns: [GridItem] = [
            GridItem(.flexible(), spacing: 70),
            GridItem(.flexible(), spacing: 70)
        ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text(tab.tab)
                .font(.title.bold())
            
            LazyVGrid(columns: columns, spacing: 26) {
                ForEach(tab.drinkList){thing in
                    Button {
                        updateSelectedCoffee(with: thing)
                        toggleDrinkCustomizerMenuCard.toggle()
                    } label: {
                        withAnimation(.snappy){
                            VStack(alignment: .leading){
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 165, height: 170)
                                    .overlay(content: {
                                        Image("\(thing.image)")
                                            .resizable()
                                            .frame(width: 200, height: 200)
                                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                            .padding([.top, .bottom], 5)
                                            .offset(CGSize(width: 0, height: -15))
                                        
                                        if coffee.selectedCoffee == thing {
                                            ZStack{
                                                Image(systemName: "circle")
                                                    .resizable()
                                                    .frame(width: 23, height: 23)
                                                    .foregroundColor(Color("starbucks-rewardgold"))
                                                
                                                
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 12, height: 12)
                                                    .foregroundColor(Color("starbucks-rewardgold"))
                                            }
                                            .offset(CGSize(width: 60, height: -65))
                                        }
                                    })
                                    .offset(CGSize(width: 0, height: -28))
                                
                                VStack(alignment: .leading, spacing: 3){
                                    HStack(){
                                        Text(thing == coffee.selectedCoffee ? "\(coffee.selectedCoffee.prices[coffee.selectedSize.index])" : "\(thing.prices.first!)")
                                            .foregroundColor(Color.black)
                                            .fontWeight(.bold)
                                        
                                        Image(systemName: "tengesign")
                                            .resizable()
                                            .frame(width: 10, height: 10)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                            .padding(.leading, -5)
                                    }
                                        
                                    Text(thing.title)
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                    
                                    Text(thing == coffee.selectedCoffee ? "\(coffee.selectedSize.volume) ml" : "\(thing.drinkSize.first!) ml")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                }
                                .offset(CGSize(width: 5, height: -25))
                                
                            }
                            .frame(width: 180, height: 300)
                            .background(.thinMaterial)
                            .cornerRadius(25)
                            .shadow(radius: 3)
                        }
                    }
                    .overlay(content: {
                        if cardToggles[thing.id, default: false] {
                            withAnimation(.snappy){
                                HStack{
                                    Button{
                                        updateSelectedCoffee(with: thing)
                                        if calculateQuantity(for: thing) > 0 {
                                            subOrUpdateDrinkInOrder(for: thing)
                                        } else {
                                            subOrUpdateDrinkInOrder(for: thing)
                                            cardToggles[thing.id, default: false].toggle()
                                        }
                                    } label:{
                                        Image(systemName: "minus")
                                            .font(.callout)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                    .padding(.leading, -15)
                                    
                                    Spacer(minLength: 0)
                                    
                                    withAnimation(.easeInOut){
                                        Text("\(calculateQuantity(for: thing))")
                                            .font(.callout.bold())
                                    }
                                    
                                    Spacer(minLength: 0)
                                    
                                    Button {
                                        updateSelectedCoffee(with: thing)
                                        addOrUpdateDrinkInOrder(for: thing)
                                    } label: {
                                        Image(systemName: "plus")
                                            .font(.callout)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                    .padding(.trailing, -15)
                                }
                                .frame(width: 100, height: 40)
                                .padding(.init(top: 0, leading: 25, bottom: 0, trailing: 33))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .offset(CGSize(width: 0, height: 120))
                                .onTapGesture {
                                    updateSelectedCoffee(with: thing)
                                }
                                
                            }
                        } else {
                            Button(action: {
                                updateSelectedCoffee(with: thing)
                                cardToggles[thing.id, default: false].toggle()
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(Color.black)
                                    .fontWeight(.semibold)
                                    .frame(width: 100)
                                    .padding(.init(top: 15, leading: 25, bottom: 15, trailing: 33))
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).frame(height: 35))
                            }
                            .offset(CGSize(width: 0, height: 120))
                        }
                    })
                    .sheet(isPresented: $toggleDrinkCustomizerMenuCard){
                        DrinkCustomizer(coffee: coffee, globalVar: globalVar, customizedDrink: $customizedDrink)
                            .presentationBackground(.ultraThinMaterial)
                    }
                }
            }
            .padding()
            .padding(.horizontal, 5)
        }
        .modifier(OffsetModifier(tab: tab, currentTab: $currentTab))
        // setting ID for Scroll View Reader...
        .id(tab.id)
    }
}

extension MenuCardView{
    func updateSelectedCoffee(with thing: DrinkModel) {
            coffee.selectedCoffee = thing
        }
    
    func calculateQuantity(for cardCoffee: DrinkModel) -> Int {
        var totalQuantityPopup = 0
        if let existingIndex = customizedDrink.firstIndex(where: { drink in
            // Compare selectedCoffee, selectedSize, and optionArray
            return drink.drink.title == cardCoffee.title &&
            drink.drink.drinkSize[drink.drinkSizeIndex] == cardCoffee.drinkSize[coffee.selectedSize.index] &&
                NSDictionary(dictionary: drink.optionArray).isEqual(to: optionArrayMenu)
        }) {
            if customizedDrink[existingIndex].quantity >= 0{
                totalQuantityPopup = customizedDrink[existingIndex].quantity
            }
        }
        return totalQuantityPopup
    }
    
    func subOrUpdateDrinkInOrder(for cardCoffee: DrinkModel) {
        if let existingIndex = customizedDrink.firstIndex(where: { drink in
            // Compare selectedCoffee, selectedSize, and optionArray
            return drink.drink.title == cardCoffee.title &&
            drink.drink.drinkSize[drink.drinkSizeIndex] == coffee.selectedSize.volume &&
                NSDictionary(dictionary: drink.optionArray).isEqual(to: optionArrayMenu)
        }) {
            customizedDrink[existingIndex].quantity -= 1
        }
    }

    func addOrUpdateDrinkInOrder(for cardCoffee: DrinkModel){
        if let existingIndex = customizedDrink.firstIndex(where: { drink in
            return drink.drink.title == cardCoffee.title &&
            drink.drink.drinkSize[drink.drinkSizeIndex] == coffee.selectedSize.volume &&
                NSDictionary(dictionary: drink.optionArray).isEqual(to: optionArrayMenu)
        }) {
            customizedDrink[existingIndex].quantity += 1
        } else {
            customizedDrink.append(OrderModel(
                drink: coffee.selectedCoffee,
                customizedPrice: cardCoffee.prices[coffee.selectedSize.index],
                drinkSizeIndex: coffee.selectedSize.index,
                quantity: 1,
                address: "",
                optionArray: optionArrayMenu))
        }
    }
}
