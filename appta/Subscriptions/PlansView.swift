//
//  PlansView.swift
//  appta
//
//  Created by Legato on 21.01.2024.
//

import SwiftUI

struct NoTapAnimationStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // Make the whole button surface tappable. Without this only content in the label is tappable and not whitespace. Order is important so add it before the tap gesture
            .contentShape(Rectangle())
            .onTapGesture(perform: configuration.trigger)
    }
}

struct PlansView: View {
    @State private var isClicked1: Bool = false
    @State private var isClicked2: Bool = false
    @State private var isClicked3: Bool = false
    @State private var isClicked4: Bool = false
    
    
    var body: some View {
        ScrollView {
            Text("Choose your plan")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxHeight: .infinity, alignment: .top)
            
            Text("Current plan")
                .foregroundColor(.black)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            Button(action: {}){
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.black)
                            .frame(width: 350, height: 85)
                        HStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                                .frame(width: 90, height: 70)
                                .padding(.horizontal, 20)
                                .overlay(
                                    Image(systemName: "bird")
                                        .foregroundColor(.black)
                                )
                            
                            VStack {
                                Text("Standard Sip")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.bold)
                                Text("Everyday luxury in a cup – experience the Standard Sip")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.caption)
                            }
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)
                                .padding(.horizontal, 20)
                        }
                    }
                    
                }
                .padding()
            }
            
            Text("All options")
                .foregroundColor(.black)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            Button(action: { withAnimation(Animation.easeInOut(duration: 0.2)) {isClicked1.toggle()}}){
                if(isClicked1 == false){
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.black)
                                .frame(width: 350, height: 85)
                            HStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 90, height: 70)
                                    .padding(.horizontal, 20)
                                    .overlay(
                                        Image(systemName: "lizard")
                                            .foregroundColor(.black)
                                    )
                                
                                VStack {
                                    Text("Basic Brew")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .fontWeight(.bold)
                                    Text("Classic simplicity, pure satisfaction – discover the Basic Brew")
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.caption)
                                }
                                
                                Image(systemName: "checkmark")
                                    .foregroundColor(.black)
                                    .frame(width: 30, height: 30)
                                    .padding(.horizontal, 20)
                            }
                        }
                    }
                }
                else {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.black)
                                .frame(width: 350, height: 165)
                            HStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 90, height: 150)
                                    .padding(.horizontal, 20)
                                    .overlay(
                                        Image(systemName: "lizard")
                                            .foregroundColor(.black)
                                    )
                                
                                VStack {
                                    Text("Basic Brew")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .fontWeight(.bold)
                                    Text("Classic simplicity, pure satisfaction – discover the Basic Brew")
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.caption)
                                }
                                
                                Image(systemName: "checkmark")
                                    .foregroundColor(.black)
                                    .frame(width: 30, height: 30)
                                    .padding(.horizontal, 20)
                            }
                        }
                    }
                }
            }
            .padding()
            .buttonStyle(NoTapAnimationStyle())
            
            Button(action: { withAnimation(Animation.easeInOut(duration: 0.2)) {isClicked2.toggle()}}){
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.black)
                            .frame(width: 350, height: 85)
                        HStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                                .frame(width: 90, height: 70)
                                .padding(.horizontal, 20)
                                .overlay(
                                    Image(systemName: "bird")
                                        .foregroundColor(.black)
                                )
                            
                            VStack {
                                Text("Standard Sip")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.bold)
                                Text("Everyday luxury in a cup – experience the Standard Sip")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.caption)
                            }
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                                .padding(.horizontal, 20)
                        }
                    }
                    
                }
            }
            .padding()
            .offset(y: -30)
            .buttonStyle(NoTapAnimationStyle())
            
            Button(action: {}){
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.black)
                            .frame(width: 350, height: 85)
                        HStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                                .frame(width: 90, height: 70)
                                .padding(.horizontal, 20)
                                .overlay(
                                    Image(systemName: "fish")
                                        .foregroundColor(.black)
                                )
                            
                            VStack {
                                Text("Premium Pour")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.bold)
                                Text("Elevated taste, unmatched quality – welcome the Premium")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.caption)
                            }
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)
                                .padding(.horizontal, 20)
                        }
                    }
                    
                }
            }
            .padding()
            .offset(y: -60)
            
            Button(action: {}){
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.black)
                            .frame(width: 350, height: 80)
                        HStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                                .frame(width: 90, height: 70)
                                .padding(.horizontal, 20)
                                .overlay(
                                    Image(systemName: "cat")
                                        .foregroundColor(.black)
                                )
                            
                            VStack {
                                Text("Ultimate Roast")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.bold)
                                Text("Indulge in luxury, savor perfection – it's the Ultimate Roast")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.caption)
                            }
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)
                                .padding(.horizontal, 20)
                        }
                    }
                    
                }
            }
            .padding()
            .offset(y: -90)
        }
        .offset(y: 50)
    }
}

#Preview {
    PlansView()
}
