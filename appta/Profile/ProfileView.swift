//
//  ProfileView.swift
//  appta
//
//  Created by Legato on 23.08.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Text("Profile View | Any Ideas?")
        Image(systemName: "person")
            .resizable()
            .frame(width: 20, height: 20)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
