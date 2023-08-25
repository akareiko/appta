//
//  SubscriptionView.swift
//  appta
//
//  Created by Legato on 23.08.2023.
//

import SwiftUI

struct TextViewSub: View {
    var body: some View {
        Text("Assylzhan+")
            .font(.custom("Helvetica", size: 15))
            .bold()
            .padding(9)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(15)
            .padding(45)
    }
}

struct SubscriptionView: View {
    
    var titles = ["Manage Subscription", "Gift Subscription", "Sample row"]
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Subscriptions")
                .font(.title)
                .bold()
                .padding(.leading, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                Image("hehthree")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .cornerRadius(20)
                    .padding(20)
                    .frame(width: 400, height: 250)
                    .overlay(TextViewSub(), alignment: .topLeading)
            }
            
            List {
                Section() {
                    VStack(alignment: .leading, spacing: 0){
                        ForEach(titles, id: \.self) { title in
                            HStack{
                                Text(title)
                                Spacer()
                                Image(systemName: "arrow.right")
                            }
                            .padding(20)
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .circular).stroke(Color(uiColor: .tertiaryLabel), lineWidth: 1)
                    )
                    .foregroundColor(Color.black)
                }
            }
                .listStyle(InsetListStyle())
                .scrollDisabled(true)
            
        }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}
