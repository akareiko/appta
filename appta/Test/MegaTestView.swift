////
////  MegaTestView.swift
////  appta
////
////  Created by Legato on 25.01.2024.
////
//
//import SwiftUI
//
//struct MegaTestView: View {
//    @State private var showUnlock = false
//    @State private var didUnlock = false
//    
//    var body: some View {
//        ZStack {
//            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            
//            VStack {
//                Spacer()
//                
//                if showUnlock {
//                    SwipeButtonView()
//                        .onSwipeSuccess {
//                            self.didUnlock = true
//                        }
//                        .transition(AnyTransition.scale.animation(Animation.spring(response: 0.3, dampingFraction: 0.5)))
//                }
//            }
//            .padding(.bottom, 120)
//            
//            if didUnlock {
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//        .onAppear() {
//            self.showUnlock = true
//        }
//    }
//}
//
//#Preview {
//    MegaTestView()
//}
