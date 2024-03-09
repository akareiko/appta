//
//  OptionScroll.swift
//  appta
//
//  Created by Assylzhan Tati on 12/4/23.
//

import SwiftUI

@MainActor
final class DrinkCustomizerOptionScrollModel: ObservableObject {
    let coffeeshopId = "mqkKxYkBMX30XJaXgkWn"
    
    @Published var selectedOption: Option = Option(id: "", index: 0, title: "", image: "", imagegold: "")
    @Published var selectedEnlargedOption: OptionType = OptionType(id: "", name: "", image: "", imagegold: "", price: 0)
    
    @Published private(set) var options: [Option] = []
    @Published private(set) var optionUltimates: [Option : [OptionType]] = [:]
    
    func getAllOptions(coffeeshop_id: String) async throws {
        self.options = try await DrinkCustomizerManager.shared.getAllOptions(coffeeshop_id: coffeeshopId)
    }
    
    func getAllOptiontypes(coffeeshop_id: String, optionId: String) async throws -> [OptionType] {
        return try await DrinkCustomizerManager.shared.getAllOptiontypes(coffeeshop_id: coffeeshopId, optionId: optionId)
        }
    
    func zip(coffeeshop_id: String) async throws {
        for option in options {
            do {
                let optionTypes = try await getAllOptiontypes(coffeeshop_id: coffeeshop_id, optionId: option.id)
                self.optionUltimates[option] = optionTypes
            } catch {
                print("Error fetching option types: \(error)")
            }
        }
    }
}

struct DrinkCustomizerOptionScroll: View {
    @StateObject var viewModel = DrinkCustomizerOptionScrollModel()
    @State private var showEnlargedView = false
    
    @Binding var totalPrice: Int
    @Binding var optionArray: [Option : OptionType]
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
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
                                    viewModel.selectedOption = thing
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
            
            if showEnlargedView == false {
                Rectangle()
                    .frame(width: 220, height: 1)
                    .foregroundColor(Color("starbucks-rewardgold"))
                    .offset(CGSize(width: 100, height: 10))
            }
            
//            if showEnlargedView {
//                DrinkCustomizerOptionEnlarged(totalPrice: $totalPrice, optionArray: $optionArray)
//                    .offset(CGSize(width: 90, height: 0))
//                    .padding(.top, 30)
//                
//            }
        }
        .task{
            try? await viewModel.getAllOptions(coffeeshop_id: "mqkKxYkBMX30XJaXgkWn")
            try? await viewModel.zip(coffeeshop_id: "mqkKxYkBMX30XJaXgkWn")
            
        }
    }
}

#Preview {
    DrinkCustomizerOptionScroll(totalPrice: .constant(1200), optionArray: .constant([:]))
}

