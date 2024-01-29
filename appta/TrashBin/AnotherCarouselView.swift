//
//  AnotherCarouselView.swift
//  appta
//
//  Created by Legato on 22.01.2024.
//

import SwiftUI

struct AnotherCarouselView: View {
    @State private var currentPage: String = ""
    @State private var listOfPages: [Page] = []
    @State private var fakedPages: [Page] = []
    @State private var searchText = ""
    @State private var isSearching = false
    
    var body: some View {
        SearchBar(searchText: $searchText, isSearching: $isSearching)
            .offset(y: -50)
            .onChange(of: searchText) { oldValue, newSearchText in
                // Find the corresponding Page with the matching color
                if let matchingPage = listOfPages.first(where: { $0.color.description.lowercased() == newSearchText.lowercased() }) {
                    currentPage = matchingPage.id.uuidString
                }
            }
        
        GeometryReader {
            let size = $0.size
            
            TabView(selection: $currentPage, content: {
                ForEach(fakedPages) {Page in
//                    let _ = print($currentPage)
                    
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Page.color.gradient)
                        .frame(width: 300, height: size.height)
                        .tag(Page.id.uuidString)
                        .offsetX(currentPage == Page.id.uuidString) {rect in
                            let minX = rect.minX
                            let pageOffset = minX - (size.width * CGFloat(fakeIndex(Page)))
                            
                            let pageProgress = pageOffset / size.width
                            
                            let _ = print(pageProgress)
                            
                            if -pageProgress < 1.0 {
                                if fakedPages.indices.contains(fakedPages.count - 1) {
                                    currentPage = fakedPages[fakedPages.count - 1].id.uuidString
                                }
                            }
                            
                            if -pageProgress > CGFloat(fakedPages.count - 1) {
                                if fakedPages.indices.contains(1) {
                                    currentPage = fakedPages[1].id.uuidString
                                }
                            }
                        }
                }
            })
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay(alignment: .bottom) {
                PageControl(totalPages: listOfPages.count, currentPage: originalIndex(currentPage))
                    .offset(y: -15)
            }
        }
        .frame(height: 400)
        .onAppear{
            guard fakedPages.isEmpty else {return}
            
            for color in [Color.red, Color.blue, Color.yellow, Color.black, Color.brown] {
                listOfPages.append(.init(color: color))
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
    
    func fakeIndex(_ of: Page) -> Int {
        return fakedPages.firstIndex(of: of) ?? 0
    }
    
    func originalIndex(_ id: String) -> Int {
        return listOfPages.firstIndex { page in
            page.id.uuidString == id
        } ?? 0
    }
}

#Preview {
    AnotherCarouselView()
}
