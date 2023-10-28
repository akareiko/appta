//
//  MapViewUpdated.swift
//  appta
//
//  Created by Assylzhan Tati on 10/2/23.
//

import SwiftUI
import MapKit

struct MapViewUpdated: View {
    @State var showAnotherSheet: Bool = false
    @State var searchText = ""
    private var listOfCoffee = albums
    var body: some View {
        ZStack{
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.2048, longitude: 55.2708), latitudinalMeters: 10000, longitudinalMeters: 10000)
            Map(coordinateRegion: .constant(region))
                .ignoresSafeArea()
                .overlay(alignment: .topTrailing, content: {
                    Button {
                        showAnotherSheet.toggle()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .font(.title2)
                    }
                    .padding()
                })
            // MARK: Building Sheet UI
            // Since We Always Need Bottom Sheet At Bottom Setting to True By Default
                .bottomSheet(presentationDetents: [.medium, .large, .height(70)], isPresented: .constant(true), sheetCornerRadius: 60, isTransparentBG: true) {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 15){
                                TextField("Search Maps", text: .constant(searchText))
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background{
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(.ultraThickMaterial)
                                    }
                                
                                // MARK: Songs List View
                                CFList()
                            }
                            .padding()
                            .padding(.bottom, 30)
                            .padding(.top)
                            .background(content: {
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .ignoresSafeArea()
                            })
                    }
                    
                    // MARK: In SwiftUI A ViewController Currently Present Only One Sheet
                    // So If We Try to Show Another Sheet It Will Not Show Up
                    // But There is a Work Around
                    // Simply Insert All Sheets And FullScreenCover Views to Bottom Sheet View
                    // Because its a New View Controller so It can able to Show Another Sheet
                    .sheet(isPresented: $showAnotherSheet){
                        Text("hi Settings")
                    }
                    .padding(.bottom, -40)
                } onDismiss: {}
        }
    }
    
    @ViewBuilder
    func CFList()->some View{
        VStack(spacing: 25){
            ForEach(albums){ album in
                HStack(spacing: 12){
                    Text("\(getIndex(album: album) + 1)")
                        .fontWeight(.semibold)
                    
                    Image(album.CFImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text(album.CFName)
                            .fontWeight(.semibold)
                        
                        Label {
                            Text("Таlan Towers, Dostyq St 16, Astana 010000")
                        } icon: {
                            Image(systemName: "location.fill")
                        }
                        .font(.caption)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity,  alignment: .leading)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: album.isLiked ? "suit.heart.fill" : "suit.heart")
                            .font(.title3)
                            .foregroundColor(album.isLiked ? .red : .primary)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .searchable(text: $searchText)
        .padding(.top)
    }
    
    // MARK: Album Index
    func getIndex(album: Album)->Int{
        return albums.firstIndex { CAlbum in
            CAlbum.id == album.id
        } ?? 0
    }
}

#Preview {
    MapViewUpdated()
}

