//
//  TrainingMap.swift
//  appta
//
//  Created by Assylzhan Tati on 10/2/23.
//

import SwiftUI
import MapKit

struct TrainingMap: View {
    var body: some View {
        ZStack(){
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.2048, longitude: 55.2708), latitudinalMeters: 10000, longitudinalMeters: 10000)
            Map(coordinateRegion: .constant(region))
                .ignoresSafeArea()
            // MARK: Buiding Sheet UI
                .bottomSheet(presentationDetents: [.medium, .large, .height(70)], isPresented: .constant(true), sheetCornerRadius: 20) {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 15){
                            TextField("Search Maps", text:
                                    .constant(""))
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background{
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(.ultraThinMaterial)
                                    }
                            CFList()
                        }
                        .padding()
                        .padding(.top)
                    }
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
                            Image(systemName: "mappin")
                        }
                        .font(.caption)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
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
        .padding(.top, 15)
    }
    
    // MARK: Album Index
    func getIndex(album: Album)->Int{
        return albums.firstIndex{CFAlbum in
            CFAlbum.id == album.id
        } ?? 0
    }
}

#Preview {
    TrainingMap()
}
