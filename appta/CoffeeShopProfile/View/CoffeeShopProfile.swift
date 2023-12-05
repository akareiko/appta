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
                    ZStack {
                        Image("starbucks")
                            .resizable()
                            .frame(height: 350)
                            .clipped()
                        
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: 120)
                            .overlay(
                                ZStack {
                                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color("starbucks-neutral").opacity(2)]), startPoint: .center, endPoint: .bottom)
                                }
                            )
                            .foregroundColor(.clear)
                            .offset(CGSize(width: 0, height: 120))
                    }
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
                                
                                Text("Specials")
                                    .font(.title2.bold())
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
                                .padding(.horizontal, -20)
                                
                                
                                CoffeeScrollUpdated(coffees: coffees)
                                    .padding(.horizontal, -20)
                                    
                                
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
                .background(Color("starbucks-neutral"))
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
