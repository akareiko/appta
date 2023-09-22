//
//  SubscriptionViewUpdated.swift
//  appta
//
//  Created by Assylzhan Tati on 9/22/23.
//

import SwiftUI

struct SubscriptionUpdatedView: View {
    @State private var items: [Item] = [
        .init(color: .red, title: "Starbucks", subTitle: "Crafting Premium Coffee Experiences Worldwide, One Cup at a Time."),
        .init(color: .blue, title: "Costa Coffee", subTitle: "Bringing Global Coffee Excellence to Your Daily Brew with Passion."),
        .init(color: .green, title: "Zebra Coffee", subTitle: "Innovative Coffee Blends, Elevating Your Daily Brew to New Heights."),
        .init(color: .yellow, title: "Coffee Day", subTitle: "Bringing Joy and Community Through Exceptional Daily Coffee Experiences.")
    ]
    var titles = ["Manage Subscription", "Gift Subscription", "Sample row"]
    // Customization Properties
    @State private var showPagingControl: Bool = false
    @State private var disablePagingInteraction: Bool = false
    @State private var pagingSpacing: CGFloat = 20
    @State private var titleScrollSpeed: CGFloat = 0.6
    @State private var stretchContent: Bool = false
    
    var body: some View {
        VStack{
            CustomPagingSlider(showPagingControl: showPagingControl, disablePagingInteraction: disablePagingInteraction, titleScrollSpeed: titleScrollSpeed, pagingControlSpacing: pagingSpacing,  data: $items)
            { $item in
                // Content View
                RoundedRectangle(cornerRadius: 15)
                    .fill(item.color.gradient)
                    .frame(width: stretchContent ? nil : 150, height: stretchContent ? 220 : 120)
            } titleContent: { $item in
                // Title View
                VStack(spacing: 5){
                    Text(item.title)
                        .font(.largeTitle.bold())
                    Text(item.subTitle)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .frame(height: 45)
                }
                .padding(.bottom, 35)
                
            }
            // Use safe Area Padding to avoid Clipping of ScrollView
            .safeAreaPadding([.horizontal, .top], 35)
            
            List {
                Toggle("Show Paging Control", isOn: $showPagingControl)
                
                Toggle("Disable Page Interaction", isOn: $disablePagingInteraction)
                
                Toggle("Stretch Content", isOn: $stretchContent)
                
                Section("Title Scroll Speed"){
                    Slider(value: $titleScrollSpeed)
                }
                
                Section("Paging Spacing"){
                    Slider(value: $pagingSpacing, in: 20...40)
                }
            }
            .clipShape(.rect(cornerRadius: 15))
            .padding(15)
        }
    }
}

struct SubscriptionViewUpdatedView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionUpdatedView()
    }
}
