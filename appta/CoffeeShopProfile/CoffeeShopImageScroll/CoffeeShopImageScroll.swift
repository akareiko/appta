//import SwiftUI
//
//struct CoffeeShopImageScroll: View {
//    @State var currentIndex: Int = 0
//
//    @State var items: [String] = ["starbucks", "starbucks2", "starbucks3", "starbucks4"]
//
//    @State var showPagingControl: Bool = false
//    @State var disablePagingInteraction: Bool = false
//    @State var pagingSpacing: CGFloat = -140
//    @State var titleScrollSpeed: CGFloat = 0.8
//    @State var stretchContent: Bool = true
//
//    @State var pictures: [String] = ["starbucks", "starbucks2", "starbucks3", "starbucks4"]
//
//    var body: some View {
//        VStack {
//            ScrollViewReader { proxy in
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 0) {
//                        ForEach(pictures, id: \.self) { picture in
//                            Image(picture)
//                                .resizable()
//                                .frame(height: 450)
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: UIScreen.main.bounds.width, height: 450)
//                                .offset(y: -20)
//                        }
//                    }
//                    .onAppear {
//                        proxy.scrollTo(pictures[currentIndex], anchor: .top)
//                    }
//                }
//            }
//            
//            CustomPagingSlider(showPagingControl: showPagingControl, disablePagingInteraction: disablePagingInteraction, titleScrollSpeed: titleScrollSpeed, pagingControlSpacing: pagingSpacing, spacing: 0, data: $items) { item in
//                Image(item)
//                    .resizable()
//                    .frame(height: 450)
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: UIScreen.main.bounds.width, height: 450)
//                    .offset(y: -20)
//            } titleContent: { item in
//                
//            }
//        }
//        .animation(.easeInOut, value: currentIndex)
//    }
//}
//
//struct CoffeeShopImageScroll_Previews: PreviewProvider {
//    static var previews: some View {
//        CoffeeShopImageScroll()
//    }
//}
