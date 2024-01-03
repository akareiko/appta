//
//  HeaderView.swift
//  appta
//
//  Created by Assylzhan Tati on 12/30/23.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var homeData: HomeViewModel
    @Binding var currentTab: String
    @Binding var onTapCurrentTab: String
    @Namespace var animation
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
            HStack(spacing: 0){
                // Backbutton...
                if getSize() != 0 {
                    Button(action: {}, label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 20, weight: .bold))
                            .frame(width: getSize(), height: getSize())
                            .foregroundColor(.primary)
                    })
                }
                
                Text("Starbucks")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                if getSize() != 0 {
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 20, weight: .bold))
                            .frame(width: getSize(), height: getSize())
                            .foregroundColor(.primary)
                    })
                }
            }
            
            ZStack{
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text("Coffee Shop . Backery . Japanese")
                    
                    HStack(spacing: 8){
                        
                        Image(systemName: "clock")
                            .font(.caption)
                        
                        Text("30-40 Min")
                            .font(.caption)
                        
                        Text("4.3")
                            .font(.caption)
                        
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(Color("starbucks-rewardgold"))
                        
                        Text("$6.40 Fee")
                            .font(.caption)
                            .padding(.leading, 10)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .opacity(homeData.offset > 200 ? 1 - Double(homeData.offset - 200) / 50 : 1)
                // Custom ScrollView...
                ScrollViewReader{ reader in
                    ScrollView(.horizontal, showsIndicators: false){
                        
                        HStack(spacing: 30){

                            ForEach(tabsItems){tab in

                                VStack(){
                                    Text(tab.tab)
                                        .foregroundColor(currentTab
                                        .replacingOccurrences(of: " SCROLL", with: "") == tab.id ? .black : .gray)

                                    // For matched geometry effect...
                                    if currentTab.replacingOccurrences(of: " SCROLL", with: "") == tab.id{
                                        Capsule()
                                            .fill(.black)
                                            .matchedGeometryEffect(id: "TAB", in: animation)
                                            .frame(height: 3)
                                    } else {
                                        Capsule()
                                            .fill(.clear)
                                            .frame(height: 3)
                                            .padding(.horizontal, -10)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.easeInOut){
                                            onTapCurrentTab = tab.id
                                            reader.scrollTo(tab.id, anchor: .topLeading)
                                     }
                                }
                                
                            }
                        }
                    }
                    .padding(.horizontal, -30)
                    .padding(.leading, 10)
                    .onChange(of: currentTab) { oldValue, newValue in
                            withAnimation(.easeInOut) {
                        reader.scrollTo(newValue, anchor: .topLeading)
                        }
                    }
                    .padding(.horizontal, 30)
                    // Visible Only when Scrolls Up
                    .opacity(homeData.offset > 200 ? Double(homeData.offset - 200) / 50 : 0)
                }
            }
            .frame(height: 60)
            
            if homeData.offset > 250 {
                Divider()
            }
        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(Color.white)
    }
    
    // Getting size of button and doing animation..
    
    func getSize() -> CGFloat{
        if homeData.offset > 200 {
            let progress = (homeData.offset - 200) / 50
            if progress <= 1.0 {
                return progress * 40
            }
            else {
                return 40
            }
        }
        else {
            return 0
        }
    }
}

#Preview {
    AnimatedHeader()
}
