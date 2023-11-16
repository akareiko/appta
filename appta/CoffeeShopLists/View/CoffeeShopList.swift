//
//  CoffeeShopList.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//

import SwiftUI

struct CoffeeShopList: View {
    @State var coffeeshoplist: [CoffeeShopListModel]
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(){
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 100)
                .foregroundColor(.white)
                .shadow(radius: 1)
                .padding(.bottom, -7)
                .overlay(content: {
                    HStack(){
                        Image("starbucks-logo")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .offset(CGSize(width: 0.0, height: 3.0))
                        
                        Spacer()
                        
                        Text("COFFEE SHOPS")
                            .font(.custom("Helvetica", size: 15))
                            .offset(CGSize(width: -8.0, height: 7.0))
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .offset(CGSize(width: 0.0, height: 3.0))
                            .frame(width: 20, height: 20)
                        
                    }
                    .offset(CGSize(width: 0, height: 20.0))
                    .padding(.horizontal, 20)
                    .padding(.top, -5)
                })
            
            ScrollView(showsIndicators: false){
                VStack(spacing: 20){
                    ForEach(coffeeshoplist){thing in
                        ScrollView(.horizontal){
                            CoffeeShopPanel(image: thing.image, title: thing.title, raiting: thing.raiting)
                        }
                        .padding(.leading, 12)
                    }
                }
            }
            .padding(.top, 20)
        }
        .ignoresSafeArea(.all)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Circle()
                        .frame(width: 60)
                        .foregroundColor(.black)
                        .overlay(
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.white)
                        )
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
    }
}

#Preview {
    CoffeeShopList(coffeeshoplist: coffeeshoplist)
}
