//
//  MenuRoundedPanel05.swift
//  appta
//
//  Created by Assylzhan Tati on 11/12/23.
//
import SwiftUI

struct BottomClipper: Shape {
    let bottom: CGFloat

    func path(in rect: CGRect) -> Path {
        Rectangle().path(in: CGRect(x: 0, y: bottom - rect.size.height, width: rect.size.width, height: bottom))
    }
}

struct MenuRoundedPanel05: View {
    @State var shops: [MenuRoundedPanelModel05]
    @State private var isCoffeeShopProfileActive = false
    @Binding var str: Bool
    @Binding var nestr: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color("starbucks-rewardgold"))

                        Text("Coffee Shops")
                            .font(.title3.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.leading, 30)

                    Text("Your favorite coffee temples")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                }
                
                NavigationLink(destination: CoffeeShopList(coffeeshoplist: coffeeshoplist)){
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("starbucks-rewardgold"))
                            .padding(.trailing, 30)
                    }
            }
            .padding()
//            .background(.white)
//            .shadow(radius: 5)

            ScrollView(.vertical){
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    GeometryReader {
                        let size = $0.size
                        
                        LoopingScrollView(width: 280, spacing: 30, items: shops) { thing in
                            NavigationLink(destination: CoffeeShopAddressView(str: $str, nestr: $nestr).navigationBarBackButtonHidden(true)
                            ) {
                                
//                                Image(thing.image)
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: 280, height: 120)
//                                    .foregroundColor(.white)
//                                    .shadow(radius: 3)
//                                    .clipShape(BottomClipper(bottom: 95))
//                                    .clipShape(RoundedRectangle(cornerRadius: 15))
//                                    .overlay(content: {
//                                        ZStack{
//                                            UnevenRoundedRectangle(cornerRadii: .init( topLeading: 0, bottomLeading: 15, bottomTrailing: 15, topTrailing: 0), style: .continuous)
//                                                .fill(.ultraThinMaterial)
//                                                .frame(width: 280, height: 60)
//                                                .foregroundStyle(.white)
//                                                .offset(y: 40)
//                                            Text(thing.title)
//                                                .frame(maxWidth: .infinity, alignment: .leading)
//                                                .padding(.leading, 20)
//                                                .font(.title2.bold())
//                                                .offset(CGSize(width: 0, height: 35))
//                                                .foregroundColor(.primary)
//                                        }
//                                    })
                                
//                                Image(thing.image)
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: 280, height: 120)
//                                    .foregroundColor(.white)
//                                    .shadow(radius: 3)
//                                    .padding([.top, .bottom], 5)
//                                    .clipShape(RoundedRectangle(cornerRadius: 15))
//                                    .overlay(content: {
//                                        ZStack{
//                                            Text(thing.title)
//                                                .frame(maxWidth: .infinity, alignment: .leading)
//                                                .padding(.leading, 20)
//                                                .font(.title2.bold())
//                                                .offset(CGSize(width: 0, height: 45))
//                                                .foregroundColor(.primary)
//                                        }
//                                    })
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.white)
                                        .frame(width: 280, height: 120)
                                    
                                    Image(thing.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 260, height: 100)
                                        .foregroundColor(.white)
                                        .shadow(radius: 3)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .overlay(content: {
                                            ZStack{
                                                Text(thing.title)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .padding(.leading, 20)
                                                    .font(.title2.bold())
                                                    .offset(CGSize(width: 0, height: 25))
                                                    .foregroundColor(.white)
                                            }
                                        })
                                }
                                
                                
//                                ZStack{
//                                    RoundedRectangle(cornerRadius: 20)
//                                        .fill(.ultraThinMaterial)
//                                        .frame(width: 280, height: 120)
//                                    
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .fill(.ultraThinMaterial)
//                                        .frame(width: 270, height: 110)
//                                    
//                                    Image(thing.image)
//                                        .resizable()
//                                        .scaledToFill()
//                                        .frame(width: 90, height: 90)
//                                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//                                        .offset(x: 15)
//                                    
//                                    Text(thing.title)
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//                                        .offset(x: 120, y: -10)
//                                        .font(.title3.bold())
//                                        .foregroundColor(.white)
//                                    
//                                    Text("Talan Towers")
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//                                        .offset(x: 120, y: 10)
//                                        .font(.subheadline)
//                                        .foregroundColor(.white)
//                                    
//                                    Image(systemName: "location.fill")
//                                        .offset(x: 115, y: -35)
//                                        .foregroundColor(.white)
//                                }
                                
                                
//                                Image(thing.image)
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: 280, height: 120)
//                                    .foregroundColor(.white)
//                                    .shadow(radius: 3)
//                                    .padding([.top, .bottom], 5)
//                                    .clipShape(RoundedRectangle(cornerRadius: 15))
//                                    .overlay(content: {
//                                        ZStack{
//                                            Text(thing.title)
//                                                .frame(maxWidth: .infinity, alignment: .leading)
//                                                .padding(.leading, 20)
//                                                .font(.title2.bold())
//                                                .offset(CGSize(width: 0, height: 45))
//                                                .foregroundColor(.primary)
//                                        }
//                                    })
                            }
                        }
                        .padding(.leading, 10)
                        //.contentMargins(.horizontal, 15, for: .scrollContent)
                    }
                    .frame(height: 140)

                }
//                .padding(.vertical, 15)
            }
            .scrollIndicators(.hidden)
        }
    }
}


// Use ContentView_Previews for the preview
//#Preview{
//    MenuRoundedPanel05(shops: MenuRPmodel05)
//}
