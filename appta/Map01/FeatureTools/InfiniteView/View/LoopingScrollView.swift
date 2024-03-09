//
//  LoopingScrollView.swift
//  appta
//
//  Created by Assylzhan Tati on 11/30/23.
//

import SwiftUI

// Custom View
struct LoopingScrollView<Content: View, InfiniteViewModel: RandomAccessCollection>: View where InfiniteViewModel.Element : Identifiable {
    // Customization Properties
    @Binding var coffeeShopCardOffset: CGFloat
    var width: CGFloat
    var spacing: CGFloat = 0
    var items: InfiniteViewModel
    
    @ViewBuilder var content: (InfiniteViewModel.Element) -> Content
    var body: some View {
        GeometryReader {
            let size = $0.size
            // Safety Check
            let repeatingCount = width > 0 ? Int((size.width / width).rounded()) + 1 : 1
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(alignment: .center, spacing: spacing){
                    
                    ForEach(items){ item in
                        content(item)
                            .frame(width: width, alignment: .center)
                            
                    }
                    
                    ForEach(0..<repeatingCount, id: \.self){index in
                        let item = Array(items)[index % items.count]
                        content(item)
                            .frame(width: width)
                            .frame(width: width, alignment: .center)
                    }
                }
                .padding(.horizontal, 10)
                .background {
                    ScrollViewHelper(
                        width: width,
                        spacing: spacing,
                        itemsCount: items.count,
                        repeatingCount: repeatingCount,
                        coffeeShopCardOffset: $coffeeShopCardOffset
                    )
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

fileprivate struct ScrollViewHelper: UIViewRepresentable {
    var width: CGFloat
    var spacing: CGFloat
    var itemsCount: Int
    var repeatingCount: Int
    @Binding var coffeeShopCardOffset: CGFloat
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(
            coffeeShopCardOffset: $coffeeShopCardOffset, width: width,
            spacing: spacing,
            itemsCount: itemsCount,
            repeatingCount: repeatingCount)
    }
    
    func makeUIView(context: Context) -> UIView {
        return .init()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
            if let scrollView = uiView.superview?.superview?.superview as? UIScrollView, !context.coordinator.isAdded {
                scrollView.delegate = context.coordinator
                context.coordinator.isAdded = true
            }
        }
        
        context.coordinator.width = width
        context.coordinator.spacing = spacing
        context.coordinator.itemsCount = itemsCount
        context.coordinator.repeatingCount = repeatingCount
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        @Binding var coffeeShopCardOffset: CGFloat
        
        var width: CGFloat
        var spacing: CGFloat
        var itemsCount: Int
        var repeatingCount: Int
        
        
        init(coffeeShopCardOffset: Binding<CGFloat>, width: CGFloat, spacing: CGFloat, itemsCount: Int, repeatingCount: Int) {
            self._coffeeShopCardOffset = coffeeShopCardOffset
            self.width = width
            self.spacing = spacing
            self.itemsCount = itemsCount
            self.repeatingCount = repeatingCount
        }
        
        // Tells us whether the delegate is added or not
        var isAdded: Bool = false
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            guard itemsCount > 0 else { return }
            let minX = scrollView.contentOffset.x
            let mainContentSize = CGFloat(itemsCount) * width
            let spacingSize = CGFloat(itemsCount) * spacing
            
            if minX > (mainContentSize + spacingSize) {
                scrollView.contentOffset.x -= (mainContentSize + spacingSize)
            }
            
            if minX < 0 {
                scrollView.contentOffset.x += (mainContentSize + spacingSize)
            }
//            print(minX)
            
            _coffeeShopCardOffset.wrappedValue = minX
        }
    }
}

