//
//  RegistrationView.swift
//  appta
//
//  Created by Assylzhan Tati on 9/22/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    
    @State private var outerCircleScale: CGFloat = 1.35
    @State private var innerCircleScale: CGFloat = 1.7
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scaleEffect(outerCircleScale)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scaleEffect(innerCircleScale)
                    .foregroundColor(.white)
                Circle()
                    .scaleEffect(innerCircleScale)
                    .foregroundColor(.white)
                VStack {
                    Text("Appta")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 60)
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                        .autocapitalization(.none)
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                        .autocapitalization(.none)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                        .autocapitalization(.none)
                        
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                        .autocapitalization(.none)
                    Button("Sign Up") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                }
                .onAppear{
                    startAnimation()
                }
            }
            .navigationBarHidden(true)
        }
    }
    func startAnimation() {
            // Create a timer that continuously updates the circle scales
            let animationTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    self.outerCircleScale = 1.35 + CGFloat(sin(Date().timeIntervalSince1970)) * 0.1
                    self.innerCircleScale = 1.7 + CGFloat(cos(Date().timeIntervalSince1970)) * 0.15
                }
            }
            
            // Ensure the timer is fired on the main run loop
            RunLoop.main.add(animationTimer, forMode: .common)
        }
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "mario2021" {
            wrongUsername = 0
            if password.lowercased() == "abc123" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

