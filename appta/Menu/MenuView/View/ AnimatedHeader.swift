//
//  AnimatedHeader.swift
//  appta
//
//  Created by Assylzhan Tati on 12/30/23.
//

import SwiftUI

@MainActor
final class TabMenuModel: ObservableObject {
    
    let coffeeshopId = "mqkKxYkBMX30XJaXgkWn"
    let addressId = "srKh0QPkKzKK0VSr94rA"

    @Published private(set) var tabs: [TabMenu] = []
    @Published private(set) var options: [Option] = []
    @Published private(set) var optionUltimates: [Option : [OptionType]] = [:]
    @Published var defaultArray: [Option : OptionType] = [:]
    
    func getAllTabs(coffeeShopId: String, addressId: String) async throws {
        self.tabs = try await MenuManager.shared.getAllTabs(coffeeshop_id: coffeeshopId, addressId: addressId)
    }
    
    func getAllDefaultOptions(coffeeshop_id: String) async throws {
        self.options = try await MenuManager.shared.getAllOptions(coffeeshop_id: coffeeshopId)
    }
    
    func getAllDefaultOptiontypes(coffeeshop_id: String, optionId: String) async throws -> [OptionType] {
        return try await MenuManager.shared.getAllOptiontypes(coffeeshop_id: coffeeshopId, optionId: optionId)
        }
    
    func zip(coffeeshop_id: String) async throws {
        for option in options {
            do {
                let optionTypes = try await getAllDefaultOptiontypes(coffeeshop_id: coffeeshop_id, optionId: option.id)
                self.optionUltimates[option] = optionTypes
            } catch {
                print("Error fetching option types: \(error)")
            }
        }
    }
    
    func fillOptionArray() async throws {
        for (key, value) in optionUltimates {
            for optiontype in value {
                if optiontype.price == 0{
                    self.defaultArray[key] = optiontype
                    
                }
            }
        }
    }
}

struct AnimatedHeader: View {
    @StateObject var viewModelTab = TabMenuModel()
    @StateObject var homeData = HomeViewModel()
    @StateObject var coffee = SelectedCoffee(selectedCoffee: DrinksModel(id: "", image: "Caramel-Brule-Latte", title: "Caramel Brule Latte", description: "The Caramel-Brulé Latte is a luxurious coffee drink blending rich espresso with creamy milk, topped with a layer of frothy foam and a drizzle of caramel sauce, torched to create a caramelized topping reminiscent of crème brûlée. It's a perfect blend of bitter espresso and sweet, crunchy caramel, ideal for those who enjoy a sophisticated, dessert-like coffee experience.", prices: [1200, 1400, 1600], drinksize: [300, 400, 500], status: true), selectedSize: 0)
    
    @ObservedObject var globalVars: GlobalVars
    @ObservedObject var viewModelCoffeeshop: CoffeeshopViewModel

    @State var customizedDrink: [OrderModel] = []
    @State var cardToggles: [String : Bool] = [:]
    @State var closeTechnicalPanel: Bool = false
    @State var chosenAddress: AddressModel
    @State var currentTab = ""
    @State var onTapCurrentTab: String = ""
    @State var scrollViewOffset: CGFloat = 0
    // Getting Start Offset and eliminating from current offset so that we will get exact offset...
    @State var startOffset: CGFloat = 0
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode

