//
//  ProfileView.swift
//  appta
//
//  Created by Legato on 23.08.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    Circle()
                        .foregroundColor(.clear)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 25)
                    
                    Text("Assylzhan T.")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .offset(x: -25)
                    
                    Image(systemName: "gear")
                        .frame(width: 70, height: 70)
                        .padding(.trailing, 25)
                        .font(.title2)
                }
                
                VStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 150)
//                    .foregroundColor(Color("starbucks-black"))
                    .foregroundColor(Color("starbucks-white"))
                    .overlay(){
                        RoundedRectangle(cornerRadius: 15)
//                            .stroke(LinearGradient(gradient: Gradient(colors: [Color("starbucks-ceramic"), Color("starbucks-lightgold")]), startPoint: .leading, endPoint: .trailing), lineWidth: 4)
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color("starbucks-lightgold"), Color("starbucks-black")]), startPoint: .leading, endPoint: .trailing), lineWidth: 4)
                            .frame(width: UIScreen.main.bounds.width - 44, height: 150)
//                        Text("hehehaha")
                        HStack {
                            Image(systemName: "camera.filters")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(maxHeight: .infinity, alignment: .top)
                                .font(.title)
                                .fontWeight(.bold)
//                                .foregroundColor(.white)
                                .foregroundColor(Color("starbucks-black"))
                                .padding()
                            
                            HStack {
                                Text("как накопить")
    //                                .foregroundColor(.white)
                                    .foregroundColor(Color("starbucks-black"))
                                    .fontWeight(.semibold)
                                    .offset(y: 10)
                                    .font(.caption)
                                
                                Image(systemName: "chevron.forward")
                                    .offset(y: 10)
                                    .font(.caption)
                            }
                                .padding()
                                .frame(maxHeight: .infinity, alignment: .top)
                        }
                        Text("1738 бонусов")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.bold)
//                            .foregroundColor(.white)
                            .foregroundColor(Color("starbucks-black"))
                            .padding()
                            .font(.title3)
                    }
                    
                }
                .padding(.top, 20)
                
//                HStack{
//                    Image("starbucks")
//                        .resizable()
//                        .frame(width: UIScreen.main.bounds.width / 2 - 25, height: 250)
////                        .aspectRatio(contentMode: .fit)
//                        .cornerRadius(22)
//                        .shadow(color: .black.opacity(0.4), radius: 11)
//                    Image("starbucks2")
//                        .resizable()
//                        .frame(width: UIScreen.main.bounds.width / 2 - 25, height: 250)
////                        .aspectRatio(contentMode: .fit)
//                        .cornerRadius(22)
//                        .shadow(color: .black.opacity(0.4), radius: 11)
//                }
//                .offset(y: 50)
//                
//                HStack{
//                    Image("starbucks3")
//                        .resizable()
//                        .frame(width: UIScreen.main.bounds.width / 2 - 25, height: 250)
////                        .aspectRatio(contentMode: .fit)
//                        .cornerRadius(22)
//                        .shadow(color: .black.opacity(0.4), radius: 11)
//                    Image("starbucks4")
//                        .resizable()
//                        .frame(width: UIScreen.main.bounds.width / 2 - 25, height: 250)
////                        .aspectRatio(contentMode: .fit)
//                        .cornerRadius(22)
//                        .shadow(color: .black.opacity(0.4), radius: 11)
//                }
//                .offset(y: 50)
                
                VStack{
                    List {
//                        Section(header: Text("Important tasks")) {
                        HStack{
                            Image(systemName: "creditcard")
                                .frame(width: 30, height: 30)
                            Text("Способы оплаты")
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                        .listRowBackground(Color("starbucks-white"))
                        .listRowSeparator(.hidden)
                        
                        HStack{
                            Image(systemName: "circle")
                                .frame(width: 30, height: 30)
                            Text("Такой то такой то")
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                        .listRowBackground(Color("starbucks-white"))
                        .listRowSeparator(.hidden)
                        
                        HStack{
                            Image(systemName: "poweroutlet.type.d")
                                .frame(width: 30, height: 30)
                            Text("Что то с чем то")
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                        .listRowBackground(Color("starbucks-white"))
                        .listRowSeparator(.hidden)
                        }
                    .frame(minHeight: 100 * 3)
                    .scrollContentBackground(.hidden)
                }
            }
        }
//        LockView(lockType: .both, lockPin: "0328", isEnabled: true){
//            Text("Profile View | Any Ideas?")
//            Image(systemName: "person")
//                .resizable()
//                .frame(width: 20, height: 20)
//        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
