//
//  MenuRoundedPanel05.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//
import SwiftUI

struct BottomClipper: Shape {
    let bottom: CGFloat

    func path(in rect: CGRect) -> Path {
        Rectangle().path(in: CGRect(x: 0, y: bottom - rect.size.height, width: rect.size.width, height: bottom))
    }
}

struct MenuRoundedPanel05: View {
    @ObservedObject var globalVars: GlobalVars
    @ObservedObject var viewModelCoffeeshop: CoffeeshopViewModel
    
    @State private var isCoffeeShopProfileActive = false
    
//    @Binding var str: Bool
//    @Binding var nestr: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color("starbucks-rewardgold"))

                        Text("Coffee Shops")
                            .font(.title3.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.leading, 30)

                    Text("Your favorite coffee temples")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                }
                
                NavigationLink(destination: CoffeeShopList()){
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("starbucks-rewardgold"))
                            .padding(.trailing, 30)
                    }
            }
            .padding()
//            .background(.white)
//            .shadow(radius: 5)

            ScrollView(.vertical){
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    GeometryReader {
                        let size = $0.size
                        
                        LoopingScrollView(coffeeShopCardOffset: .constant(0), width: 280, spacing: 20, items: MenuRPmodel05) { thing in
                            NavigationLink(destination: CoffeeShopAddressView(globalVars: globalVars, viewModelCoffeeshop: viewModelCoffeeshop).navigationBarBackButtonHidden(true)
                            ) {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 280, height: 140)
                                        .background(.thinMaterial)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .foregroundColor(.clear)
                                    
                                    Image(thing.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 260, height: 120)
                                        .background(.clear)
                                        .shadow(radius: 3)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .overlay(content: {
                                            ZStack{
                                                Text(thing.title)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .padding(.leading, 20)
                                                    .font(.title2.bold())
                                                    .offset(CGSize(width: 0, height: 25))
                                                    .foregroundColor(.white)
                                            }
                                        })
                                }
                            }
                        }
                    }
                    .frame(height: 150)

                }
            }
            .scrollIndicators(.hidden)
        }
    }
}
