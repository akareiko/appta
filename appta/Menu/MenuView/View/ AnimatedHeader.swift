//
//  AnimatedHeader.swift
//  appta
//
//  Created by Assylzhan Tati on 12/30/23.
//

import SwiftUI

struct AnimatedHeader: View {
    @StateObject var homeData = HomeViewModel()
    @StateObject var coffee = SelectedCoffee(selectedCoffee: drinksmenu[0].drinkList.first!, selectedSize: sizes.first!)
    @ObservedObject var globalVar: GlobalModel

    @State var customizedDrink: [OrderModel] = []
    @State var cardToggles: [String : Bool] = [:]
    @State var currentTab = ""
    @State var onTapCurrentTab: String = ""

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
                                    Image("starbucks")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width, height: 300 + (offset > 0 ? offset : 0))
                                        .cornerRadius(2)
                                        .offset(y: (offset > 0 ? -offset : 0))
                                )
                            }
                            .frame(height: 300)
                            
                            Section(header: HeaderView(currentTab: $currentTab, onTapCurrentTab: $onTapCurrentTab)){
                                
                                ForEach(drinksmenu){tab in
                                    VStack(alignment: .leading, spacing: 15){
                                        MenuCardView(
                                            tab: tab,
                                            coffee: coffee,
                                            globalVar: globalVar,
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
                        CustomPopUpSheet(coffee: coffee, globalVar: globalVar, customizedDrink: $customizedDrink)
                            .offset(CGSize(width: 0, height: 360))
                            .transition(.move(edge: .bottom).animation(Animation.spring(response: 0.3, dampingFraction: 0.8).speed(0.3)))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            currentTab = drinksmenu.first?.id ?? ""
        }
    }
}
