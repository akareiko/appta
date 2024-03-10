//
//  DrinkCustomizerOptionEnlarged.swift
//  appta
//
//  Created by Assylzhan Tati on 12/5/23.
//

import SwiftUI

struct DrinkCustomizerOptionEnlarged: View {
    @ObservedObject var viewModel: DrinkCustomizerModel
    
    @Binding var totalPrice: Int
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: .top),
        GridItem(.flexible(), spacing: 10, alignment: .top),
    ]
    
    var body: some View {
        VStack{
            Text("\(viewModel.selectedOption.title)")
                .font(.title3.bold())
                .foregroundColor(.black)
                .padding(.bottom, 10)
                .padding(.trailing, 10)
            
            LazyVGrid(columns: columns) {
                ForEach(viewModel.optionUltimates[viewModel.selectedOption] ?? [], id: \.id) { thing in
                    Button(action: {
                        withAnimation(.spring()) {
                            self.viewModel.selectedEnlargedOption = thing
                            if viewModel.optionArray[viewModel.selectedOption] != viewModel.selectedEnlargedOption {
                                self.viewModel.optionArray[viewModel.selectedOption] = viewModel.selectedEnlargedOption
                                self.viewModel.isClicked[viewModel.selectedOption] = true
                            } else {
                                self.viewModel.optionArray[viewModel.selectedOption] = viewModel.defaultArray[viewModel.selectedOption]
                                self.viewModel.isClicked[viewModel.selectedOption] = false
                            }
                            calculateTotalPrice()
                        }
                    })  {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                                .shadow(radius: 2)
                                .scaleEffect((viewModel.isClicked[viewModel.selectedOption] ?? false && viewModel.selectedEnlargedOption.id == thing.id) || viewModel.optionArray[viewModel.selectedOption] == thing ? 1.1 : 1.0)
                                .overlay{
                                    if (viewModel.isClicked[viewModel.selectedOption] ?? false && viewModel.selectedEnlargedOption.id == thing.id) || viewModel.optionArray[viewModel.selectedOption] == thing {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(
                                                thing.name == "Hot" ? Color.red :
                                                    (thing.name == "Cold" ? Color.blue : Color("starbucks-rewardgold")),
                                                lineWidth: 1
                                            )
                                            .scaleEffect((viewModel.selectedEnlargedOption.id == thing.id) || viewModel.optionArray[viewModel.selectedOption] == thing ? 1.1 : 1.0)
                                    }
                                }
                            
                            AsyncImage(url: URL(string: (viewModel.isClicked[viewModel.selectedOption] ?? false && viewModel.selectedEnlargedOption.id == thing.id) || viewModel.optionArray[viewModel.selectedOption] == thing ? thing.imagegold : thing.image)) { image in
                                image
                                    .resizable()
                                    .scaleEffect((viewModel.isClicked[viewModel.selectedOption] ?? false && viewModel.selectedEnlargedOption.id == thing.id) || viewModel.optionArray[viewModel.selectedOption] == thing ? 1.1 : 1.0)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            } placeholder: {
                                ShimmerView()
                                    .clipShape(Circle())
                                    .frame(width: 50, height: 50)
                            }
                            
                            VStack {
                                Text(thing.name)
                                    .font(.callout)
                                    .foregroundColor(
                                        (viewModel.isClicked[viewModel.selectedOption] ?? false && viewModel.selectedEnlargedOption.id == thing.id) || viewModel.optionArray[viewModel.selectedOption] == thing ? (thing.name == "Hot" ? .red : (thing.name == "Cold" ? .blue : Color("starbucks-rewardgold"))) : .black
                                    )
                                HStack(spacing: 3) {
                                    Text(thing.price == 0 ? "" : "+ \(String(thing.price))")
                                        .font(.callout)
                                        .foregroundColor((viewModel.isClicked[viewModel.selectedOption] ?? false && viewModel.selectedEnlargedOption.id == thing.id) || viewModel.optionArray[viewModel.selectedOption] == thing ? Color("starbucks-rewardgold") : .black)
                                    
                                    Image(systemName: thing.price == 0 ? "" : "tengesign")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor((viewModel.isClicked[viewModel.selectedOption] ?? false && viewModel.selectedEnlargedOption.id == thing.id) || viewModel.optionArray[viewModel.selectedOption] == thing ? Color("starbucks-rewardgold") : .black)
                                }
                                .padding(.top, -10)
                            }
                            .frame(width: 130)
                            .padding(.top, 125)
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, -40)
                }
            }
        }
        .frame(width: 250, height: 400)
        
        VStack(alignment: .leading) {
            Rectangle()
                .frame(width: 220, height: 1)
                .foregroundColor(Color("starbucks-rewardgold"))
                .offset(CGSize(width: 100, height: -20))
            
            Text("Your chosen options")
                .font(.headline.bold())
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(viewModel.options){option in
                        VStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .shadow(radius: 2)
                                .padding(1)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(
                                            viewModel.optionArray[option]?.name ?? "" == "Hot" ? Color.red :
                                                (viewModel.optionArray[option]?.name ?? "" == "Cold" ? Color.blue : Color("starbucks-rewardgold")),
                                            lineWidth: 1
                                        )
                                        .padding(1)
                                }
                            
                            AsyncImage(url: URL(string: viewModel.optionArray[option]?.imagegold ?? "")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                            } placeholder: {
                                ShimmerView()
                                    .clipShape(Circle())
                                    .frame(width: 30, height: 30)
                            }
                            .offset(CGSize(width: 0, height: -45))
                            
                            Text(viewModel.optionArray[option]?.name ?? "Default Name")
                                .font(.footnote)
                                .foregroundColor(
                                    viewModel.optionArray[option]?.id ?? "" == viewModel.optionArray[option]?.id ?? "" ? (viewModel.optionArray[option]?.name ?? "" == "Hot" ? .red : (viewModel.optionArray[option]?.name ?? "" == "Cold" ? .blue : Color("starbucks-rewardgold"))) : .black
                                )
                                .frame(width: 120)
                                .offset(CGSize(width: 0, height: -40))
                            
                            HStack(spacing: 3) {
                                Text(viewModel.optionArray[option]?.price ?? 0 == 0 ? "" : "+ \(String(viewModel.optionArray[option]?.price ?? 0))")
                                    .font(.footnote)
                                    .foregroundColor(viewModel.optionArray[option]?.id ?? "" == viewModel.optionArray[option]?.id ?? "" ? Color("starbucks-rewardgold") : .black)
                                
                                Image(systemName: viewModel.optionArray[option]?.price ?? 0 == 0 ? "" : "tengesign")
                                    .resizable()
                                    .frame(width: 8, height: 8)
                                    .foregroundColor(viewModel.optionArray[option]?.id ?? "" == viewModel.optionArray[option]?.id ?? "" ? Color("starbucks-rewardgold") : .black)
                            }
                            .padding(.top, -10)
                            .offset(CGSize(width: 0, height: -40))
                            .frame(width: 50)
                        }
                        .frame(width: 100)
                    }
                }
                .padding(.bottom, 20)
                .padding(.trailing, 10)
            }
            
            HStack(){
                Text("Customization Price:")
                    .font(.headline)
                    .foregroundColor(.black)
                    .foregroundColor(Color("starbucks-rewardgold"))
                
                Text("\(totalPrice)")
                    .font(.callout)
                    .foregroundColor(Color("starbucks-rewardgold"))
                
                Text("KZT")
                    .font(.callout)
                    .foregroundColor(Color("starbucks-rewardgold"))
                
            }
            .offset(CGSize(width: 20, height: -40))
        }
        .scrollIndicatorsFlash(onAppear: true)
        .frame(maxWidth: .infinity)
        .offset(CGSize(width: -90, height: 0))
        .padding(.top, 30)
    }
}

extension DrinkCustomizerOptionEnlarged {
    
    func calculateTotalPrice() {
        var total = 0

        for optionType in viewModel.optionArray.values {
            total += optionType.price
        }
        
        self.totalPrice = total
    }
}

