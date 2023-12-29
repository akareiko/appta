//
//  DrinkCustomizerOptionEnlarged.swift
//  appta
//
//  Created by Assylzhan Tati on 12/5/23.
//

import SwiftUI

struct DrinkCustomizerOptionEnlarged: View {
    @State private var selectedOption: OptionType
    var options: [Option]
    @State var optionArray: [Int : OptionType] = [:]
    @State var isClicked: [Bool]
    private let selectedIndex: Int
    

    init(selectedIndex: Int, options: [Option], optionArray: [Int: OptionType], isClicked: [Bool]) {
            self.selectedIndex = selectedIndex
            self.options = options
            self._selectedOption = State(initialValue: options[selectedIndex].optionTypes.first ?? OptionType(name: "", image: "", image_gold: "", price: nil))
            self._optionArray = State(initialValue: optionArray)

            self._isClicked = State(initialValue: Array(repeating: false, count: options.count))
        }
        
        let columns: [GridItem] = [
            GridItem(.flexible(), spacing: 10, alignment: .top),
            GridItem(.flexible(), spacing: 10, alignment: .top),
        ]
        
        var body: some View {
            VStack {
                Text("\(options[selectedIndex].title)")
                    .font(.title3.bold())
                    .padding(.bottom, 10)

                LazyVGrid(columns: columns) {
                    ForEach(options[selectedIndex].optionTypes, id: \.id) { thing in
                        
                        Button(action: {
                            withAnimation(.spring()) {
                                selectedOption = thing
                                if optionArray[selectedIndex] != selectedOption {
                                    optionArray[selectedIndex] = (selectedOption)
                                    isClicked[selectedIndex] = true
                                } else {
                                    optionArray[selectedIndex] = nil
                                    isClicked[selectedIndex] = false
                                }

                            }
                        })  {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 70, height: 70)
                                    .foregroundColor(.white)
                                    .shadow(radius: 2)
                                    .scaleEffect(isClicked[selectedIndex] && selectedOption.id == thing.id ? 1.1 : 1.0)
                                    .overlay {
                                        if isClicked[selectedIndex] && selectedOption.id == thing.id {
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(
                                                    thing.name == "Hot" ? Color.red :
                                                        (thing.name == "Cold" ? Color.blue : Color("starbucks-rewardgold")),
                                                    lineWidth: 1
                                                )
                                                .scaleEffect(isClicked[selectedIndex] && selectedOption.id == thing.id ? 1.1 : 1.0)
                                        }
                                    }
                                
                                Image(isClicked[selectedIndex] && selectedOption.id == thing.id  ? thing.image_gold : thing.image)
                                    .resizable()
                                    .scaleEffect(isClicked[selectedIndex] && selectedOption.id == thing.id ? 1.1 : 1.0)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                
                                VStack {
                                    Text(thing.name)
                                        .font(.callout)
                                        .foregroundColor(
                                            isClicked[selectedIndex] && selectedOption.id == thing.id ? (thing.name == "Hot" ? .red : (thing.name == "Cold" ? .blue : Color("starbucks-rewardgold"))) : .black
                                        )
                                    
                                    HStack(spacing: 3) {
                                        Text(thing.price == nil ? "" : "+ \(String(thing.price ?? 0))")
                                            .font(.callout)
                                            .foregroundColor(isClicked[selectedIndex] && selectedOption.id == thing.id ? Color("starbucks-rewardgold") : .black)
                                        
                                        Image(systemName: thing.price == nil ? "" : "tengesign")
                                            .resizable()
                                            .frame(width: 10, height: 10)
                                            .foregroundColor(isClicked[selectedIndex] && selectedOption.id == thing.id ? Color("starbucks-rewardgold") : .black)
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
            .offset(CGSize(width: 0, height: 0))
            .frame(width: 250, height: calculateHeight())

            VStack(alignment: .leading) {
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width - 200, height: 1)
                    .offset(CGSize(width: -10, height: -20))
                    .padding(.leading, 110)
                    .padding(.top, 10)
                    .foregroundColor(Color("starbucks-rewardgold"))
                
                Text("Your chosen options")
                    .font(.callout.bold())
                    .padding(.bottom, 10)
                    .padding(.horizontal, 10)
                
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
                
                Text("Total Price: \(calculateTotalPrice()) KZT")
                    .font(.headline)
                    .foregroundColor(Color("starbucks-rewardgold"))
                    .padding(.top, 20)
                    
            }
            .scrollIndicatorsFlash(onAppear: true)
            .frame(maxWidth: .infinity + 100)
            .offset(CGSize(width: -90, height: 0))
            .padding(.top, 30)
            
        }
}

extension DrinkCustomizerOptionEnlarged {
    func calculateHeight() -> CGFloat {
        
        let numberOfRows = (options[selectedIndex].optionTypes.count + columns.count - 1) / columns.count
        let estimatedRowHeight: CGFloat = 100

        let totalHeight = CGFloat(numberOfRows) * estimatedRowHeight

        let additionalHeight: CGFloat = 100
        
        return totalHeight + additionalHeight
    }
    
    func calculateTotalPrice() -> Int {
        var total = 0
            
        for (_, optionType) in optionArray {
            if let price = optionType.price {
                total += price
            }
        }
            
        return optionArray[0]?.price ?? 0

    }
}



#Preview {
    DrinkCustomizerOptionEnlarged(selectedIndex: 0, options: optionscroll, optionArray: [:], isClicked: [])
}
