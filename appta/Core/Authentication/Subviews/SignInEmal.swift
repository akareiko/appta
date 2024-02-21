//
//  SignInEmal.swift
//  appta
//
//  Created by Legato on 10.02.2024.
//

import SwiftUI


struct SignInEmal: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(15)
            
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(15)
            
            Button( action: {
                Task {
                    do {
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }
                    
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }
                }
                
            }) {
                Text("Sign In With Your Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 120, height: 55)
                    .background(.black)
                    .cornerRadius(25)
            }
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Sign In With Email")
    }
}

#Preview {
    NavigationStack {
        SignInEmal(showSignInView: .constant(false))
    }
}
