//
//  CardView.swift
//  appta
//
//  Created by Assylzhan Tati on 12/30/23.
//

import SwiftUI

struct MenuCardView: View {
    var tab: TabMenu
    @Binding var currentTab: String

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
                // Food View...
                    VStack {
                        Image(thing.image)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .padding([.top, .bottom], 5)

                        Text(thing.title)
                            .font(.headline)
                            .safeAreaPadding(.horizontal, 20)
                            .frame(height: 50)

                        Button(action: {

                        }) {
                            NavigationLink(destination: DrinkCustomizer(selectedCoffee: thing, options: optionscroll)){
                                Text("\(thing.prices[0])")
                                    .foregroundColor(Color.black)
                                    .fontWeight(.bold)
                                    .frame(width: 100)
                                    .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 28))
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .overlay(content:{
                                        Capsule()
                                            .stroke(Color.white, lineWidth: 1)
                                        
                                        Image(systemName: "tengesign")
                                            .resizable()
                                            .frame(width: 10, height: 10)
                                            .foregroundColor(.black)
                                            .offset(CGSize(width: 30, height: 1))
                                        
                                        Image(systemName: "chevron.right")
                                            .resizable()
                                            .frame(width: 7, height: 13)
                                            .foregroundColor(.black)
                                            .offset(CGSize(width: 60, height: 0))
                                    })
                            }
                        }

                    }
                    .frame(width: 170, height: 280)
                    .background(.thinMaterial)
                    .cornerRadius(25)
                    .shadow(radius: 4)
                }
            }
            .padding()
        }
        .modifier(OffsetModifier(tab: tab, currentTab: $currentTab))
        // setting ID for Scroll View Reader...
        .id(tab.id)
    }
}
