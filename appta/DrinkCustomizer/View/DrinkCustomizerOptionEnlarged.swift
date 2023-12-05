//
//  DrinkCustomizerOptionEnlarged.swift
//  appta
//
//  Created by Assylzhan Tati on 12/5/23.
//

//
//  DrinkCustomizerOptionEnlarged.swift
//  appta
//
//  Created by Assylzhan Tati on 12/5/23.
//

import SwiftUI

struct DrinkCustomizerOptionEnlarged: View {
    @State var selectedIndex: Int
    @State var options: [Option]
    @State private var selectedOption: OptionType
    
    init(selectedIndex: Int, options: [Option]) {
        self._selectedIndex = State(initialValue: selectedIndex)
        self.options = options
        self._selectedOption = State(initialValue: options.first?.optionTypes.first ?? OptionType(name: "", image: "", image_gold: "", price: nil))
    }
    
    let rows: [GridItem] = [
        GridItem(.flexible(), spacing: -10, alignment: nil),
        GridItem(.flexible(), spacing: -10, alignment: nil),
        GridItem(.flexible(), spacing: -10, alignment: nil),
    ]
    
    var body: some View {
        VStack {
            Text("\(options[selectedIndex].title)")
                .font(.title3.bold())
                .padding(.bottom, 20)
            
            LazyHGrid(rows: rows) {
                ForEach(options[selectedIndex].optionTypes, id: \.id) { thing in
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedOption = thing
                        }
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                                .shadow(radius: 2)
                                .overlay {
                                    if selectedOption.id == thing.id {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(
                                                thing.name == "Hot" ? Color("starbucks-errorred") :
                                                (thing.name == "Cold" ? Color("starbucks-lightblue") : Color("starbucks-rewardgold")),
                                                lineWidth: 1
                                            )
                                    }
                                }
                            
                            Image(selectedOption.id == thing.id ? thing.image_gold : thing.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                            
                            VStack {
                                Text(thing.name)
                                    .font(.callout)
                                    .foregroundColor(
                                        selectedOption.id == thing.id ? (thing.name == "Hot" ? .red : (thing.name == "Cold" ? .blue : Color("starbucks-rewardgold"))) : .black
                                    )


                                
                                HStack(spacing: 3) {
                                    Text(thing.price == nil ? "" :
                                         "+ \(String(thing.price ?? 0))")
                                        .font(.callout)
                                        .foregroundColor(selectedOption.id == thing.id ? Color("starbucks-rewardgold") : .black)
                                    
                                    Image(systemName: thing.price == nil ? "" : "tengesign")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(selectedOption.id == thing.id ? Color("starbucks-rewardgold") : .black)
                                }
                                .padding(.top, -10)
                            }
                            .frame(width: 120)
                            .padding(.top, 120)
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, -70)
                }
            }
        }
        .frame(height: 750)
    }
}

#Preview {
    DrinkCustomizerOptionEnlarged(selectedIndex: 0, options: optionscroll)
}
