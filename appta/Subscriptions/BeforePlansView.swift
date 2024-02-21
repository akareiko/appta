import SwiftUI

struct BeforePlansView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    @State var coffeeShopCardOffset: CGFloat = 0
    @Binding var haha: Coffeeshop
    var coffeeshops: [Coffeeshop]
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchText, isSearching: $isSearching)
                .frame(width: UIScreen.main.bounds.width - 110)
                .frame(maxWidth: .infinity, alignment: .top)
            
            Spacer()
                .frame(height: 30)
            
            GeometryReader {
                let size = $0.size
                
                ScrollViewReader{ reader in
                    if coffeeshops.count != 0 {
                        LoopingScrollView(coffeeShopCardOffset: $coffeeShopCardOffset, width: size.width, spacing: 0, items: coffeeshops) { item in
                            
                            VStack{
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(.ultraThinMaterial)
                                        .frame(width: 300)
                                        .shadow(radius: 3)
                                        .scaleEffect(0.95)
                                    
                                    AsyncImage(url: URL(string: item.image_url)) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150)
                                            .clipShape(Circle())
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 150, height: 150)
                                    }
                                    
                                }
                            }
                            .onChange(of: coffeeShopCardOffset) {
                                let currentIndex = Int((coffeeShopCardOffset + size.width / 2) / size.width) % coffeeshops.count
                                _haha.wrappedValue = coffeeshops[currentIndex]
                            }
                        }
                        .onAppear() {
                            _haha.wrappedValue = coffeeshops[0]
                        }
                        .onChange(of: searchText) { _, newSearchText in
                            if let matchingPage = coffeeshops.first(where: { $0.name.description.lowercased() == newSearchText.lowercased() }) {
                                withAnimation(.easeIn){
                                    reader.scrollTo(matchingPage.id, anchor: .topLeading)
                                }
                            }
                        }
                        .scrollTargetBehavior(.paging)
                    }
                }
            }
            .frame(height: 220)
        }
    }
}

//#Preview {
//    BeforePlansView(haha: .constant(Coffeeshop(id: "default_id", name: "Default Coffeeshop", image_url: "default_image_url", description: "Default Description", color: "default_color", pattern: "default_pattern")))
//}

