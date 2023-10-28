/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a single category item.
*/

import SwiftUI

struct CategoryItem: View {
    var coffeeshop: CoffeeShop

    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 45, height: 45)
                .foregroundColor(.white)
                .shadow(radius: 2)
                
                .overlay(content:{
                    coffeeshop.image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .cornerRadius(16)
                })
            
            Text(coffeeshop.name)
                .frame(width: 90, height: 15)
                .foregroundColor(.primary)
                .font(.caption)
                
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(coffeeshop: ModelData().coffeeshops[0])
    }
}

struct ShadowMask: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRect(rect)
        path.addRect(CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
        return path
    }
}
