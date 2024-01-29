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

struct PlanButton: View {
    var imageName: String
    var title: String
    var description: String
    var price: String
    @Binding var isClicked: Bool
    @Binding var showUnlock: Bool
    @Binding var didUnlock: Bool
    
    var body: some View {
        Button(action: {withAnimation(Animation.easeInOut(duration: 0.2)) {isClicked.toggle()}}) {
            if !isClicked {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.black)
                            .frame(width: 380, height: 95)
                        HStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                                .frame(width: 90, height: 70)
                                .padding(.horizontal, 20)
                                .overlay(
                                    Image(systemName: imageName)
                                        .foregroundColor(.black)
                                )
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(title)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .fontWeight(.bold)
                                    
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color.white)
                                        .frame(width: 90, height: 25)
                                        .overlay(
                                            Text(price)
                                                .foregroundColor(.black)
                                        )
                                }
                                Text(description)
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.caption)
                            }
                            .padding(.trailing, 20)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            else {
                if showUnlock {
                    SwipeButtonView()
                        .onSwipeSuccess {
                            self.didUnlock = true
                }
            }
        }
            
        if didUnlock {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.ultraThinMaterial)
                    .frame(width: 380, height: 65)
                    .transition(AnyTransition.scale.animation(Animation.spring(response: 0.3, dampingFraction: 0.5)))
                
                HStack {
                    Button(action: {
//                            obj.abc = true
                    }) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("starbucks-lightgold"))
                            .shadow(radius: 1)
                            .frame(width: 260, height: 40)
                            .overlay(
                                Text("Подтвердить").foregroundColor(.white).fontWeight(.bold)
                            )
                    }
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("starbucks-lightgold"))
                            .shadow(radius: 1)
                            .frame(width: 80, height: 40)
                            .overlay(
                                Image(systemName: "x.circle")
                                    .font(.title)
                                    .foregroundColor(.white)
                            )
                }
            }
            .padding(.bottom, 30)
            
//                if obj.abc {
//                    Text("HAHA LOX")
//                }
        }
        }
        .buttonStyle(NoTapAnimationStyle())
        .onAppear() {
            self.showUnlock = true
        }
    }
}

struct PlanProperties {
    var isClicked: Bool
    var showUnlock: Bool
    var didUnlock: Bool
}

struct PlansView: View {
    @State var planProperties: [PlanProperties] = Array(repeating: PlanProperties(isClicked: false, showUnlock: false, didUnlock: false), count: 4)
    
    @EnvironmentObject var obj: GlobalWars
    
    var planplan: PlanPlan
    
    var body: some View {
        VStack {
            Text("Step Two")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
            Text("Choose your plan  ")
                .foregroundColor(.black)
                .font(.title2)
            +
            Text(Image(systemName: "plus.rectangle"))
        }
        
        Spacer()
            .frame(height: 20)
        
        Text("Current plan")
            .foregroundColor(.black)
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
        PlanButton(
            imageName: planplan.imageName,
            title: planplan.title,
            description: planplan.description,
            price: planplan.price,
            isClicked: $planProperties[0].isClicked,
            showUnlock: $planProperties[0].showUnlock,
            didUnlock: $planProperties[0].didUnlock
        )
        
        Text("All options")
            .foregroundColor(.black)
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            
        ScrollView {
            ForEach($planProperties.indices, id: \.self) { item in
                PlanButton(
                    imageName: "bird",
                    title: "Standard Sip",
                    description: "Everyday luxury in a cup – experience the Standard Sip",
                    price: "4000KZT",
                    isClicked: $planProperties[item].isClicked,
                    showUnlock: $planProperties[item].showUnlock,
                    didUnlock: $planProperties[item].didUnlock
                    )
            }
        }
    }
}

#Preview {
    PlansView(planplan: ModelModelData().plansplans[0])
}