    @Namespace var animation
    
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollViewReader{ proxyReader in
                    ScrollView{
                        ScrollViewReader{proxy in
                            // Since We're Pinning Header View...
                            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                                
                                VStack(alignment: .leading){
                                    HStack(){
                                        
                                        Button {
                                            presentationMode.wrappedValue.dismiss()
                                        } label: {
                                            Image(systemName: "chevron.left")
                                                .resizable()
                                                .frame(width: 12, height: 18)
                                                .foregroundColor(.primary)
                                                .fontWeight(.bold)
                                        }
                                        .padding(.leading, 15)
                                        
                                        Spacer(minLength: 0)
                                        
                                        NavigationLink {
                                            
                                        } label: {
                                            Text(chosenAddress.address_name)
                                                .font(.callout)
                                                .foregroundColor(.primary)
                                        }
                                        .padding(.leading, -15)
                                        
                                        Spacer()
                                    }
                                    
                                    MenuSearchBar()
                                }
                                .offset(CGSize(width: 0, height: 60))
                                .padding(.bottom, 30)
                                .id("SCROLL_TO_TOP")
                                .overlay(
                                    
                                    //Using Geometry Reader to get SCrollView Offset
                                    GeometryReader{proxy -> Color in
                                        
                                        DispatchQueue.main.async{
                                            if startOffset == 0{
                                                self.startOffset = proxy.frame(in: .global).minY
                                            }
                                            
                                            let offset = proxy.frame(in: .global).minY
                                            self.scrollViewOffset = offset - startOffset
                                        }
                                        
                                        return Color.clear
                                    }
                                        .frame(width: 0, height: 0)
                                    
                                    , alignment: .top
                                )
                                
                                // Parallax Header...
                                
                                GeometryReader{ reader -> AnyView in
                                    
                                    let offset = reader.frame(in: .global).minY
                                    
                                    if -offset >= 0 {
                                        DispatchQueue.main.async {
                                            self.homeData.offset = -offset
                                        }
                                    }
                                    return AnyView(
                                        ZStack{
//                                            VStack(){
//                                                Image("starbucks")
//                                                    .resizable()
//                                                    .aspectRatio(contentMode: .fill)
//                                                    .frame(width: UIScreen.main.bounds.width - 100, height: 200 + (offset > 0 ? offset : 0))
//                                                //                                                .cornerRadius(2)
//                                                    .clipShape(RoundedRectangle(cornerRadius: 25))
//                                                    .offset(y: (offset > 0 ? -offset : 0))
//                                                    .offset(CGSize(width: -20, height: -20))
//                                                    .padding(50)
//                                            }
//                                            
//                                            Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
//                                                Image(systemName: "arrow.left")
//                                                    .font(.system(size: 20, weight: .bold))
//                                                    .frame(width: 30, height: 30)
//                                                    .foregroundColor(.primary)
//                                            })
//                                            .padding(.horizontal, 20)
//                                            .offset(CGSize(width: -170, height: -80))
                                            
                                        }
                                    )
                                }
                                .frame(height: 300)
                                
                                if !closeTechnicalPanel{
                                    MenuTechnicalErrorPanel(closeTechnicalPanel: $closeTechnicalPanel)
                                }
                                
                                MenuGetSubscriptionView()
                                
                                MenuOfferPanelScroll()
                                
                                Section(header: HeaderView(viewModelTab: viewModelTab, currentTab: $currentTab, onTapCurrentTab: $onTapCurrentTab)){
                                    
                                    ForEach(viewModelTab.tabs, id: \.self){tab in
                                        VStack(alignment: .leading, spacing: 15){
                                            MenuCardView(
                                                tab: tab,
                                                coffee: coffee,
                                                globalVars: globalVars,
                                                viewModelTab: viewModelTab,
                                                viewModelCoffeeshop: viewModelCoffeeshop,
                                                currentTab: $currentTab,
                                                customizedDrink: $customizedDrink,
                                                cardToggles: $cardToggles,
                                                chosenAddress: $chosenAddress
                                            )
                                        }
                                        .onChange(of: onTapCurrentTab) {oldValue, newValue in
                                            withAnimation(.easeInOut){
                                                proxy.scrollTo(onTapCurrentTab, anchor: .topLeading)
                                            }
                                        }
                                    }
                                    .padding([.horizontal, .bottom])
                                }
                            })
                        }
                    }
                    .coordinateSpace(name: "SCROLL")
                    .overlay(
                        Color.white
                            .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                            .ignoresSafeArea(.all, edges: .top)
                            .opacity(homeData.offset > 560 ? 1 : 0)
                        ,alignment: .top
                    )
                    .environmentObject(homeData)
                    .overlay(
                        Button{
                            withAnimation(.spring()){
                                proxyReader.scrollTo("SCROLL_TO_TOP", anchor: .top)
                            }
                        } label: {
                            Image(systemName: "arrow.up")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white.opacity(0.8))
                                .padding()
                                .background(Color("starbucks-rewardgold").opacity(0.7))
                                .clipShape(Circle())
                            // shadow...
                                .shadow(color: Color.black.opacity(0.09), radius: 5, x: 5, y: 5)
                        }
                            .padding(.leading)
                            .padding(.bottom, cardToggles.values.contains(true) ? 120 : 30)
                            .opacity(-scrollViewOffset > 450 ? 1 : 0)
                            .animation(.easeInOut, value: scrollViewOffset)
                            .animation(.spring, value: cardToggles)
                        
                        // fixing at the bottom left...
                        ,alignment: .bottomLeading
                    )
                }
                
                CustomPopUpSheet(coffee: coffee, globalVars: globalVars, viewModelTab: viewModelTab, viewModelCoffeeshop: viewModelCoffeeshop, customizedDrink: $customizedDrink, chosenAddress: $chosenAddress)
                    .offset(y: cardToggles.values.contains(true) ? UIScreen.main.bounds.width/1.1 : UIScreen.main.bounds.width * 1.5)
                    .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 15, initialVelocity: 0), value: cardToggles)
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            currentTab = "Oki0sTebfFRDiQAoTuO5"
            globalVars.nestr.toggle()
        }
        .onDisappear{
            globalVars.nestr.toggle()
        }
        .task{
            try? await viewModelTab.getAllTabs(coffeeShopId: "mqkKxYkBMX30XJaXgkWn", addressId: chosenAddress.id)
            try? await viewModelTab.getAllDefaultOptions(coffeeshop_id: "mqkKxYkBMX30XJaXgkWn")
            try? await viewModelTab.zip(coffeeshop_id: "mqkKxYkBMX30XJaXgkWn")
            try? await viewModelTab.fillOptionArray()
        }
    }
}
