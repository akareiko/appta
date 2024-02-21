//
//  CustomPagingSlider.swift
//  appta
//
//  Created by Assylzhan Tati on 9/22/23.
//

import SwiftUI

struct Item: Identifiable {
    var id: String
    var color: String
    var title: String
    var subTitle: String
    var image: String
}

//Custom View
struct CustomPagingSlider<Content: View, TitleContent: View, BottomContent: View, Coffeeshops: RandomAccessCollection>: View where Coffeeshops: MutableCollection, Coffeeshops.Element: Identifiable {
    // Customization Properties
    var showsIndicator: ScrollIndicatorVisibility = .hidden
    var showPagingControl: Bool = true
    var disablePagingInteraction: Bool = false
    var titleScrollSpeed: CGFloat = 0.6
    var bottomScrollSpeed: CGFloat = 0.2
    var pagingControlSpacing: CGFloat = 20
    var spacing: CGFloat = 10
    
    var data: Coffeeshops
    @ViewBuilder var content: (Coffeeshops.Element) -> Content
    @ViewBuilder var titleContent: (Coffeeshops.Element) -> TitleContent
    @ViewBuilder var bottomContent: (Coffeeshops.Element) -> BottomContent
    
    // View Properties
    @State private var activeID: String?
    
    var body: some View {
        VStack(spacing: pagingControlSpacing){
            ScrollView(.horizontal) {
                HStack(spacing: spacing){
                    ForEach(data) { item in
                        VStack(spacing: 0){
                            titleContent(item)
                                .frame(maxWidth: .infinity)
                                .visualEffect { content, geometryProxy in
                                    content
                                        .offset(x: scrollOffset(geometryProxy))
                                }
                            
                            content(item)
                                .padding(.bottom, 20)
                            
                            if showPagingControl {
                                PagingControl(numberOfPages: data.count, activePage: activePage) { value in
                                    //Updating to current Page
                                    if let index = value as? Coffeeshops.Index, data.indices.contains(index) {
                                        if let id = data[index].id as? String {
                                            withAnimation(.snappy(duration: 0.35, extraBounce: 0)) {
                                                activeID = id
                                            }
                                        }
                                    }
                                }
                                .disabled(disablePagingInteraction)
                            }
                            
                            bottomContent(item)
                                .frame(maxWidth: .infinity)
                                .visualEffect { content, geometryProxy in
                                    content
                                        .offset(x: scrollOffsetBottom(geometryProxy))
                                }
                        }
                        .containerRelativeFrame(.horizontal)
                    }
                }
                // Adding Paging
                .scrollTargetLayout()
            }
            .scrollIndicators(showsIndicator)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $activeID)
            
            
        }
    }
    
    var activePage: Int {
        if let index = data.firstIndex(where: { $0.id as? String == activeID}) as? Int {
            return index
        }
        
        return 0
    }
    
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat{
        let minX = proxy.bounds(of: .scrollView)?.minX ?? 0
        
        return -minX * min(titleScrollSpeed, 1.0)
    }
    
    func scrollOffsetBottom(_ proxy: GeometryProxy) -> CGFloat{
        let minX = proxy.bounds(of: .scrollView)?.minX ?? 0
        
        return -minX * min(bottomScrollSpeed, 1.0)
    }
}

// Let's Add Pading Control
struct PagingControl: UIViewRepresentable {
    var numberOfPages: Int
    var activePage: Int
    var onPageChange: (Int) -> ()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(onPageChange: onPageChange)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let view = UIPageControl()
        view.currentPage = activePage
        view.numberOfPages = numberOfPages
        view.backgroundStyle = .prominent
        view.currentPageIndicatorTintColor = UIColor(Color.primary)
        view.pageIndicatorTintColor = UIColor.placeholderText
        view.addTarget(context.coordinator, action:  #selector(Coordinator.onPageUpdate(control:)), for: .valueChanged)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Updating outside event changes
        uiView.numberOfPages = numberOfPages
        uiView.currentPage = activePage
    }
    
    class Coordinator: NSObject {
        var onPageChange: (Int) -> ()
        init(onPageChange: @escaping (Int) -> Void) {
            self.onPageChange = onPageChange
        }
        
        @objc
        func onPageUpdate(control: UIPageControl){
            onPageChange(control.currentPage)
        }
    }
}

