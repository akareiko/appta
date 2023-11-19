//
//  MilkshakesScroll.swift
//  SomeExtra
//
//  Created by Assylzhan Tati on 10/1/23.
//

import SwiftUI

struct CoffeesScroll: View {
    @State var currentIndex: Int = 0
    @Namespace var animation
    var body: some View {
        VStack(){
            GeometryReader{proxy in
                let size = proxy.size
                CarouselView(size: size)
            }
        }
        .padding(.top, -50)
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height - 500, alignment: .top)
//        .background(Color("starbucks-green"))
//        .background()
    }
    
    @ViewBuilder
    func CarouselView(size: CGSize) -> some View {
        VStack{
            // MARK: Screen Width / 3
            CustomCarousel(index: $currentIndex, items: coffees, spacing: 0, cardPadding: size.width / 3, id: \.id) {
                coffee, _ in
                
                VStack(spacing: 10){
                    Image(coffee.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                    Text(coffee.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
                    
                    Text(coffee.price)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 10)
                        .padding(.top, -10)
                }
            }
            
            Indicators()
        }
    }
    
    
    @ViewBuilder
    func Indicators()->some View{
        HStack(spacing: 2){
            ForEach(coffees.indices, id: \.self){index in
                Circle()
                    .fill(Color("starbucks-green"))
                    .frame(width: currentIndex == index ? 10 : 6, height: currentIndex == index ? 10 : 6)
                    .padding(.top, 2)
                    .background{
                        if currentIndex == index {
                            Circle()
                                .stroke(Color("starbucks-white"), lineWidth: 1)
                                .matchedGeometryEffect(id: "INDICATOR", in: animation)
                        }
                    }
            }
        }
        .animation(.easeInOut, value: currentIndex)
    }
}

#Preview {
    CoffeesScroll()
}
