//
//  DrinkCustomizer.swift
//  appta
//
//  Created by Assylzhan Tati on 11/19/23.
//

import SwiftUI

@MainActor
final class DrinkCustomizerModel: ObservableObject {
    let coffeeshopId = "mqkKxYkBMX30XJaXgkWn"
    
    // Dummy variable declaration
    @Published var selectedOption: Option = Option(id: "", index: 0, title: "", image: "", imagegold: "")
    @Published var selectedEnlargedOption: OptionType = OptionType(id: "", name: "", image: "", imagegold: "", price: 0)
    //
    
    @Published private(set) var options: [Option] = []
    @Published private(set) var optionUltimates: [Option : [OptionType]] = [:]
    @Published var optionArray: [Option : OptionType] = [:]
    @Published var isClicked: [Option : Bool] = [:]
    
    // Functions
    func getAllOptions(coffeeshop_id: String) async throws {
        self.options = try await DrinkCustomizerManager.shared.getAllOptions(coffeeshop_id: coffeeshopId)
    }
    
    func getAllOptiontypes(coffeeshop_id: String, optionId: String) async throws -> [OptionType] {
        return try await DrinkCustomizerManager.shared.getAllOptiontypes(coffeeshop_id: coffeeshopId, optionId: optionId)
        }
    
    func zip(coffeeshop_id: String) async throws {
        for option in options {
            do {
                let optionTypes = try await getAllOptiontypes(coffeeshop_id: coffeeshop_id, optionId: option.id)
                self.optionUltimates[option] = optionTypes
            } catch {
                print("Error fetching option types: \(error)")
            }
        }
    }
    
    func fillOptionArray() async throws {
        for (key, value) in optionUltimates {
            for optiontype in value {
                if optiontype.price == 0{
                    self.optionArray[key] = optiontype
                    
                }
            }
        }
    }
}

struct DrinkCustomizer: View {
    @StateObject var viewModel = DrinkCustomizerModel()
    
    @ObservedObject var coffee: SelectedCoffee
    @ObservedObject var globalVars: GlobalVars
    @ObservedObject var viewModelTab: TabMenuModel
    @ObservedObject var viewModelCoffeeshop: CoffeeshopViewModel
    
    
    // Dummy Variables
    @State private var isTextExpanded: Bool = false
    @State private var toggleBasketViewDrinkCustomizer: Bool = false
    @State private var toggleFavourites: Bool = false
    //
    
    @Binding var customizedDrink: [OrderModel]
    @Binding var chosenAddress: AddressModel
    
    @State var totalPrice: Int = 0
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        VStack{
            ZStack(alignment: .bottomTrailing) {
                ScrollView(.vertical, showsIndicators: false){
                VStack(){
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
                        AsyncImage(url: URL(string: coffee.selectedCoffee.image)) { image in
                            image
                                .resizable()
                                .clipShape(Circle())
                                .scaledToFit()
                                .frame(width: 400, height: 400)
                        } placeholder: {
                            ShimmerView()
                                .clipShape(Circle())
                                .frame(width: 380, height: 380)
                        }
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
                            Text("KZT \(coffee.selectedCoffee.prices[coffee.selectedSize])")
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
                    
                    DrinkCustomizerOptionScroll(viewModel: viewModel, viewModelTab: viewModelTab, totalPrice: $totalPrice)
                        
                    DrinkCustomizerStatistics()
                        .padding(.bottom, 100)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                }
                .padding(.top, 30)
                .padding(.bottom, 20)
            }
                
                HStack(){
                    VStack{
                        HStack{
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
                                        Capsule()
                                            .frame(width: 120, height: 40)
                                            .foregroundColor(Color("starbucks-rewardgold"))
                                            .overlay(
                                                HStack{
                                                    Text(" Added ")
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.white)
                                                }
                                            )
                                    }
                                } else {
                                    withAnimation(.snappy){
                                        Capsule()
                                            .stroke(Color("starbucks-rewardgold"), lineWidth: 2)
                                            .frame(width: 100, height: 35)
                                            .overlay(
                                                HStack{
                                                    Text(" + Add ")
                                                        .font(.callout.bold())
                                                        .foregroundColor(.primary)
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(Color("starbucks-rewardgold"))
                                                }
                                            )
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .sheet(isPresented: $toggleFavourites){
                                FavouritesView(globalVars: globalVars)
                                    .presentationBackground(.ultraThinMaterial)
                            }
                        }
                        
                        HStack(spacing: 0){
                            HStack(spacing: 5){
                                Button {
                                    subOrUpdateDrinkInOrder(for: coffee.selectedCoffee)
                                } label: {
                                    Image(systemName: "minus")
                                        .foregroundColor(.primary)
                                }
                                .padding(.leading, 10)
                                
                                Spacer(minLength: 0)
                                
                                Text("\(calculateTotalQuantity(for: coffee.selectedCoffee))")
                                    .font(.callout.bold())
                                    .foregroundColor(.primary)
                                
                                Spacer(minLength: 0)
                                
                                Button {
                                    addOrUpdateDrinkInOrder(for: coffee.selectedCoffee)
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(.primary)
                                }
                                .padding(.trailing, 10)
                            }
                            .frame(width: 100, height: 45)
                            .background(.white)
                            .clipShape(Capsule())
                            .padding(.horizontal, 10)
                            
                            Button(action: {
                                toggleBasketViewDrinkCustomizer.toggle()
                            }){
                                Capsule()
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(Color("starbucks-rewardgold"))
                                    .overlay(
                                        HStack{
                                            Image(systemName: "basket")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.white)
                                            
                                            Text("Add to Basket")
                                                .font(.callout.bold())
                                                .foregroundColor(.white)
                                        }
                                    )
                                    .sheet(isPresented: $toggleBasketViewDrinkCustomizer){
                                        BasketView(coffee: coffee, globalVars: globalVars, viewModelTab: viewModelTab, viewModelCoffeeshop: viewModelCoffeeshop, customizedDrink: $customizedDrink, chosenAddress: $chosenAddress)
//                                            .presentationBackground(.ultraThinMaterial)
                                    }
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .padding(.trailing, 15)
                        }
                    }
                }
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
                .cornerRadius(30)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .task{
            try? await viewModel.getAllOptions(coffeeshop_id: "mqkKxYkBMX30XJaXgkWn")
            try? await viewModel.zip(coffeeshop_id: "mqkKxYkBMX30XJaXgkWn")
            let _ = print("Starting here!")
            try? await viewModel.fillOptionArray()
            self.viewModel.selectedOption = viewModel.options.first!
            if let firstOption = viewModel.optionUltimates[viewModel.selectedOption]?.first {
                self.viewModel.selectedEnlargedOption = firstOption
            } else {
                
            }
        }

    }
}

