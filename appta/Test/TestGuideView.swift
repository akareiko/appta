////
////  TestGuideView.swift
////  appta
////
////  Created by Legato on 30.01.2024.
////
//
//import SwiftUI
//
//struct TestGuideView: View {
//    @State private var activeIntro: PageIntro2 = pageIntros2[0]
//    @State private var emailID: String = ""
//    @State private var password: String = ""
//    
//    var body: some View {
//        GeometryReader {
//            let size = $0.size
//            
//            IntroView2(intro: $activeIntro, size: size) {
//                ///user login signup view
//                VStack(spacing: 10) {
//                    
//                }
//            }
//        }
//        .padding(15)
//    }
//}
//
//struct IntroView2<ActionView: View>: View {
//    @Binding var intro: PageIntro2
//    var size: CGSize
//    var actionView: ActionView
//    
//    init(intro: Binding<PageIntro2>, size: CGSize, @ViewBuilder actionView: @escaping () -> ActionView) {
//        self.intro = intro
//        self.size = size
//        self.actionView = actionView()
//    }
//    
//    var body: some View {
//        VStack {
//            GeometryReader {
//                let size = $0.size
//                
//                Image(intro.introAssetImage)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: size.width, height: size.height)
//            }
//            
//            VStack(alignment: .leading, spacing: 10) {
//                Spacer(minLength: 0)
//                
//                Text(intro.title)
//                    .font(.system(size: 40))
//                    .fontWeight(.black)
//                
//                Text(intro.subTitle)
//                    .font(.caption)
//                    .foregroundColor(.gray)
//                    .padding(.top, 15)
//                
//                if !intro.displaysAction {
//                    Group {
//                        Spacer(minLength: 25)
//                        
//                        Spacer(minLength: 10)
//                        
//                        Button {
//                            changeIntro()
//                        } label: {
//                            Text("Next")
//                                .fontWeight(.semibold)
//                                .foregroundColor(.white)
//                                .frame(width: size.width * 0.4)
//                                .padding(.vertical, 15)
//                                .background {
//                                    Capsule()
//                                        .fill(.black)
//                                }
//                        }
//                        .frame(maxWidth: .infinity)
//                    }
//                }
//                else {
//                    actionView
//                }
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//        }
//    }
//    
//    func changeIntro() {
//        if let index = pageIntros2.firstIndex(of: intro), index != pageIntros2.count - 1 {
//            intro = pageIntros2[index + 1]
//        }
//        else {
//            intro = pageIntros2[pageIntros2.count - 1]
//        }
//    }
//    
//    var filterePages: [PageIntro2] {
//        return pageIntros2.filter { !$0.displaysAction}
//    }
//}
//
//#Preview {
//    TestGuideView()
//}
