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
    @State var currentIndex: Int = 0
    @Namespace var animation
    @State var selectedCategory: Category = categories.first!

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(showsIndicators: false){
                    GeometryReader { geometry in
                        Image("starbucks5")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: geometry.frame(in: .global).minY +
                                280)
                            .ignoresSafeArea()
                            .offset(x: 0, y: -geometry.frame(in: .global).minY + 220)
                    }
                    VStack{
                        HStack{
                            VStack (alignment: .leading, spacing: 5){
                                //        Text(coffeeShops[selectedIndex].name)
                                RoundedRectangle(cornerRadius: 50)
                                            .frame(width: 50, height: 5)
                                            .foregroundColor(Color("silver"))
                                            .background(.thinMaterial)
                                            .offset(x: 155, y: -20)
                                Text("Starbucks")
                                    .font(.title)
                                    .fontWeight(.bold)
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
                        .padding(.top, 30)
                        
                        HStack{
                            //                            Text(coffeeShops[selectedIndex].address)
                            Text("Таlan Towers, Dostyq St 16")
                                .foregroundColor(.gray)
                                .font(.caption)
                                .frame(width: 200, height: 40, alignment: .leading)
                            
                            Spacer()
                            
                            Text("2.4 km away")
                                .font(.caption)
                        }
                        .padding(.horizontal)
                        .padding(.top, -20)
                        
                        VStack(alignment: .leading){
                            //                            Text(coffeeShops[selectedIndex].text)
                            Text("Starbucks, an iconic coffeehouse chain founded in 1971, offers a wide range of expertly crafted coffee beverages and delectable treats. With thousands of locations worldwide, it's a go-to destination for quality coffee, delightful pastries, and a welcoming atmosphere, fostering connections and enhancing daily routines.")
                                .font(.caption)
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
                                Image(systemName: isTextExpanded ? "chevron.up" : "chevron.down")
                                    .foregroundColor(Color(.systemGray))
                                    .imageScale(.small)
                                    .padding(.leading, -5)
                            }
                            .padding(.top, 0.5)
                            
                            
                            VStack(alignment: .leading){
                                
                                Text("Specials")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.top)
                                
                                ScrollView(.horizontal, showsIndicators: false, content: {
                                    
                                    HStack(spacing: 15){
                                        ForEach(categories){ category in
                                            HStack(spacing: 10){
                                                Text(category.title)
                                                    .font(.callout.bold())
                                                    .foregroundColor(selectedCategory.id == category.id ? .white : .black)
                                            }
                                            .padding(.vertical, 5)
                                            .padding(.horizontal)
                                            .background(selectedCategory.id == category.id ? Color("starbucks-rewardgold") : Color.gray.opacity(0.3))
                                            .clipShape(Capsule())
                                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                                            .onTapGesture{
                                                withAnimation(.spring()){
                                                    selectedCategory = category
                                                }
                                            }
                                        }
                                    }
                                    .padding(.bottom, 60)
                                })
                                
                                CoffeesScroll()
                                
                            }
                            .frame(height: 370)
                            .padding(.bottom, 45)
                            
//                            HStack {
//                                Button {
//                                    
//                                } label: {
//                                    Text("Get Your Starbucks Subscription Now! ")
//                                        .font(.callout.bold())
//                                        .foregroundColor(.white)
//                                        .padding()
//                                        .frame(width: UIScreen.main.bounds.width - 20, height: 30)
//                                        .background(Color(.blue))
//                                        .cornerRadius(20)
//                                        .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5)
//                                }
//                            }
                            
                            Text("Working Hours")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top, 5)
                                .padding(.bottom, 5)
                            
                            Text("Mon - Fri | 9am - 12pm,\nSat - Sun | 9am - 2am")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 50)
                        
                    }
                    //.offset(y: 200)
                    .padding(.bottom, 50)
                    .background(Color(red: 240 / 255, green: 240 / 255, blue: 240 / 255))
                    .clipShape(Rounded())
                    .padding(.top, 300)
                    
                        
                    }
//                .background(
//                    Image("starbucks")
//                )
//                .background(
//                    LinearGradient(gradient: Gradient(colors: [Color("starbucks-housegreen"), Color("starbucks-ceramic")]), startPoint: .top, endPoint: .bottom)
//                )
                        .ignoresSafeArea()

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
                        .padding(.leading, -20)
                        .overlay(
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.white)
                                .padding(.leading, -18)
                        )
                    }
                }
            }
        }
//    }

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

struct Rounded: Shape{
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 40, height: 40))
        return Path(path.cgPath)
    }
    
}

struct CoffeeShopModel: Codable {
    let coffeeshopId: String
    let name: String
    let address: String
    let text: String
    let workingHours: String
}

#Preview{
    CoffeeShopProfile()
}
