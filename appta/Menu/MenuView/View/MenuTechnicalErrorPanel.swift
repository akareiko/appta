//
//  MenuTechnicalErrorNotification.swift
//  appta
//
//  Created by Assylzhan Tati on 3/22/24.
//

import SwiftUI

struct MenuTechnicalErrorPanel: View {
    
    @Binding var closeTechnicalPanel: Bool
    
    var body: some View {
        Button {
            
        } label: {
            VStack{
                RoundedRectangle(cornerRadius: 20.0)
                    .frame(width: UIScreen.main.bounds.width - 20, height: 65)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .foregroundColor(.clear)
                    .padding(.horizontal, 10)
                    .overlay{
                        HStack(spacing: 15){
                            
                            VStack(alignment: .leading){
                                Text("Technical issues")
                                    .foregroundColor(.primary)
                                
                                Text("Unfortunately, the payment system is currently unavailabe")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.leading)
                            }
                            
                            Spacer()
                            
                            Button {
                                closeTechnicalPanel.toggle()
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.secondary)
                                    
                            }
                        }
                        .padding(.horizontal, 40)
                    }
            }
        }
    }
}

#Preview {
    MenuTechnicalErrorPanel(closeTechnicalPanel: .constant(false))
}
