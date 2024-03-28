//
//  PopUps.swift
//  appta
//
//  Created by Assylzhan Tati on 3/21/24.
//

import SwiftUI

struct PopUps: View {
    
    @State var nativeAlert = false
    @State var customAlert = false
    @State var HUD = false
    @State var password = ""
    
    var body: some View {
        ZStack{
            VStack(spacing: 25){
                Button {
                    alertView()
                } label: {
                    Text("Native Alert With TextFields")
                        .foregroundColor(.primary)
                }
                
                Text(password)
                    .fontWeight(.bold)
                
                Button {

                    withAnimation{
                        HUD.toggle()
                    }
                } label: {
                    Text("HUD Progress View")
                        .foregroundColor(.primary)
                }
                
                Button {

                    withAnimation{
                        customAlert.toggle()
                    }
                } label: {
                    Text("Custom AlertView")
                        .foregroundColor(.primary)
                }
                
            }
            
            if HUD{
                HUDProgressView(placeHolder: "Please Wait", show: $HUD)
            }
            
            if customAlert{
                CustomAlertView(show: $customAlert)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func alertView(){
        let alert = UIAlertController(title: "Login", message: "Enter Your Password", preferredStyle: .alert)
        
        alert.addTextField{ (pass) in
            pass.isSecureTextEntry = true
            pass.placeholder = "Password"
        }
        
        // Action Buttons...
        
        let login = UIAlertAction(title: "Login", style: .default) { (_) in
            
            // do your Own Stuff
            
            // retreving password...
            password = alert.textFields![0].text!
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            
            // same...
        }
        
        // adding into alertView
        
        alert.addAction(cancel)
        
        alert.addAction(login)
        
        // presenting alertView...
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
            // do your own stuff ....
            
        })
    }
    
}

struct HUDProgressView: View {
    var placeHolder : String
    @Binding var show: Bool
    @State var animate = false
    
    var body: some View {
        VStack(spacing: 28){
            Circle()
                .stroke(AngularGradient(gradient: .init(colors: [Color.primary, Color.primary.opacity(0)]), center: .center))
                .frame(width: 80, height: 80)
            // animating...
                .rotationEffect(.init(degrees: animate ? 360 : 0))
            
            Text(placeHolder)
                .fontWeight(.bold)
        }
        .padding(.vertical, 25)
        .padding(.horizontal, 35)
        .background(BlurView())
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primary.opacity(0.35)
            .onTapGesture {
                withAnimation{
                    // closing view...
                    
                    show.toggle()
                }
            }
        )
        .onAppear{
            // starting animation
            
            withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)){
                animate.toggle()
            }
        }
    }
}

struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

struct CustomAlertView : View {
    
    @Binding var show : Bool
    
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
            VStack(spacing: 25){
                Image("trophy")
                
                Text("Congratulations")
                    .font(.title)
                    .foregroundColor(.pink)
                
                Text("You've Successfully Done the Work")
                
                Button {
                    
                } label: {
                    Text("Back to Home")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color.purple)
                        .clipShape(Capsule())
                }

            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background(BlurView())
            .cornerRadius(25)
            
            Button {
                withAnimation{
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.purple)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.primary.opacity(0.35)
        )
    }
}

#Preview {
    PopUps()
}
