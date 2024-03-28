//
//  MenuGetSubscriptionView.swift
//  appta
//
//  Created by Assylzhan Tati on 3/22/24.
//

import SwiftUI

struct MenuGetSubscriptionView: View {
    var body: some View {
        Button {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        } label: {
            VStack{
                RoundedRectangle(cornerRadius: 20.0)
                    .frame(width: UIScreen.main.bounds.width - 20, height: 65)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .foregroundColor(Color("starbucks-warningyellow").opacity(0.7))
                    .padding(.horizontal, 10)
                    .overlay{
                        HStack(spacing: 15){
                            Image(systemName: "square.3.layers.3d")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.primary)
                            
                            VStack(alignment: .leading){
                                Text("Get your bonuses")
                                    .foregroundColor(.primary)
                                
                                Text("Choose your subscription plan and collect bonuses")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.leading)
                            }
                            
                            Spacer()
                            
                            Button {
                                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                            } label: {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.primary)
                                    
                            }
                        }
                        .padding(.horizontal, 40)
                    }
            }
        }
    }
}

#Preview {
    MenuGetSubscriptionView()
}
