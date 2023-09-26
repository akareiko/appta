//
//  ContentView.swift
//  SwiftUIAPICalls
//
//  Created by Assylzhan Tati on 9/10/23.
//

import SwiftUI

struct CoffeeShopProfile: View {
    @State private var selectedIndex: Int = 0
    @State private var coffeeShops: [CoffeeShopModel] = []
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @State private var isTextExpanded = false

    var body: some View {
        NavigationView {
            VStack (spacing: 10){
                if selectedIndex < coffeeShops.count {
                    Image("starbucks")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: UIScreen.main.bounds.width, height: 350)
                        .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.4)]),
                                    startPoint: .center,
                                    endPoint: .bottom
                                )
                            )
                    HStack{
                        VStack (alignment: .leading, spacing: 5){
                            Text(coffeeShops[selectedIndex].name)
                                .font(.title)
                                .fontWeight(.semibold)
                            
                            Text(coffeeShops[selectedIndex].name)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Text("5")
                            .font(.caption)
                            .padding(10)
                            .background(Color(.systemGray5))
                            .clipShape(Circle())
                            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 2, y: 2)
                        
                    }
                    .padding(.horizontal)
                    
                    HStack{
                        Text(coffeeShops[selectedIndex].address)
                            .font(.caption)
                            .frame(width: 200, height: 40, alignment: .leading)
                        
                        
                        Spacer()
                        
                        Text("2.4 km away")
                            .font(.caption)
                    }
                    .padding(.horizontal)
                    .padding(.top, -5)
                    
                    Divider()
                    
                    Button {
                        
                    } label: {
                        Text("Get Your \(coffeeShops[selectedIndex].name) Subscription Now! ")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width - 20, height: 40)
                            .background(Color(.systemBlue))
                            .cornerRadius(20)
                            .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5)
                    }
                    
                    VStack(alignment: .leading){
                        Text("About")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.bottom, 5)
                        
                        Text(coffeeShops[selectedIndex].text)
                            .font(.body)
                            .foregroundColor(.black)
                            .lineLimit(isTextExpanded ? nil : 3)
                        
                        Button(action: {
                            withAnimation {
                                isTextExpanded.toggle()
                            }
                        }) {
                            Text(isTextExpanded ? "Show less" : "Show more")
                                .font(.caption)
                                .foregroundColor(Color(.systemGray))
                            Image(systemName: isTextExpanded ? "chevron.down" : "chevron.up")
                                .foregroundColor(Color(.systemGray))
                                .imageScale(.small)
                                .padding(.leading, -5)
                        }
                        .padding(.top, 0.5)
                        
                        Text("Working Hours")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                        
                        Text(coffeeShops[selectedIndex].workingHours)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
            .onAppear {
                fetchData()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Circle()
                        .frame(width: 60)
                        .foregroundColor(.black)
                        .overlay(
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.white)
                        )
                    }
                }
            }
        }
    }
    

    func fetchData() {
        if let url = URL(string: "http://localhost:8080/apithing/apicoffeeshop.php") {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    if let decodedData = try? JSONDecoder().decode([CoffeeShopModel].self, from: data) {
                        DispatchQueue.main.async {
                            self.coffeeShops = decodedData
                        }
                    }
                }
            }.resume()
        }
    }
}

struct CoffeeShopModel: Codable {
    let coffeeshopId: String
    let name: String
    let address: String
    let text: String
    let workingHours: String
}

struct CoffeeShopProfile_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopProfile()
    }
}
