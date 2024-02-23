//
//  AnimatedHeader.swift
//  appta
//
//  Created by Assylzhan Tati on 12/30/23.
//

import SwiftUI

@MainActor
final class TabMenuModel: ObservableObject {
    
    let coffeeshop_id = "mqkKxYkBMX30XJaXgkWn"
    let address_id = "srKh0QPkKzKK0VSr94rA"
//    @Published private(set) var tabs: [TabMenuu] = []
    @Published private(set) var tabs: [TabMenu] = []
    
    func getAllTabs() async throws {
        self.tabs = try await MenuManager.shared.getAllTabs(coffeeshop_id: coffeeshop_id, addressId: address_id)
    }
}

struct AnimatedHeader: View {
    @StateObject var viewModel = TabMenuModel()
    
    @StateObject var homeData = HomeViewModel()
    @StateObject var coffee = SelectedCoffee(selectedCoffee: drinksmenu[0].drinklist.first!, selectedSize: sizes.first!)
    @ObservedObject var globalVars: GlobalVars

    @State var customizedDrink: [OrderModel] = []
    @State var cardToggles: [String : Bool] = [:]
    @State var currentTab = ""
    @State var onTapCurrentTab: String = ""
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode

    @Namespace var animation
    
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView{
                    ScrollViewReader{proxy in
                        // Since We're Pinning Header View...
                        LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                            
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
                                        Image("starbucks")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: UIScreen.main.bounds.width, height: 300 + (offset > 0 ? offset : 0))
                                            .cornerRadius(2)
                                            .offset(y: (offset > 0 ? -offset : 0))
                                        
                                            Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                                                Image(systemName: "arrow.left")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .frame(width: 30, height: 30)
                                                    .foregroundColor(.primary)
                                                    .offset(CGSize(width: -170, height: -80))
                                            })
                                            .padding(.horizontal, 20)
                                    }
                                )
                            }
                            .frame(height: 300)
                            
                            Section(header: HeaderView(currentTab: $currentTab, onTapCurrentTab: $onTapCurrentTab)){
                                
                                ForEach(viewModel.tabs){tab in
                                    VStack(alignment: .leading, spacing: 15){
                                        let _ = print(tab)
                                        MenuCardView(
                                            tab: tab,
                                            coffee: coffee,
                                            globalVars: globalVars,
                                            currentTab: $currentTab,
                                            customizedDrink: $customizedDrink,
                                            cardToggles: $cardToggles
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
                        .opacity(homeData.offset > 250 ? 1 : 0)
                    ,alignment: .top
                )
                .environmentObject(homeData)
                
                if cardToggles.values.contains(true) {
                    withAnimation(.easeIn(duration: 1.5)){
                        CustomPopUpSheet(coffee: coffee, globalVars: globalVars, customizedDrink: $customizedDrink)
                            .offset(CGSize(width: 0, height: 360))
//                            .transition(.move(edge: .bottom).animation(Animation.spring(response: 0.3, dampingFraction: 0.8).speed(0.3)))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            currentTab = drinksmenu.first?.id ?? ""
            globalVars.nestr.toggle()
            let _ = print(viewModel.tabs)
        }
        .onDisappear{
            globalVars.nestr.toggle()
        }
        .task{
            try? await viewModel.getAllTabs()
        }
    }
}
