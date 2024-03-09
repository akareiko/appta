//
//  FavouritesView.swift
//  appta
//
//  Created by Assylzhan Tati on 1/12/24.
//

import SwiftUI

//@MainActor
//final class FavouritesViewModel: ObservableObject {
//    
//    @Published private(set) var 
//}

struct FavouritesView: View {
    @ObservedObject var globalVars: GlobalVars
    @ObservedObject var viewModel = DrinkCustomizerOptionScrollModel()
    
    @State private var toggleBasketViewFavouriteView: Bool = false
    @State private var addedToBasket: Bool = false
    @State private var descriptShow: [String : Bool] = [:]
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            VStack(){
                VStack(){
                    HStack{
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
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color("starbucks-rewardgold"))
                    }
                    
                    Text("Favourites")
                        .font(.title.bold())
                        .foregroundColor(.black)
                    
                    Text("Make your orders faster")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    
                    
                }
                .padding(.top, 30)
                .frame(width: UIScreen.main.bounds.width, height: 250)
                
                VStack(alignment: .leading){
                    ScrollView(showsIndicators: false){
                        VStack(spacing: 15){
                            ForEach(globalVars.favouritesArray){thing in
                                SwipeAction(cornerRadius: 15, direction: .trailing) {
                                    BasketCardView(order: thing)
                                } actions: {
                                    Action(tint: Color("starbucks-errorred"), icon: "trash.fill", text: "Delete"){
                                        withAnimation(.easeInOut){
                                        globalVars.favouritesArray.removeAll(where: {$0 == thing })
                                        }
                                    }
                                }
                                
                                if descriptShow[thing.id, default: false] {
                                    VStack(alignment: .leading){
                                        Text("Details:")
                                            .font(.callout.bold())
                                            .foregroundColor(.black)
                                        
                                        HStack{
                                            VStack(alignment: .leading){
                                                Text("Drink: \(thing.drink.title)")
                                                    .font(.footnote)
                                                    .foregroundColor(.black)
                                                
                                                Text("Milk: \(thing.optionArray[viewModel.selectedOption]?.name ?? "")")
                                                    .font(.footnote)
                                                    .foregroundColor(.black)
                                                
                                                Text("Syrup: \(thing.optionArray[viewModel.selectedOption]?.name ?? "")")
                                                    .font(.footnote)
                                                    .foregroundColor(.black)
                                            }
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .leading){
                                                Text("Temperature: \(thing.optionArray[viewModel.selectedOption]?.name ?? "")")
                                                    .font(.footnote)
                                                    .foregroundColor(.black)
                                                
                                                Text("Blend: \(thing.optionArray[viewModel.selectedOption]?.name ?? "")")
                                                    .font(.footnote)
                                                    .foregroundColor(.black)
                                                
                                                Text("Strength: \(thing.optionArray[viewModel.selectedOption]?.name ?? "")")
                                                    .font(.footnote)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 15)
                                }
                            }
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 18)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.ultraThinMaterial)
                    .cornerRadius(25)
                }
                .ignoresSafeArea(.all)
            }
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Capsule()
                    .frame(width: UIScreen.main.bounds.width - 30, height: 50)
                    .foregroundColor(.black)
                    .overlay {
                        VStack(alignment: .leading){
                            HStack(){
                                Image(systemName: "basket")
                                    .foregroundColor(.white)
                                
                                Text("Add to Basket")
                                    .font(.headline)
                            }
                        }
                }
            }
            .offset(CGSize(width: 0, height: UIScreen.main.bounds.height - 500))
        }
    }
    
    @ViewBuilder
    func BasketCardView(order: OrderModel) -> some View {
        VStack(alignment: .leading){
            Button {
                withAnimation(.spring){
                    descriptShow[order.id, default: false].toggle()
                }
            } label: {
                HStack(spacing: 8){
                    Circle()
                        .frame(width: 55)
                        .background(.regularMaterial)
                        .clipShape(Circle())
                        .foregroundColor(.clear)
                        .overlay {
                            Image(order.drink.image)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .offset(CGSize(width: 0, height: -3))
                        }
                        .padding(.horizontal, 10)
                        
                    
                    Spacer(minLength: 0)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text(order.drink.title)
                            .font(.callout.bold())
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                        
                        Text("Size: \(order.drink.drink_size[order.drinkSizeIndex]) ml")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                    .frame(width: 100)
                    .padding(.leading, -20)
                    
                    Spacer(minLength: 0)
                    
                    if !addedToBasket {
                        HStack{
                            Text("KZT")
                                .font(.callout.bold())
                                .foregroundColor(.black)
                                .lineLimit(1)
                            
                            Text("\(order.customizedPrice)")
                                .font(.callout)
                                .foregroundColor(.black)
                                .lineLimit(1)
                            
                            Image(systemName: "tengesign")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        addedToBasket.toggle()
                    } label: {
                        if !addedToBasket {
                            ZStack{
                                Circle()
                                    .frame(width: 25)
                                    .background(.thinMaterial)
                                    .foregroundColor(.clear)
                                    .clipShape(Circle())
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.secondary)
                            }
                        } else {
                            HStack{
                                Button {
                                    
                                } label: {
                                    Image(systemName: "minus")
                                        .foregroundColor(.secondary)
                                }
                                .padding(.horizontal, 10)
                                
                                Text("1")
                                    .font(.callout)
                                    .foregroundColor(.black)
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(.secondary)
                                }
                                .padding(.horizontal, 10)
                            }
                            .frame(height: 40)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                        }
                    }

                    Spacer()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 65)
    }
    
}


#Preview{
    ContentView()
        .environmentObject(GlobalVars())
}


//HStack{
//    Text("")
//        .font(.subheadline.bold())
//    
//    Spacer()
//    
//    Button {
//        
//    } label: {
//        ZStack{
//            Circle()
//                .frame(width: 25)
//                .background(.thinMaterial)
//                .cornerRadius(25)
//                .foregroundColor(.clear)
//            
//            
//            Image(systemName: "chevron.forward")
//                .foregroundColor(.secondary)
//        }
//    }
//    .padding(.horizontal, 20)
//}
