//
//  CardView.swift
//  appta
//
//  Created by Assylzhan Tati on 12/30/23.
//

import SwiftUI

@MainActor
final class DrinksModelViewModel: ObservableObject {
    
    let coffeeshop_id = "mqkKxYkBMX30XJaXgkWn"
    let address_id = "srKh0QPkKzKK0VSr94rA"
    
    @Published private(set) var drinks: [DrinksModel] = []
    
    func getAllDrinks(coffeeshop_id: String, addressId: String, menuId: String) async throws {
        self.drinks = try await MenuManager.shared.getAllDrinks(coffeeshop_id: coffeeshop_id, addressId: address_id, menuId: menuId)
    }
}

struct MenuCardView: View {
    var tab: TabMenu
    @ObservedObject var coffee: SelectedCoffee
    @ObservedObject var globalVars: GlobalVars
    @ObservedObject var viewModelTab: TabMenuModel
    @ObservedObject var viewModelCoffeeshop: CoffeeshopViewModel
    
    @StateObject var viewModelMenu = DrinksModelViewModel()
    
    @State private var toggleDrinkCustomizerMenuCard: Bool = false
    
    @Binding var currentTab: String
    @Binding var customizedDrink: [OrderModel]
    @Binding var cardToggles: [String : Bool]
    @Binding var chosenAddress: AddressModel
    
    let columns: [GridItem] = [
            GridItem(.flexible(), spacing: 70),
            GridItem(.flexible(), spacing: 70)
        ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text(tab.tab)
                .font(.title.bold())
            
            LazyVGrid(columns: columns, spacing: 26) {
                ForEach(viewModelMenu.drinks){thing in
                    Button {
                        if thing.status{
                            updateSelectedCoffee(with: thing)
                            toggleDrinkCustomizerMenuCard.toggle()
                        }
                    } label: {
                        withAnimation(.snappy){
                            VStack(alignment: .leading){
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 165, height: 170)
                                    .overlay(content: {
                                        AsyncImage(url: URL(string: thing.image)){image in
                                            ZStack{
                                                image
                                                    .resizable()
                                                    .frame(width: 200, height: 200)
                                                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                                    .padding([.top, .bottom], 5)
                                                    .offset(CGSize(width: 0, height: -15))

                                                if !thing.status {
                                                    ZStack{
                                                        RoundedRectangle(cornerRadius: 25)
                                                            .frame(width: 180, height: 180)
                                                            .background(.thinMaterial)
                                                            .foregroundColor(.clear)
                                                            .padding([.top, .bottom], 5)
                                                        
                                                        
                                                        Image("outofstock")
                                                            .resizable()
                                                            .frame(width: 100, height: 100)
                                                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                                            .padding([.top, .bottom], 5)
                                                    }
                                                }
                                            }
                                        } placeholder: {
                                            VStack(spacing: 0){
                                                ShimmerView()
                                                    .frame(width: 200, height: 200)
                                                    .padding([.top, .bottom], 5)
                                            }
                                            .offset(CGSize(width: 0, height: -15))
                                        }
                                        
                                        if coffee.selectedCoffee == thing && thing.status {
                                            ZStack{
                                                Image(systemName: "circle")
                                                    .resizable()
                                                    .frame(width: 23, height: 23)
                                                    .foregroundColor(Color("starbucks-rewardgold"))
                                                
                                                Text("M")
                                                    .font(.footnote.bold())
                                                    .foregroundColor(Color("starbucks-rewardgold"))
                                            }
                                            .offset(CGSize(width: 60, height: -65))
                                        }
                                        
                                        VStack(){
                                            Button {
                                                addToFavourites(for: thing)
                                            } label: {
                                                if checkFavourites(for: thing){
                                                    Image(systemName: "heart.fill")
                                                        .foregroundColor(.secondary.opacity(0.6))
                                                } else {
                                                    Image(systemName: "heart.fill")
                                                        .foregroundColor(.red)
                                                }
                                            }
                                        }
                                        .frame(width: 30, height: 30)
                                        .background(.thinMaterial)
                                        .clipShape(Circle())
                                        .offset(CGSize(width: -60, height: -65))
                                    })
                                    .offset(CGSize(width: 0, height: -28))
                                
                                VStack(alignment: .leading, spacing: 3){
                                    HStack(){
                                        if thing.status {
                                            Text(thing == coffee.selectedCoffee ? "\(coffee.selectedCoffee.prices[coffee.selectedSize])" : "\(thing.prices.first!)")
                                                .foregroundColor(!thing.status ? .secondary : .primary)
                                                .fontWeight(.bold)
                                            
                                            Image(systemName: "tengesign")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.primary)
                                                .padding(.leading, -5)
                                        } else {
                                            Image(systemName: "exclamationmark.triangle.fill")
                                                .foregroundColor(Color("starbucks-errorred"))
                                            
                                            Text("Sold out at this store")
                                                .font(.footnote.bold())
                                                .foregroundColor(Color("starbucks-errorred"))
                                        }
                                    }
                                
                                        
                                    Text(thing.title)
                                        .font(.footnote)
                                        .foregroundColor(thing.status ? .primary : .secondary)
                                        .lineLimit(1)
                                    
                                    Text(thing == coffee.selectedCoffee ? "\(coffee.selectedCoffee.drinksize[coffee.selectedSize]) ml" : " \(thing.drinksize.first!) ml")
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
                        if cardToggles[thing.id, default: false] && thing.status{
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
                                            .foregroundColor(.primary)
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
                                            .foregroundColor(.primary)
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
                                if thing.status {
                                    updateSelectedCoffee(with: thing)
                                    cardToggles[thing.id, default: false].toggle()
                                }
                            }) {
                                if thing.status {
                                    Image(systemName: "plus")
                                        .foregroundColor(.primary)
                                        .fontWeight(.semibold)
                                        .frame(width: 100)
                                        .padding(.init(top: 15, leading: 25, bottom: 15, trailing: 33))
                                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).frame(height: 35))
                                } else {
                                    Text("Out of Stock")
                                        .font(.callout.bold())
                                        .foregroundColor(.secondary)
                                        .frame(width: 100)
                                        .padding(.init(top: 15, leading: 25, bottom: 15, trailing: 33))
                                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).frame(height: 35))
                                }
                            }
                            .offset(CGSize(width: 0, height: 120))
                        }
                    })
                    .sheet(isPresented: $toggleDrinkCustomizerMenuCard){
                        DrinkCustomizer(coffee: coffee, globalVars: globalVars, viewModelTab: viewModelTab, viewModelCoffeeshop: viewModelCoffeeshop, customizedDrink: $customizedDrink, chosenAddress: $chosenAddress)
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
        .task {
            try? await viewModelMenu.getAllDrinks(coffeeshop_id: "mqkKxYkBMX30XJaXgkWn", addressId: "srKh0QPkKzKK0VSr94rA", menuId: tab.id)
        }
    }
}

