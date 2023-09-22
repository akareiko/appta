//
//  SplashView.swift
//  appta
//
//  Created by Assylzhan Tati on 9/22/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var backgroundColor = Color.blue
    @State private var dropColor = Color.white
    @State private var text = ""
    @State private var textIndex = 0
    @State private var timer: Timer?

    let fullText = "Appta"

    var body: some View {
        if isActive {
            RegistrationView()
        } else {
            ZStack {
                backgroundColor // Background color
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Image(systemName: "drop.fill")
                            .font(.system(size: 80))
                            .foregroundColor(dropColor) // Water drop color
                        Text(text)
                            .font(Font.custom("Baskerville-Bold", size: 26))
                            .foregroundColor(.black.opacity(0.80))
                            .transition(.opacity)
                            .animation(Animation.easeInOut(duration: 0.3))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.linear(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                            self.backgroundColor = Color.white // Transition background color to white
                            self.dropColor = Color.blue // Transition water drop color to blue
                        }
                        
                        // Start animating the text
                        startAnimatingText()
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
    
    func startAnimatingText() {
        // Invalidate the timer if it's already running
        timer?.invalidate()
        
        // Create a timer to animate the text
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            if textIndex < fullText.count {
                let index = fullText.index(fullText.startIndex, offsetBy: textIndex)
                text += String(fullText[index])
                textIndex += 1
            } else {
                // Stop the timer when all letters are animated
                timer?.invalidate()
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
