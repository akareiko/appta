//
//  ScrollableTabView.swift
//  ImageViewer
//
//  Created by Assylzhan Tati on 12/25/23.
//

import SwiftUI

struct CoffeeShopAddressView: View {
    @ObservedObject var globalVars: GlobalVars
    
    @State private var selectedTab: ScrollableAddressTab?
    @Environment(\.colorScheme) private var scheme
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    // Tab Progress
    @State private var tabProgress: CGFloat = 0
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 15){
                HStack(){
                    Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .font(.system(size: 20, weight: .bold))
                            .frame(width: 20, height: 20)
                            .foregroundColor(.primary)
                    })
                    .padding(.trailing, 15)
                    
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "map.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color("starbucks-rewardgold"))
                            
                            Text("Addresses")
                                .font(.title.bold())
                        }
                        
                        Text("See all shops destinations")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 15)
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 15)
                
                //Custom Tab Bar
                CustomTabBar()
                
                // Paging View using new IOS 17 APIs
                GeometryReader{
                    let size = $0.size
                    
                    ScrollView(.horizontal){
                        LazyHStack(spacing: 0){
                            SampleView()
                                .id(ScrollableAddressTab.list)
                                .containerRelativeFrame(.horizontal)
                            VStack{
                                SearchView()
                                    .id(ScrollableAddressTab.map)
                                    .containerRelativeFrame(.horizontal)
                            }
                            .frame(width: UIScreen.main.bounds.width, height: 600)
                            .padding(.trailing, 15)
                            .padding(.leading, 15)
                            .shadow(radius: 2)
                            .cornerRadius(20)
                        }
                        .scrollTargetLayout()
                        .offsetX { value in
                            // Converting Offset into Progress
                            let progress = -value / (size.width * CGFloat(ScrollableAddressTab.allCases.count - 1))
                            // Capping Progress BTW 0-1
                            tabProgress = max(min(progress, 1), 0)
                        }
                    }
                    .scrollPosition(id: $selectedTab)
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.paging)
                    .scrollClipDisabled()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray.opacity(0.1))
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("", displayMode: .inline)
        }
    }
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0){
            ForEach(ScrollableAddressTab.allCases, id: \.rawValue) {tab in
                HStack(spacing: 10){
                    Image(systemName: tab.systemImage)
                    
                    Text(tab.rawValue)
                        .font(.callout)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .contentShape(.capsule)
                .onTapGesture {
                    // Updating Tab
                    withAnimation(.snappy){
                        selectedTab = tab
                    }
                }
            }
        }
        .tabMask(tabProgress)
        // Scrollable Active Tab Indicator
        .background{
            GeometryReader {
                let size = $0.size
                let capsuleWidth = size.width / CGFloat(ScrollableAddressTab.allCases.count)
                
                Capsule()
                    .fill(scheme == .dark ? .black : .white)
                    .frame(width: capsuleWidth)
                    .offset(x: tabProgress * (size.width - capsuleWidth))

            }
        }
        .background(.gray.opacity(0.1), in: .capsule)
        .padding(.horizontal, 15)
    }
    
    // Sample View For Demostrating Scrollable Ta Bar Indicator
    
    @ViewBuilder
    func SampleView() -> some View {
        ScrollView(.vertical) {
            ForEach(addressmodel) {address in
                VStack{
                    Button {
                        
                    } label: {
                        NavigationLink(destination: AnimatedHeader(globalVars: globalVars).ignoresSafeArea()){
                            HStack(spacing: 12){
                                Image(address.logo)
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 50, height: 50)
                                
                                VStack(alignment: .leading, spacing: 5){
                                    Text(address.title)
                                        .font(.callout.bold())
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text(address.address)
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.leading)
                                }
                                
                                Spacer(minLength: 0)
                                
                            }
                            .foregroundStyle(.white.opacity(0.4))
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .background(.thinMaterial)
                            .cornerRadius(15)
                        }
                    }
                }
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
        .scrollClipDisabled()
        .mask {
            Rectangle()
                .padding(.bottom, -100)
        }
    }
}