extension MenuCardView{
    func updateSelectedCoffee(with thing: DrinksModel) {
            coffee.selectedCoffee = thing
        }
    
    func calculateQuantity(for cardCoffee: DrinksModel) -> Int {
        var totalQuantityPopup = 0
        if let existingIndex = customizedDrink.firstIndex(where: { drink in
            // Compare selectedCoffee, selectedSize, and optionArray
            return drink.drink.title == cardCoffee.title &&
            drink.drink.drinksize[drink.drinkSizeIndex] == cardCoffee.drinksize[coffee.selectedSize] &&
            NSDictionary(dictionary: drink.optionArray).isEqual(to: viewModelTab.defaultArray)
        }) {
            if customizedDrink[existingIndex].quantity >= 0{
                totalQuantityPopup = customizedDrink[existingIndex].quantity
            }
        }
        return totalQuantityPopup
    }
    
    func subOrUpdateDrinkInOrder(for cardCoffee: DrinksModel) {
        if let existingIndex = customizedDrink.firstIndex(where: { drink in
            // Compare selectedCoffee, selectedSize, and optionArray
            return drink.drink.title == cardCoffee.title &&
            drink.drink.drinksize[drink.drinkSizeIndex] == cardCoffee.drinksize[coffee.selectedSize] &&
            NSDictionary(dictionary: drink.optionArray).isEqual(to: viewModelTab.defaultArray)
        }) {
            if customizedDrink[existingIndex].quantity > 0 {
                customizedDrink[existingIndex].quantity -= 1
            }
        }
    }

    func addOrUpdateDrinkInOrder(for cardCoffee: DrinksModel){
        if let existingIndex = customizedDrink.firstIndex(where: { drink in
            return drink.drink.title == cardCoffee.title &&
            drink.drink.drinksize[drink.drinkSizeIndex] == cardCoffee.drinksize[coffee.selectedSize] &&
                NSDictionary(dictionary: drink.optionArray).isEqual(to: viewModelTab.defaultArray)
        }) {
            customizedDrink[existingIndex].quantity += 1
        } else {
            customizedDrink.append(OrderModel(
                drink: coffee.selectedCoffee,
                customizedPrice: cardCoffee.prices[coffee.selectedSize],
                drinkSizeIndex: coffee.selectedSize,
                quantity: 1,
                address: chosenAddress.address_name,
                optionArray: viewModelTab.defaultArray))
        }
    }
    
    func addToFavourites(for cardCoffee: DrinksModel){
        if let existingIndex = globalVars.favouritesArray.firstIndex(where: {
            drink in
            // Compare selectedCoffee, selectedSize, and optionArray
            return drink.drink.title == coffee.selectedCoffee.title &&
            /*drink.drink.drinksize[drink.drinkSizeIndex] == coffee.selectedSize &&*/
                NSDictionary(dictionary: drink.optionArray).isEqual(to: viewModelTab.defaultArray)
        }) {
            if checkFavourites(for: cardCoffee) {
                globalVars.favouritesArray.remove(at: existingIndex)
            }
        } else {
            globalVars.favouritesArray.append(OrderModel(
                drink: coffee.selectedCoffee,
                customizedPrice: cardCoffee.prices[coffee.selectedSize],
                drinkSizeIndex: coffee.selectedSize,
                quantity: 1,
                address: chosenAddress.address_name,
                optionArray: viewModelTab.defaultArray))
        }
    }
    
    func checkFavourites(for cardCoffee: DrinksModel) -> Bool {
        if let existingIndex = globalVars.favouritesArray.firstIndex(where: {
            drink in
            // Compare selectedCoffee, selectedSize, and optionArray
            return drink.drink.title == coffee.selectedCoffee.title &&
            /*drink.drink.drinksize[drink.drinkSizeIndex] == coffee.selectedSize &&*/
                NSDictionary(dictionary: drink.optionArray).isEqual(to: viewModelTab.defaultArray)
        }) {
            if globalVars.favouritesArray[existingIndex].quantity == 1 {
                return true
            }
        }
        
        return false
    }
}

