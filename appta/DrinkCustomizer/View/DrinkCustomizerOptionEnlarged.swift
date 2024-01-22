//
//  DrinkCustomizerOptionEnlarged.swift
//  appta
//
//  Created by Assylzhan Tati on 12/5/23.
//

import SwiftUI


struct DrinkCustomizerOptionEnlarged: View {
    @Binding var selectedEnlargedOption: OptionType
    @State var isClicked: [Bool] = [true, true, true, true, true]
    @Binding var selectedIndex: Int
    @Binding var totalPrice: Int
    @Binding var optionArray: [Int : OptionType]

    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: .top),
        GridItem(.flexible(), spacing: 10, alignment: .top),
    ]
        
    var body: some View {
        VStack{
            Text("\(optionscroll[selectedIndex].title)")
                .font(.title3.bold())
                .padding(.bottom, 10)

            LazyVGrid(columns: columns) {
                ForEach(optionscroll[selectedIndex].optionTypes, id: \.id) { thing in
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedEnlargedOption = thing
                            if optionArray[selectedIndex] != selectedEnlargedOption {
                                optionArray[selectedIndex] = selectedEnlargedOption
                                isClicked[selectedIndex] = true
                            } else {
                                optionArray[selectedIndex] = optionscroll[selectedIndex].optionTypes.first!
                                isClicked[selectedIndex] = false
                            }
                            self.calculateTotalPrice()
                        }
                    })  {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                                .shadow(radius: 2)
                                .scaleEffect((isClicked[selectedIndex] && selectedEnlargedOption.id == thing.id) || optionArray[selectedIndex] == thing ? 1.1 : 1.0)
                                .overlay{
                                    if (isClicked[selectedIndex] && selectedEnlargedOption.id == thing.id) || optionArray[selectedIndex] == thing {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(
                                                thing.name == "Hot" ? Color.red :
                                                    (thing.name == "Cold" ? Color.blue : Color("starbucks-rewardgold")),
                                                lineWidth: 1
                                            )
                                            .scaleEffect((isClicked[selectedIndex] && selectedEnlargedOption.id == thing.id) || optionArray[selectedIndex] == thing ? 1.1 : 1.0)
                                    }
                                }
                                
                            Image((isClicked[selectedIndex] && selectedEnlargedOption.id == thing.id) || optionArray[selectedIndex] == thing ? thing.image_gold : thing.image)
                                .resizable()
                                .scaleEffect((isClicked[selectedIndex] && selectedEnlargedOption.id == thing.id) || optionArray[selectedIndex] == thing ? 1.1 : 1.0)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                
                            VStack {
                                Text(thing.name)
                                    .font(.callout)
                                    .foregroundColor(
                                        (isClicked[selectedIndex] && selectedEnlargedOption.id == thing.id) || optionArray[selectedIndex] == thing ? (thing.name == "Hot" ? .red : (thing.name == "Cold" ? .blue : Color("starbucks-rewardgold"))) : .black
                                    )
                                HStack(spacing: 3) {
                                    Text(thing.price == nil ? "" : "+ \(String(thing.price ?? 0))")
                                        .font(.callout)
                                        .foregroundColor((isClicked[selectedIndex] && selectedEnlargedOption.id == thing.id) || optionArray[selectedIndex] == thing ? Color("starbucks-rewardgold") : .black)
                                    
                                    Image(systemName: thing.price == nil ? "" : "tengesign")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor((isClicked[selectedIndex] && selectedEnlargedOption.id == thing.id) || optionArray[selectedIndex] == thing ? Color("starbucks-rewardgold") : .black)
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
        .frame(width: 250, height: calculateHeight())

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
                HStack(spacing: 15) {
                    ForEach(optionArray.keys.sorted(), id: \.self) { key in
                        if let chosenOption = optionArray[key]{
                            VStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                                    .shadow(radius: 2)
                                    .padding(1)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(
                                                chosenOption.name == "Hot" ? Color.red :
                                                    (chosenOption.name == "Cold" ? Color.blue : Color("starbucks-rewardgold")),
                                                lineWidth: 1
                                            )
                                            .padding(1)
                                    }
                                    
                                Image(chosenOption.image_gold)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .offset(CGSize(width: 0, height: -45))
                                    
                                Text(chosenOption.name)
                                    .font(.footnote)
                                    .foregroundColor(
                                        chosenOption.id == chosenOption.id ? (chosenOption.name == "Hot" ? .red : (chosenOption.name == "Cold" ? .blue : Color("starbucks-rewardgold"))) : .black
                                    )
                                    .frame(width: 120)
                                    .offset(CGSize(width: 0, height: -40))
                                    
                                HStack(spacing: 3) {
                                    Text(chosenOption.price == nil ? "" : "+ \(String(chosenOption.price ?? 0))")
                                        .font(.footnote)
                                        .foregroundColor(chosenOption.id == chosenOption.id ? Color("starbucks-rewardgold") : .black)
                                        
                                    Image(systemName: chosenOption.price == nil ? "" : "tengesign")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                        .foregroundColor(chosenOption.id == chosenOption.id ? Color("starbucks-rewardgold") : .black)
                                }
                                .padding(.top, -10)
                                .offset(CGSize(width: 0, height: -40))
                                .frame(width: 50)
                            }
                            .frame(width: 100) // Adjust the width to accommodate your content
                            .padding(.leading, key == optionArray.keys.sorted().first ? 15 : 0)
                        }
                    }
                }
                .padding(.bottom, 20)
                .padding(.trailing, 10) // Adjust this padding as needed
            }
            
            HStack(){
                Text("Customization Price:")
                    .font(.headline)
                    .foregroundColor(.black)
                    .foregroundColor(Color("starbucks-rewardgold"))
                
                Text("\(calculateTotalPrice())")
                    .font(.callout)
                    .foregroundColor(Color("starbucks-rewardgold"))
                
                Text("KZT")
                    .font(.callout)
                    .foregroundColor(Color("starbucks-rewardgold"))
                    
            }
            .offset(CGSize(width: 20, height: -40))
        }
        .scrollIndicatorsFlash(onAppear: true)
        .frame(maxWidth: .infinity + 100)
        .offset(CGSize(width: -90, height: 0))
        .padding(.top, 30)
    }
}



extension DrinkCustomizerOptionEnlarged {
    func calculateHeight() -> CGFloat {
        
        let numberOfRows = (optionscroll[selectedIndex].optionTypes.count + columns.count - 1) / columns.count
        let estimatedRowHeight: CGFloat = 100

        let totalHeight = CGFloat(numberOfRows) * estimatedRowHeight

        let additionalHeight: CGFloat = 100
        
        return totalHeight + additionalHeight
    }
    
    func calculateTotalPrice() -> Int {
        var total = 0

        for optionType in optionArray.values {
            if let price = optionType.price {
                total += price
            }
        }
        totalPrice = total
        return total
    }
}

#Preview {
    DrinkCustomizer(selectedCoffee: DrinkModel(index: 0, image: "Caramel-Brule-Latte", title: "Caramel Brule Latte", description: "The Caramel-Brulé Latte is a luxurious coffee drink blending rich espresso with creamy milk, topped with a layer of frothy foam and a drizzle of caramel sauce, torched to create a caramelized topping reminiscent of crème brûlée. It's a perfect blend of bitter espresso and sweet, crunchy caramel, ideal for those who enjoy a sophisticated, dessert-like coffee experience.", prices: [1200, 1400, 1600], drinkSize: [300, 400, 500]), nestr: .constant(false))
}
