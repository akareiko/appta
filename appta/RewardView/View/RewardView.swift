//
//  ScrollableTabView.swift
//  ImageViewer
//
//  Created by Assylzhan Tati on 12/25/23.
//

import SwiftUI

struct ScrollableTabView: View {
    @State private var selectedTab: ScrollableTab?
    @Environment(\.colorScheme) private var scheme
    @Environment(\.presentationMode) var presentationMode
    // Tab Progress
    @State private var tabProgress: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 15){
            HStack{
                Button(action: {}, label: {
                    Image(systemName: "line.3.horizontal.decrease")
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "bell.badge")
                })
            }
            .font(.title2)
            .overlay{
                Text("Messages")
                    .font(.title3.bold())
            }
            .foregroundStyle(.primary)
            .padding(15)
            
            //Custom Tab Bar
            CustomTabBar()
            
            // Paging View using new IOS 17 APIs
            GeometryReader{
                let size = $0.size
                
                ScrollView(.horizontal){
                    LazyHStack(spacing: 0){
                        SampleView(.purple)
                            .id(ScrollableTab.rewards)
                            .containerRelativeFrame(.horizontal)
                        
                        SampleView(.red)
                            .id(ScrollableTab.acheived)
                            .containerRelativeFrame(.horizontal)
                        
                        
                        SampleView(.blue)
                            .id(ScrollableTab.bonuses)
                            .containerRelativeFrame(.horizontal)
                    }
                    .scrollTargetLayout()
                    .offsetX { value in
                        // Converting Offset into Progress
                        let progress = -value / (size.width * CGFloat(ScrollableTab.allCases.count - 1))
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
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.gray.opacity(0.1))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Circle()
                        .frame(width: 60)
                        .foregroundColor(.black)
                        .offset(CGSize(width: -10.0, height: 0.0))
                        .overlay(
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.white)
                                .offset(CGSize(width: -10.0, height: 0.0))
                        )
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("", displayMode: .inline)
    }
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0){
            ForEach(ScrollableTab.allCases, id: \.rawValue) {tab in
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
                let capsuleWidth = size.width / CGFloat(ScrollableTab.allCases.count)
                
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
    func SampleView(_ color: Color) -> some View {
        ScrollView(.vertical) {
            ForEach(rewardmodel) {element in
                RoundedRectangle(cornerRadius: 20)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color("starbucks-lightgold"), Color("starbucks-lightgold")]), startPoint: .leading, endPoint: .trailing), lineWidth: 1)
                    .frame(width: UIScreen.main.bounds.width - 50, height: 70)
    //                .foregroundColor(Color("starbucks-white"))
                    .foregroundColor(.white)
                    .shadow(radius: 3)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 10)
                    .overlay(content:{
                        HStack(spacing: 5){
                            Image(element.image)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .offset(x: 5, y: -5)
                            
                            Spacer()
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Text(element.title)
                                        .font(.subheadline.bold())
                                    
                                    Spacer()
                                    
                                    Text("\(element.currentScore) / \(element.totalScore)")
                                        .font(.subheadline.bold())
                                        .padding(.trailing, 30)
                                        .foregroundColor(.secondary)
                                }
                                
                                Text(element.text)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                ProgressBar(barTotal: Float(element.totalScore), barValue: Float(element.currentScore))
                                    .frame(width: 100)
                                    .offset(x: -63)
                            }
                            .offset(y: 10)
                            
                        }
                        .padding(.horizontal, 30)
                    })
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

#Preview {
    ContentView()
}
