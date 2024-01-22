import SwiftUI

struct CoffeeShopProfile: View {
    @State private var selectedIndex: Int = 0
    @State var coffees: [Coffee]
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
                    Image("starbucks")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300) // Adjust the height to fit your design
                        .overlay(
                            // Gradient from white at the bottom to transparent at the top
                            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white.opacity(0)]), startPoint: .bottom, endPoint: .top)
                                .frame(height: 100) // Adjust this to control the gradient size
                            , alignment: .bottom
                        )
                        .clipped()
                    VStack{
                        HStack{
                            Text("Starbucks")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            HStack {
                                Text("2.4 KM")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .padding(10)
                                    .background(Color("starbucks-ceramic"))
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                            }
//                                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 2, y: 2)
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            Text("Таlan Towers, Dostyq St 16")
                                .foregroundColor(.gray)
                                .font(.caption)
                                .frame(width: 200, height: 40, alignment: .leading)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, -20)
                        
                        VStack(alignment: .leading){
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
                        }
                        .padding(.horizontal, 15)
                        
                        VStack(alignment: .leading){
                            
                            VStack(alignment: .leading){
                                HStack {
                                    VStack {
                                        HStack {
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .frame(width: 18, height: 18)
                                                .foregroundColor(Color("starbucks-rewardgold"))

                                            Text("Menu")
                                                .font(.title3.bold())
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }

                                        Text("Your favourites drinks and more")
                                            .font(.footnote)
                                            .foregroundStyle(.gray)
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                    }
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: AnimatedHeader(str: .constant(false), nestr: .constant(false))) {
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(Color("starbucks-rewardgold"))
                                                .padding(.trailing, 20)
                                        }
                                }
                                
                                ScrollView(.horizontal){
                                    Image("arabica-horizontal")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width - 20, height: 150)
                                        .foregroundColor(.white)
                                        .shadow(radius: 3)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                            }
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(Color("starbucks-rewardgold"))
                                    
                                    Text("\(selectedCategory.title)")
                                        .font(.title2.bold())
                                }
                                
                                ScrollView(.horizontal, showsIndicators: false, content: {
                                    HStack(spacing: 15){
                                        ForEach(categories){ category in
                                            HStack(spacing: 10){
                                                Text(category.title)
                                                    .foregroundColor(selectedCategory.id == category.id ? Color(.white) : Color("starbucks-rewardgold"))
                                                    .fontWeight(.bold)
                                                    .font(.callout)
                                                    .padding(.init(top: 6, leading: 12, bottom: 6, trailing: 12))
                                                    .cornerRadius(20)
                                                .overlay(
                                                    Capsule()
                                                        .stroke(Color("starbucks-rewardgold"), lineWidth: 2)
                                                )
                                            }
                                            .background(selectedCategory.id == category.id ? Color("starbucks-rewardgold").opacity(0.8) : Color(.white))
                                            .clipShape(Capsule())
                                            .shadow(color: Color.black.opacity(0.05), radius: 1, x: 1, y: 1)
                                            .onTapGesture{
                                                withAnimation(.spring()){
                                                    selectedCategory = category
                                                }
                                            }
                                            .padding(.leading, category.title == "Specials" ? 15 : 0)
                                            .padding(.trailing, category.title == "Desserts" ? 15 : 0)
                                        }
                                    }
                                    .padding(.bottom, 20)
                                    
                                })
                                .padding(.horizontal, -20)
                                
                                
//                                CoffeeScrollUpdated(coffees: coffees)
//                                    .padding(.horizontal, -20)
                                    
                                
                            }
                            .frame(height: 370)
                            .padding(.bottom, 45)
                            
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
                    .padding(.bottom, 50)
                }
                .background(.white)
                .ignoresSafeArea()
            }
        }
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
                        .offset(CGSize(width: -10.0, height: 0.0))
                        .overlay(
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.white)
                                .offset(CGSize(width: -10.0, height: 0.0))
                        )
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("", displayMode: .inline)
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

#Preview{
    CoffeeShopProfile(coffees: coffees)
}
