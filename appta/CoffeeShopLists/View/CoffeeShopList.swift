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
            VStack(){
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color("starbucks-rewardgold"))
                    .padding(.bottom, -2)
                Text("Coffee Shops")
                    .font(.title.bold())
                Text("Find all your favorite establishments")
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 70)
            .padding(.bottom, -20)
            
            ScrollView(showsIndicators: false){
                VStack(spacing: 30){
                    ForEach(coffeeshoplist){thing in
                        ScrollView(.horizontal){
                            CoffeeShopPanel(image: thing.image, title: thing.title, num_rest: thing.num_rest)
                        }
                    }
                }
                .padding(.bottom, 100)
                .padding(.top, 30)
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
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("", displayMode: .inline)
    }
}

#Preview {
    CoffeeShopList(coffeeshoplist: coffeeshoplist)
}
