import SwiftUI
import Foundation

struct TextViewHom: View {
    var body: some View {
        Text("appta")
            .font(.custom("Helvetica", size: 15))
            .bold()
            .padding(9)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(15)
            .padding(45)
    }
}

struct HomeView: View {
    @State private var selectedTab: Tab = .house

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                        GeometryReader { geometry in
                            Image("hehone")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(
                                    width: geometry.size.width,
                                    height: geometry.safeAreaInsets.top + 200
                                )
                                .clipped()
                                .offset(y: 50)
    //                            .luminanceToAlpha()
                                .overlay(TextViewHom())
                        }
                        .frame(height: 210)

                        VStack {
                            CategoryRowStory(categoryName: ModelData().coffeeshops[0].category.rawValue, items: ModelData().coffeeshops)
                            Spacer()
                        }
                    
                    Divider()

                        VStack {
                            CategoryRow(
                                categoryName: ModelData().coffeeshops[0].category.rawValue,
                                items: ModelData().coffeeshops
                            )
                            Spacer()
                        }
                    
                    Divider()

                        VStack {
                            Image("hehtwo")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                                .cornerRadius(10)
                                .padding(.top)
                                .padding(.bottom)

                            Spacer()
                        }
                    
                    Divider()
                    
                        VStack {
                            CategoryRow(
                                categoryName: "Subscription+",
                                items: ModelData().coffeeshops
                            )
                            Spacer()
                        }
                    Spacer()
                }
                .overlay(
                    NavigationBar()
//                        .offset(y: 20)
                )
            }
//            .edgesIgnoringSafeArea(.top)
        }
//        .accentColor(.white)
    }
}

//struct HomeView: View {
//    @State private var selectedTab: Tab = .house
//    @State private var showNavigationBar: Bool = false
//
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                ScrollView {
//                    VStack(spacing: 0) {
//
//                        GeometryReader { geometry in
//                            Image("hehone")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(
//                                    width: geometry.size.width,
//                                    height: geometry.safeAreaInsets.top + 300
//                                )
//                                .clipped()
//                                .offset(y: -geometry.safeAreaInsets.top)
//                                .overlay(TextViewHom())
//                                .background(
//                                    GeometryReader { innerGeometry -> Color in
//                                        let yOffset = innerGeometry.frame(in: .global).minY
//                                        if yOffset < -300 && !showNavigationBar {
//                                            DispatchQueue.main.async {
//                                                showNavigationBar = true
//                                            }
//                                        } else if yOffset >= -300 && showNavigationBar {
//                                            DispatchQueue.main.async {
//                                                showNavigationBar = false
//                                            }
//                                        }
//                                        return Color.clear
//                                    }
//                                )
//                        }
//                        .frame(height: 300)
//
//                        VStack {
//                            CategoryRowStory(categoryName: ModelData().coffeeshops[0].category.rawValue, items: ModelData().coffeeshops)
//                            Spacer()
//                        }
//
//                        VStack {
//                            CategoryRow(
//                                categoryName: ModelData().coffeeshops[0].category.rawValue,
//                                items: ModelData().coffeeshops
//                            )
//                            Spacer()
//
//                        }
//
//                        VStack {
//                            Image("hehtwo")
//                                .renderingMode(.original)
//                                .resizable()
//                                .frame(width: 350, height: 150)
//                                .cornerRadius(10)
//
//                            Spacer()
//                        }
//                        VStack {
//                            CategoryRow(
//                                categoryName: "Subscription+",
//                                items: ModelData().coffeeshops
//                            )
//                            Spacer()
//                        }
//                    }
//                }
//                if showNavigationBar {
//                    NavigationBar()
//                        .animation(Animation.easeInOut, value: UUID())
//                }
//            }
//            .edgesIgnoringSafeArea(.top)
//        }
////        .accentColor(.white)
//    }
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
