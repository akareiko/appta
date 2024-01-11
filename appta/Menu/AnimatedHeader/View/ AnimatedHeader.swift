//
//   AnimatedHeader.swift
//  appta
//
//  Created by Assylzhan Tati on 12/30/23.
//

import SwiftUI

struct AnimatedHeader: View {
    @StateObject var homeData = HomeViewModel()
    @State var currentTab = ""
    @State var onTapCurrentTab: String = ""
    @Namespace var animation
    var body: some View {
        NavigationStack{
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
                                    .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0))
                                    .cornerRadius(2)
                                    .offset(y: (offset > 0 ? -offset : 0))
                            )
                        }
                        .frame(height: 250)
                        
                        Section(header: HeaderView(currentTab: $currentTab, onTapCurrentTab: $onTapCurrentTab)){
                            // Tabs With Content...
                            
                            ForEach(drinksmenu){tab in
                                VStack(alignment: .leading, spacing: 15){
                                    MenuCardView(tab: tab, currentTab: $currentTab)
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
            // Used it Environment object for accessing all sub objects....
            .environmentObject(homeData)
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            currentTab = drinksmenu.first?.id ?? ""
        }
    }
}

#Preview {
    AnimatedHeader()
}
