//
//  MenuOfferPanel.swift
//  appta
//
//  Created by Assylzhan Tati on 3/21/24.
//

import SwiftUI

struct MenuOfferPanelScroll: View {
    
    @State var posters = ["starbucks-offerposter-1", "starbucks-offerposter-2", "starbucks-offerposter-3",
        "starbucks-offerposter-4"]
    @State var image: String = ""
    @State var toggleMenuOfferSheet: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                VStack(alignment: .leading){
                    Text("How ya doin'?")
                        .font(.title2.bold())
                        .foregroundColor(.primary)
                    
                    Text("The freshest brew of news just for you!")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.primary)
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(){
                    ForEach(posters, id: \.self){ thing in
                        Button {
                            toggleMenuOfferSheet.toggle()
                        } label: {
                            Image(thing)
                                .resizable()
                                .frame(width: 242, height: 150)
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .sheet(isPresented: $toggleMenuOfferSheet){
                            MenuOfferPanelSheet(image: thing)
                                .presentationDetents([.fraction(0.55), .large])
                                .presentationCornerRadius(30)
                                .presentationDragIndicator(.hidden)
                        }
                    }
                    .padding(.leading, 15)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 10)
        }
        .frame(height: 250)
    }
}

#Preview {
    MenuOfferPanelScroll()
}
