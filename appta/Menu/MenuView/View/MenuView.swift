////
////  MenuView.swift
////  ImageViewer
////
////  Created by Assylzhan Tati on 12/15/23.
////
//
//import SwiftUI
//
//struct MenuView: View {
//    
//    @State var currentTab = ""
//    @State var onTapCurrentTab: String = ""
//    @Namespace var animation
//    @Environment(\.colorScheme) var scheme
//    
//    var body: some View {
//        VStack(spacing: 0){
//            VStack{
//                HStack(spacing: 15){
//                    Button {
//                        
//                    } label: {
//                        Image(systemName: "arrow.left")
//                            .font(.title2)
//                    }
//                    
//                    Text("Starbucks Menu - Talan \n Towers")
//                        .font(.title3)
//                        .fontWeight(.semibold)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                    
//                    Button {
//                        
//                    } label: {
//                        Image(systemName: "magnifyingglass")
//                            .font(.title2)
//                    }
//                }
//                .foregroundColor(.primary)
//                .padding(.horizontal)
//                
//                // Sroll View Reader
//                // to scroll tab automatically when user scrolls...
//                
//                ScrollViewReader{ proxy in
//                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 30){
//                            
//                            ForEach(tabsItems){tab in
//                                
//                                VStack(){
//                                    Text(tab.tab)
//                                        .foregroundColor(currentTab
//                                        .replacingOccurrences(of: " SCROLL", with: "") == tab.id ? .black : .gray)
//                                    
//                                    // For matched geometry effect...
//                                    if currentTab.replacingOccurrences(of: " SCROLL", with: "") == tab.id{
//                                        Capsule()
//                                            .fill(.black)
//                                            .matchedGeometryEffect(id: "TAB", in: animation)
//                                            .frame(height: 3)
//                                    } else {
//                                        Capsule()
//                                            .fill(.clear)
//                                            .frame(height: 3)
//                                            .padding(.horizontal, -10)
//                                    }
//                                }
//                                .onTapGesture {
//                                    withAnimation(.easeInOut){
//                                            onTapCurrentTab = tab.id
//                                            proxy.scrollTo(tab.id, anchor: .topLeading)
//                                     }
//                                }
//                            }
//                        }
//                        .onChange(of: currentTab) { oldValue, newValue in
//                                withAnimation(.easeInOut) {
//                            proxy.scrollTo(newValue, anchor: .topLeading)
//                            }
//                        }
//                        .padding(.horizontal, 30)
//                        
//                    }
//                    .padding(.leading, 10)
//                }
//                .padding(.top)
//            }
//            
//            .padding([.top])
//            // Divider...
//            .background(scheme == .dark ? Color.black : Color.white)
//            .overlay(
//                Divider()
//                    .padding(.horizontal, -15)
//                
//                ,alignment: .bottom
//            )
//            
//            NavigationStack(){
//                ScrollView(.vertical, showsIndicators: false){
//                    // Scroll view reader to scroll the content...
//                    ScrollViewReader{proxy in
//                        
//                        VStack(spacing: 15){
//                            ForEach(tabsItems){ tab in
//                                
//                                // Menu Card View...
//                                MenuCardView(tab: tab, currentTab: $currentTab)
//                                    .padding(.top)
//                            }
//                            .padding([.horizontal, .bottom])
//                        }
//                        .padding([.horizontal, .bottom])
//                        .onChange(of: onTapCurrentTab) {oldValue, newValue in
//                            withAnimation(.easeInOut){
//                                proxy.scrollTo(onTapCurrentTab, anchor: .topLeading)
//                            }
//                        }
//                    }
//                }
//                // Setting Coordinate Space name for offset..
//                .coordinateSpace(name: "SCROLL")
//            }
//        }
//            // Setting first tab...
//        .onAppear {
//            currentTab = tabsItems.first?.id ?? ""
//        }
//    }
//}
//
//
//#Preview {
//    MenuView()
//}
//
//
//struct MenuCardView: View {
//    var tab: TabMenu
//    @Binding var currentTab: String
//
//    
//    let columns: [GridItem] = [
//            GridItem(.flexible(), spacing: 70),
//            GridItem(.flexible(), spacing: 70)
//        ]
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20){
//            Text(tab.tab)
//                .font(.title.bold())
//        
//            LazyVGrid(columns: columns, spacing: 26) {
//                ForEach(tab.foods){food in
//                // Food View...
//                    VStack {
//                        Image(food.image)
//                            .resizable()
//                            .frame(width: 150, height: 150)
//                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
//                            .padding([.top, .bottom], 5)
//                        
//                        Text(food.title)
//                            .font(.headline)
//                            .safeAreaPadding(.horizontal, 20)
//                            .frame(height: 50)
//                        
//                        Button(action: {
//
//                        }) {
//                            Text("\(food.price)")
//                                .foregroundColor(Color.black)
//                                .fontWeight(.bold)
//                                .frame(width: 100)
//                                .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 28))
//                                .background(Color.white)
//                                .cornerRadius(20)
//                                .overlay(content:{
//                                    Capsule()
//                                        .stroke(Color.white, lineWidth: 1)
//                                    
//                                    Image(systemName: "tengesign")
//                                        .resizable()
//                                        .frame(width: 10, height: 10)
//                                        .foregroundColor(.black)
//                                        .offset(CGSize(width: 30, height: 1))
//                                    
//                                    Image(systemName: "chevron.right")          .resizable()    .frame(width: 7, height: 13)
//                                    .foregroundColor(.black)
//                                    .offset(CGSize(width: 60, height: 0))
//                                })
//                        }
//                        
//                    }
//                    .frame(width: 170, height: 280)
//                    .background(.thinMaterial)
//                    .cornerRadius(25)
//                    .shadow(radius: 4)
//                }
//            }
//            .padding()
//        }
//        .modifier(OffsetModifier(tab: tab, currentTab: $currentTab))
//        // setting ID for Scroll View Reader...
//        .id(tab.id)
//    }
//}
