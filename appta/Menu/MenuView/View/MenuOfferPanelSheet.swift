//
//  MenuOfferPanelSheet.swift
//  appta
//
//  Created by Assylzhan Tati on 3/21/24.
//

import SwiftUI

struct MenuOfferPanelSheet: View {
    
    var image: String
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView(){
                ZStack{
                    Image(image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 220)
                    VStack{
                        HStack{
                            Spacer()
                            
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                            }
                            .frame(width: 30, height: 30)
                            .background(.thinMaterial)
                            .clipShape(Circle())
                            .padding(.horizontal, 20)
                        }
                        .padding(.top, 20)
                        
                        Spacer()
                    }
                    
                }
                
                VStack(alignment: .leading){
                    HStack(spacing: 5){
                        Text("•")
                            .font(.title.bold())
                            .foregroundColor(Color("starbucks-rewardgold"))
                        
                        Text("Half off a drink")
                            .font(.title2.bold())
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        Text("Yesterday")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    
                    Text("Keep the cheer going. enjoy half off a drink this Thursday from 12-6 PM")
                        .font(.callout)
                        .padding(.horizontal, 20)
                    
                }
                
                HStack(spacing: 23){
                    Button(action: {
//                        self.isClicked.toggle()
                    }) {
                        Text("Join now")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.init(top: 8, leading: 14, bottom: 8, trailing: 14))
                            .background(Color.black)
                            .cornerRadius(20)
                            .overlay(
                                Capsule()
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    
                    Button(action: {
//                        self.isClicked.toggle()
                    }) {
                        Text("Learn More")
                            .foregroundColor(Color.black)
                            .fontWeight(.bold)
                            .padding(.init(top: 8, leading: 14, bottom: 8, trailing: 14))
                            .background(Color.white)
                            .cornerRadius(20)
                            .overlay(
                                Capsule()
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    //MenuOfferPanelSheet(image: "starbucks-offerposter-1")
    MenuOfferPanelScroll()
}
