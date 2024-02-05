////
////  MenuCardClass.swift
////  appta
////
////  Created by Assylzhan Tati on 1/25/24.
////
//
//import SwiftUI
//
//class MenuCard: ObservableObject{
//    @ObservedObject var coffee: SelectedCoffee
//    @ObservedObject var toggleShow: ToggleShow
//    
//    var thing: DrinkModel
//    var optionArrayMenu: [Int : OptionType] = [
//        0 : optionscroll[0].optionTypes.first!,
//        1 : optionscroll[1].optionTypes.first!,
//        2 : optionscroll[2].optionTypes.first!,
//        3 : optionscroll[3].optionTypes.first!,
//        4 : optionscroll[4].optionTypes.first!,
//    ]
//    
//    @Binding var customizedDrink: [OrderModel]
//    
//    var body: some View{
//        Button {
//            self.toggleShow.toggleShowDrinkCustomizer()
//        } label: {
//            withAnimation(.snappy){
//                VStack {
//                    Image(self.thing.image)
//                        .resizable()
//                        .frame(width: 150, height: 150)
//                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
//                        .padding([.top, .bottom], 5)
//                        .offset(CGSize(width: 0, height: -30))
//                    
//                    Text(self.thing.title)
//                        .font(.headline)
//                        .foregroundColor(.black)
//                        .safeAreaPadding(.horizontal, 20)
//                        .frame(height: 50)
//                        .offset(CGSize(width: 0, height: -30))
//                }
//                .frame(width: 170, height: 280)
//                .background(.thinMaterial)
//                .cornerRadius(25)
//                .shadow(radius: 4)
//            }
//        }
//        
//        .overlay(content: {
//            if false {
//                withAnimation(.snappy){
//                    HStack{
//                        Button {
//                            self.subOrUpdateDrinkInOrder()
//                        } label: {
//                            RoundedRectangle(cornerRadius: 15)
//                                .frame(width: 35, height: 35)
//                                .foregroundColor(Color("starbucks-rewardgold"))
//                                .overlay(content: {
//                                    Image(systemName: "minus")
//                                        .font(.callout)
//                                        .fontWeight(.bold)
//                                        .foregroundColor(.white)
//                                })
//                        }
//                        .padding(.leading, -15)
//                        
//                        Spacer(minLength: 0)
//                        
//                        Text("\(calculateQuantity())")
//                            .font(.callout.bold())
//                        
//                        Spacer(minLength: 0)
//                        
//                        Button {
//                            self.addOrUpdateDrinkInOrder()
//                        } label: {
//                            RoundedRectangle(cornerRadius: 15)
//                                .frame(width: 35, height: 35)
//                                .foregroundColor(Color("starbucks-rewardgold"))
//                                .overlay(content: {
//                                    Image(systemName: "plus")
//                                        .font(.callout)
//                                        .fontWeight(.bold)
//                                        .foregroundColor(.white)
//                                })
//                        }
//                        .padding(.trailing, -15)
//                    }
//                    .frame(width: 100, height: 50)
//                    .padding(.init(top: 0, leading: 25, bottom: 0, trailing: 33))
//                    .clipShape(RoundedRectangle(cornerRadius: 15))
//                    .background(Color.white)
//                    .clipShape(RoundedRectangle(cornerRadius: 15))
//                    .offset(CGSize(width: 0, height: 105))
//                }
//            } else {
//                Button(action: {
////                    self.toggleShow.showMenuCardStepper.toggle()
//                    self.toggleShow.toggleShowCustomPopup()
//                }) {
//                    Text("\(thing.prices[0])")
//                        .foregroundColor(Color.black)
//                        .fontWeight(.bold)
//                        .frame(width: 100)
//                        .padding(.init(top: 15, leading: 25, bottom: 15, trailing: 33))
//                        .background(Color.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 15))
//                        .overlay(content:{
//                            Capsule()
//                                .stroke(Color.white, lineWidth: 1)
//                            
//                            Image(systemName: "tengesign")
//                                .resizable()
//                                .frame(width: 10, height: 10)
//                                .foregroundColor(.black)
//                                .offset(CGSize(width: 30, height: 1))
//                            
//                            Image(systemName: "chevron.right")
//                                .resizable()
//                                .frame(width: 7, height: 13)
//                                .foregroundColor(.black)
//                                .offset(CGSize(width: 60, height: 0))
//                        })
//                }
//                .offset(CGSize(width: 0, height: 105))
//            }
//        })
//    }
//    
//    func calculateQuantity() -> Int{
//        var totalQuantityPopup = 0
//        if let existingIndex = customizedDrink.firstIndex(where: { drink in
//            // Compare selectedCoffee, selectedSize, and optionArray
//            return drink.title == coffee.selectedCoffee.title &&
//                drink.drinkSize == coffee.selectedSize.volume &&
//                NSDictionary(dictionary: drink.optionArray).isEqual(to: optionArrayMenu)
//        }) {
//            totalQuantityPopup = customizedDrink[existingIndex].quantity
//        }
//        return totalQuantityPopup
//    }
//    
//    func subOrUpdateDrinkInOrder() {
//        print(customizedDrink)
//        if let existingIndex = customizedDrink.firstIndex(where: { drink in
//            // Compare selectedCoffee, selectedSize, and optionArray
//            return drink.title == coffee.selectedCoffee.title &&
//                drink.drinkSize == coffee.selectedSize.volume &&
//                NSDictionary(dictionary: drink.optionArray).isEqual(to: optionArrayMenu)
//        }) {
//            customizedDrink[existingIndex].quantity -= 1
//        }
//    }
//
//    func addOrUpdateDrinkInOrder(){
//        print(customizedDrink)
//        if let existingIndex = customizedDrink.firstIndex(where: { drink in
//            return drink.title == coffee.selectedCoffee.title &&
//                drink.drinkSize == coffee.selectedSize.volume &&
//                NSDictionary(dictionary: drink.optionArray).isEqual(to: optionArrayMenu)
//        }) {
//            customizedDrink[existingIndex].quantity += 1
//        } else {
//            customizedDrink.append(OrderModel(
//            image: coffee.selectedCoffee.image,
//            title: coffee.selectedCoffee.title,
//            customizedPrice: coffee.selectedCoffee.prices[coffee.selectedSize.index],
//            drinkSize: coffee.selectedSize.volume,
//            quantity: 1,
//            address: "",
//            optionArray: optionArrayMenu))
//        }
//    }
//}
//
//#Preview{
//    AnimatedHeader()
//}
