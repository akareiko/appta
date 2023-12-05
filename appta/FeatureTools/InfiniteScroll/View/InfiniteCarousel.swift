//
//  InfiniteCarousel.swift
//  Features
//
//  Created by Assylzhan Tati on 11/6/23.
//

import SwiftUI

struct InfiniteCarousel: View {
    @State private var currentPage: String = ""
    @State private var listOfPages: [InfiniteCarouselModel] = []
    @State private var fakedPages: [InfiniteCarouselModel] = []
    var body: some View {
        GeometryReader{
            let size = $0.size
            
            TabView(selection: $currentPage, content: {
                ForEach(fakedPages){ thing in
                    GeometryReader(content: {geometry in
                        let size = geometry.size
                        
                        ScrollView(.horizontal) {
                            HStack{
                                ForEach(carousel){ card in
                                    // In order to Move the Card in Reverse Direction (Parallax Effect)
                                    GeometryReader(content: { proxy in
                                        let cardSize = proxy.size
    //                                    let minX = proxy.frame(in: .scrollView).minX
                                        let minX = min((proxy.frame(in: .scrollView).minX * 1), proxy.size.width * 1.2)
                                        
                                        Image(card.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .offset(x: -minX + 30, y: 20)
                                            .frame(width: cardSize.width - 30, height: cardSize.height)
                                            .clipShape(.rect(cornerRadius: 15))
                                            .shadow(color: .black.opacity(0.25), radius: 8, x: 5, y: 1)
                                            .tag(thing.id.uuidString)
                                            .offsetX(currentPage == thing.id.uuidString){rect in
                                                let minX = rect.minX
                                                let pageOffset = minX - (size.width * CGFloat(fakeIndex(thing)))
                                                // Converting Page Offset into Progress
                                                let pageProgress = pageOffset / size.width
                                                if -pageProgress < 1.0 {
                                                    // Moving to the Last Page
                                                    // Which is Actually the first Duplicated Page
                                                    // Safe Check
                                                    if fakedPages.indices.contains(fakedPages.count - 1) {
                                                        currentPage = fakedPages[fakedPages.count - 1].id.uuidString
                                                    }
                                                }
                                                
                                                if -pageProgress > CGFloat(fakedPages.count - 1) {
                                                    // Moving to the Last Page
                                                    // Which is Actually the first Duplicated Page
                                                    // Safe Check
                                                    if fakedPages.indices.contains(1) {
                                                        currentPage = fakedPages[1].id.uuidString
                                                    }
                                                }
                                            }
                                    })
                                    .frame(width: size.width - 60, height: size.height - 50)
                                    // Scroll Animation
                                    .scrollTransition(.interactive, axis: .horizontal){
                                        view, phase in
                                        view
                                            .scaleEffect(phase.isIdentity ? 1 : 0.85)
                                    }
                                }
                            }
                            .padding(.horizontal, 30)
                            .scrollTargetLayout()
                            .frame(height: size.height, alignment: .top)
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .scrollIndicators(.hidden)
                    })
                    .frame(height: 280)
                    .padding(.horizontal, -15)
                    .padding(.top, 10)
                    // Calculating Entire Page Scroll Offset
                }
                
            })
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay(alignment: .bottom) {
                PageControl(totalPages: listOfPages.count, currentPage: originalIndex(currentPage))
                    .offset(y: -35)
            }
        }
        .frame(height: 350)
        .onAppear{
            guard fakedPages.isEmpty else {return}
            for image in carousel {
                listOfPages.append(image)
            }
            fakedPages.append(contentsOf: listOfPages)
            
            if var firstPage = listOfPages.first, var lastPage = listOfPages.last {
                currentPage = firstPage.id.uuidString
                
                firstPage.id = .init()
                lastPage.id = .init()
                
                fakedPages.append(firstPage)
                fakedPages.insert(lastPage, at: 0)
            }
        }
    }
    
    func fakeIndex(_ of: InfiniteCarouselModel) -> Int {
        return fakedPages.firstIndex(of: of) ?? 0
    }
    
    func originalIndex(_ id: String) -> Int {
        return listOfPages.firstIndex { page in
            page.id.uuidString == id
        } ?? 0
    }
}

#Preview {
    InfiniteCarousel()
}
