//
//  ProfileViewAssylzhan.swift
//  appta
//
//  Created by Legato on 23.08.2023.
//

import SwiftUI

struct ProfileViewAssylzhan: View {
    @State var cardShape = CardShape(corners: [.topLeft, .bottomLeft])
    var subscriptionCards: [SubscriptionCardModel]
    var selectedIndex: Int
    
    var body: some View {
        NavigationView{
            VStack{
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .foregroundColor(.white)
                    .shadow(radius: 1)
                    .padding(.bottom, -30)
                    .overlay(content: {
                        HStack(){
                            Image("starbucks-logo")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .offset(CGSize(width: 0.0, height: 3.0))
                            
                            Spacer()
                            
                            Text("PROFILE")
                                .font(.custom("Helvetica", size: 15))
                                .offset(CGSize(width: -20.0, height: 4.0))
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                        }
                        .offset(CGSize(width: 0, height: 30.0))
                        .padding(.horizontal, 20)
                    })
                
                ScrollView(showsIndicators: false){
                    VStack{
                        ZStack(){
                            ScrollView(.horizontal){
                                Rectangle()
                                    .fill(Color(.white))
                                    .frame(width: 280, height: 200)
                                    .clipShape(CardShape(corners: [.topRight, .bottomRight, .topLeft, .bottomLeft]))
                                    .padding(.bottom, -10)
                                    .padding(.top, 10)
                                    .offset(CGSize(width: 0.0, height: 20))
                                    .overlay(){
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [Color("starbucks-ceramic"), Color("starbucks-lightgold")]), startPoint: .leading, endPoint: .trailing), lineWidth: 4)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [Color("starbucks-lightgold"), Color("starbucks-black")]), startPoint: .leading, endPoint: .trailing), lineWidth: 4)
                                            .offset(CGSize(width: 0.0, height: 30))
                                            
                                        
                                Text("1738 бонусов")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .offset(CGSize(width: 0.0, height: 70))
                                    .fontWeight(.bold)
                                    .font(.headline)
                                    .foregroundColor(Color("starbucks-black"))
                                    .padding()
                                    .font(.title3)
                                }
                                .padding(.leading, 55)
                                
                                Image(subscriptionCards[selectedIndex].image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:40, height: 40)
                                    .offset(x: 130, y: -165)
                            }
                            .background(Image("starbucks-background"))
                        }
                        .padding(.top, 20)
                        
//                        RoundedRectangle(cornerRadius: 30)
//                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                            .foregroundColor(.white)
//                            .offset(y: 10)
//                            .shadow(radius: 3)
//                            .overlay(content: {
//                                List{
//                                    ForEach(0..<3, id: \.self) { index in
//                                        Text("Current index: \(index)")
//                                        
//                                    }
//                                }
//                            })
                        
                    }
                }
                .padding(.top, 20)
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct Rounded01: Shape{
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 40, height: 40))
        return Path(path.cgPath)
    }
    
}

struct ProfileViewAssylzhan_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewAssylzhan(subscriptionCards: SubscriptionCards, selectedIndex: 0)
    }
}
