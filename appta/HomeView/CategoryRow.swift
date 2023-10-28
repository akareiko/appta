import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [CoffeeShop]

    var body: some View {
        
        RoundedRectangle(cornerRadius: 30)
            .frame(width: UIScreen.main.bounds.width, height: 150)
            .foregroundColor(.white)
            .offset(y: 10)
            .shadow(radius: 5)
            .overlay(content:{
                VStack(alignment: .leading) {
                    HStack(){
                        
                        Image(systemName: "bag")
                        
                        Text("Stores")
                            .font(.title3.bold())
                        
                        Spacer()
                        
                        Text("See All")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .underline()
                            .offset(CGSize(width: 0.0, height: 5.0))
                             
                    }
                    .padding(.horizontal, 30)
                    .offset(CGSize(width: 0.0, height: 30.0))
                    
                    Divider()
                        .padding(.horizontal, 155)
                        .offset(CGSize(width: -130.0, height: 32.0))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .bottom, spacing: -10) {
                                ForEach(items) { coffeeshop in
                                    NavigationLink(destination: CoffeeShopProfile().navigationBarBackButtonHidden(true)) {
                                        CategoryItem(coffeeshop: coffeeshop)
                                    }
                                }
                            }
                            .offset(CGSize(width: -20.0, height: 0.0))
                            .frame(height: 80)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 140)
                        .padding(.top, 35)
                        .padding(.horizontal, 10)
                    }
                })
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var coffeeshops = ModelData().coffeeshops

    static var previews: some View {
        CategoryRow(
            categoryName: coffeeshops[0].category.rawValue,
            items: Array(coffeeshops.prefix(12))
        )
    }
}
