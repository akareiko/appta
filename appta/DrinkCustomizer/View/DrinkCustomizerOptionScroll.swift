//
//  OptionScroll.swift
//  appta
//
//  Created by Assylzhan Tati on 12/4/23.
//

import SwiftUI

struct DrinkCustomizerOptionScroll: View {
    @ObservedObject var viewModel: DrinkCustomizerModel
    @ObservedObject var viewModelTab: TabMenuModel
    @State var showEnlargedView = false
    
    @Binding var totalPrice: Int
    
    var body: some View {
        VStack(){
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Options")
                        .font(.title3.bold())
                        .foregroundColor(.black)
                    
                    Text("Make your beverage even better!")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 20)
                
                let screenWidth = UIScreen.main.bounds.width // Adjust as necessary for your layout
                let spacing: CGFloat = 60
                let totalSpacing = spacing * 3 // Spacing for 3 gaps between 4 elements
                let elementWidth = (screenWidth - totalSpacing) / 4
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 50){
                        ForEach(viewModel.options){thing in
                            Button(action: {
                                withAnimation(.spring()) {
                                    if viewModel.selectedOption.id == thing.id && showEnlargedView {
                                        showEnlargedView.toggle()
                                    } else {
                                        self.viewModel.selectedOption = thing
                                        showEnlargedView = true
                                    }
                                }
                            }) {
                                withAnimation(.spring()) {
                                    AsyncImage(url: URL(string: viewModel.selectedOption.id == thing.id && showEnlargedView ? thing.imagegold : thing.image)) { image in
                                        image
                                            .resizable()
                                    } placeholder: {
                                        ShimmerView()
                                            .clipShape(Circle())
                                    }
                                    .scaleEffect(viewModel.selectedOption.id == thing.id && showEnlargedView ? 1.25 : 1.0)
                                    .frame(width: 35, height: 35)
                                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                                    .overlay(content:{
                                        if viewModel.selectedOption.id == thing.id && showEnlargedView {
                                            Rectangle()
                                                .frame(width: 40, height: 2)
                                                .foregroundColor(Color("starbucks-rewardgold"))
                                                .padding(.top, 85)
                                        }
                                        
                                        Text(thing.title)
                                            .font(.caption2)
                                            .scaleEffect(viewModel.selectedOption.id == thing.id && showEnlargedView ? 1.25 : 1.0)
                                            .foregroundColor(viewModel.selectedOption.id == thing.id && showEnlargedView ? Color("starbucks-rewardgold") : .secondary)
                                            .frame(width: 70)
                                            .padding(.top, 65)
                                        
                                    })
                                }
                            }
                            .frame(width: elementWidth)
                        }
                    }
                    .frame(height: 80)
                    .padding(.horizontal, 10)
                }
                .frame(width: screenWidth)
                .scrollTargetBehavior(.paging)
                .contentMargins(.leading, 5, for: .scrollContent)
            }
        }
        
        if showEnlargedView == false {
            Rectangle()
                .frame(width: 220, height: 1)
                .foregroundColor(Color("starbucks-rewardgold"))
                .padding(.top, 10)
        }
        
        if showEnlargedView {
            DrinkCustomizerOptionEnlarged(viewModel: self.viewModel, viewModelTab: self.viewModelTab, totalPrice: $totalPrice)
                .padding(.top, 20)
        }
    }
}

#Preview {
    DrinkCustomizerOptionScroll(viewModel: DrinkCustomizerModel(), viewModelTab: TabMenuModel(), totalPrice: .constant(1200))
}

