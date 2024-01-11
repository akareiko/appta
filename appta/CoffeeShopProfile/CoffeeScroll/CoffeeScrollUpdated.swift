////
////  CoffeeScroll.swift
////  appta
////
////  Created by Assylzhan Tati on 12/1/23.
////
//
//import SwiftUI
//
//struct CoffeeScrollUpdated: View {
//    @State var coffees: [Coffee]
//    @State private var showingCustomizer = false
//    @State private var selectedCoffee: Coffee?
//
//    var body: some View {
//        VStack(alignment: .leading){
//            LoopingScrollView(width: 100, spacing: 50, items: coffees) { coffee in
//                            Button(action: {
//                                // Set the selected coffee to the one that was tapped
//                                self.selectedCoffee = coffee
//                            }) {
//                                VStack {
//                                    Image(coffee.image)
//                                        .resizable()
//                                        .frame(width: 180, height: 180)
//                                            
//                                    Text(coffee.title)
//                                        .font(.callout.bold())
//                                        .foregroundColor(.black)
//                                            
//                                    Text(coffee.price)
//                                        .font(.footnote.bold())
//                                        .foregroundColor(.black)
//                                }
//                                .frame(height: 100)
//                            }
//                        }
//                        .contentMargins(.leading, 40, for: .scrollContent)
//                    }
//                    // Use optional binding for the sheet presentation
//                    .sheet(item: $selectedCoffee) { coffee in
//                        DrinkCustomizer(selectedCoffee: $selectedCoffee, options: optionscroll)
//                            .navigationBarBackButtonHidden(true)
//                    }
//        }
//}
//
//
//
//#Preview {
//    CoffeeScrollUpdated(coffees: coffees)
//}
