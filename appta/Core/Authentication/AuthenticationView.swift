//
//  AuthenticationView.swift
//  appta
//
//  Created by Legato on 10.02.2024.
//

import SwiftUI

struct AuthenticationView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    do {
                        try await viewModel.signInAnonymous()
                        showSignInView = false
                    } catch {
                        print(error)
                    }
                }
            }) {
                Text("Перейти в приложение ")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 120, height: 55)
                    .background(.black)
                    .cornerRadius(25)
            }
            
            NavigationLink {
                SignInEmal(showSignInView: $showSignInView)
            } label: {
                
                Text("Sign In With Your Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 120, height: 55)
                    .background(.black)
                    .cornerRadius(25)
            }
        }
        .navigationTitle("Sign In")
    }
}
#Preview {
    NavigationStack {
        AuthenticationView(showSignInView: .constant(false))
    }
}
