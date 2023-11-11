//
//  NavigationBar.swift
//  appta
//
//  Created by Legato on 05.09.2023.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        ZStack() {
            Color.clear
                .background(.ultraThinMaterial)
//                .blur(radius: 10)
            
                Text("appta coffee")
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.black)
                    .offset(y: 25)
                    .padding(.bottom, 10)
        }
        .frame(height: 90)
        .frame(maxHeight: .infinity, alignment: .top)
        .edgesIgnoringSafeArea(.top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