extension DrinkCustomizer{
    func calculateTotalPrice() -> Int {
        return totalPrice + coffee.selectedCoffee.prices[coffee.selectedSize]
    }
    
    func calculateTotalQuantity(for cardCoffee: DrinksModel) -> Int {
        var totalQuantity = 0
        
        if let existingIndex = customizedDrink.firstIndex(where: { drink in
            // Compare selectedCoffee, selectedSize, and optionArray
            return drink.drink.title == cardCoffee.title &&
            drink.drink.drinksize[drink.drinkSizeIndex] == cardCoffee.drinksize[coffee.selectedSize] &&
            NSDictionary(dictionary: drink.optionArray).isEqual(to: viewModelTab.defaultArray)
        }) {
            totalQuantity = customizedDrink[existingIndex].quantity
        }
        
        return totalQuantity
    }
    
    func addOrUpdateDrinkInOrder() {
            // Check if a similar drink already exists in the order
            if let existingIndex = customizedDrink.firstIndex(where: { drink in
                // Compare selectedCoffee, selectedSize, and optionArray
                return drink.drink.title == coffee.selectedCoffee.title
//                &&
//                drink.drink.drinksize[drink.drinkSizeIndex] == coffee.selectedSize
                NSDictionary(dictionary: drink.optionArray).isEqual(to: viewModel.optionArray)
            }) {
                // Update the quantity if the drink already exists
                customizedDrink[existingIndex].quantity += 1
            } else {
                // Add a new entry if the drink doesn't exist
                customizedDrink.append(OrderModel(
                    drink: coffee.selectedCoffee,
                    customizedPrice: calculateTotalPrice(),
                    drinkSizeIndex: coffee.selectedSize,
                    quantity: 1,
                    address: chosenAddress.address_name,
                    optionArray: viewModel.optionArray
                ))
            }
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
    
    func addToFavourites(){
        if let existingIndex = globalVars.favouritesArray.firstIndex(where: {
            drink in
            // Compare selectedCoffee, selectedSize, and optionArray
            return drink.drink.title == coffee.selectedCoffee.title &&
            /*drink.drink.drinksize[drink.drinkSizeIndex] == coffee.selectedSize &&*/
                NSDictionary(dictionary: drink.optionArray).isEqual(to: viewModel.optionArray)
        }) {
            if checkFavourites() {
                globalVars.favouritesArray.remove(at: existingIndex)
            }
        } else {
            globalVars.favouritesArray.append(OrderModel(
                drink: coffee.selectedCoffee,
                customizedPrice: calculateTotalPrice(),
                drinkSizeIndex: coffee.selectedSize,
                quantity: 1,
                address: chosenAddress.address_name,
                optionArray: viewModel.optionArray))
        }
    }
    
    func checkFavourites() -> Bool {
        if let existingIndex = globalVars.favouritesArray.firstIndex(where: {
            drink in
            // Compare selectedCoffee, selectedSize, and optionArray
            return drink.drink.title == coffee.selectedCoffee.title &&
            /*drink.drink.drinksize[drink.drinkSizeIndex] == coffee.selectedSize &&*/
                NSDictionary(dictionary: drink.optionArray).isEqual(to: viewModel.optionArray)
        }) {
            if globalVars.favouritesArray[existingIndex].quantity == 1 {
                return true
            }
        }
        
        return false
    }
}

#Preview{
    ContentView()
}


