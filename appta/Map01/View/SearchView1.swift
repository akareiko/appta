//
//  SearchView.swift
//  appta
//
//  Created by Assylzhan Tati on 10/2/23.
//

import SwiftUI
import MapKit

struct SearchView1: View {
    @StateObject var locationManager: LocationManager1 = .init()
    // MARK: Navigation Tag To Push View to MapView
    @State var navigationTag: String?
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.primary)
                }
                
                Text("Search Location")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 10){
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Find location here", text: $locationManager.searchText)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .strokeBorder(.gray)
            }
            .padding(.vertical, 10)
            
            if let places = locationManager.fetchedPlaces, !places.isEmpty{
                List{
                    ForEach(places, id: \.self){ place in
                        Button {
                            if let coordinate = place.location?.coordinate{
                                locationManager.pickedLocation = .init(latitude: coordinate.latitude, longitude: coordinate.longitude)
                                locationManager.mapView.region = .init(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                                locationManager.addDraggablePin(coordinate: coordinate)
                                locationManager.updatePlacemark(location: .init(latitude: coordinate.latitude, longitude: coordinate.longitude))
                            }
                            
                            // MARK: Navigating To MapView
                            navigationTag = "MAPVIEW"
                        } label: {
                            HStack(spacing: 15){
                                Image(systemName: "mappin.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(place.name ?? "")
                                        .font(.title3.bold())
                                        .foregroundColor(.primary)
                                    
                                    Text(place.locality ?? "")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    }
                                }
                        }
                    }
                }
                    .listStyle(.plain)
                } else {
                    // MARK: Live Location Button
                    Button {
                        // MARK: Setting Map Region
                        if let coordinate = locationManager.userLocation?.coordinate{
                            locationManager.mapView.region = .init(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                            locationManager.addDraggablePin(coordinate: coordinate)
                            locationManager.updatePlacemark(location: .init(latitude: coordinate.latitude, longitude: coordinate.longitude))
                            
                            // MARK: Navigating To MapView
                            navigationTag = "MAPVIEW"
                        }
                    } label: {
                        Label {
                            Text("Use Current Location")
                                .font(.callout)
                        } icon: {
                            Image(systemName: "location.north.circle.fill")
                        }
                        .foregroundColor(.blue)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
            .background{
                NavigationLink(tag: "MAPVIEW", selection: $navigationTag) {
                    MapViewSelection()
                        .environmentObject(locationManager)
                        .navigationBarHidden(true)
                } label: {}
                    .labelsHidden()
            }
    }
}

// MARK: MapView Live Selection
struct MapViewSelection: View {
    @EnvironmentObject var locationManager: LocationManager1
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            MapViewHelper()
                .environmentObject(locationManager)
                .ignoresSafeArea()
            
            Button{
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title2.bold())
                    .foregroundColor(.primary)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            // MARK: Displaying Data
            if let place = locationManager.pickedPlaceMark{
                VStack(spacing: 15){
                    Text("Confirm Location")
                        .font(.title2.bold())
                    
                    HStack(spacing: 15){
                        Image(systemName: "mappin.circle.fill")
                            .font(.title2)
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(place.name ?? "")
                                .font(.title3.bold())
                            
                            Text(place.locality ?? "")
                                .font(.caption)
                                .foregroundColor(.gray)
                            }
                        }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 10)
                    
                    Button{
                        
                    } label: {
                        Text("Confirm Location")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.blue)
                            }
                            .overlay(alignment: .trailing){
                                Image(systemName: "arrow.right")
                                    .font(.title3.bold())
                                    .padding(.trailing)
                            }
                            .foregroundColor(.white)
                    }
                }
                padding()
                    .background{
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.white)
                            .ignoresSafeArea()
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .onDisappear{
            locationManager.pickedLocation = nil
            locationManager.pickedPlaceMark = nil
            
            locationManager.mapView.removeAnnotations(locationManager.mapView.annotations)
        }
    }
}

// MARK: UIKit MapView
struct MapViewHelper: UIViewRepresentable{
    @EnvironmentObject var locationManager: LocationManager1
    func makeUIView(context: Context) -> MKMapView {
        return locationManager.mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}

#Preview{
    SearchView1()
}
