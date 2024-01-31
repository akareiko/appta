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
            .contentShape(Rectangle())
            .onTapGesture(perform: configuration.trigger)
    }
}

struct beforeClick: View {
    var imageName: String
    var title: String
    var description: String
    var price: String
    @Binding var isClicked: Bool
    @Binding var didUnlock: Bool
    
    var body: some View {
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
}

struct PlanButton: View {
    var imageName: String
    var title: String
    var description: String
    var price: String
    @Binding var isClicked: Bool
    @Binding var didUnlock: Bool
    @Binding var haha: String
    
    var body: some View {
        Button(action: {withAnimation(Animation.easeInOut(duration: 0.2)) {isClicked.toggle()}}) {
            if !isClicked {
                beforeClick(imageName: imageName, title: title, description: description, price: price, isClicked: $isClicked, didUnlock: $didUnlock)
            }
            else {
                SwipeButtonView()
                    .onSwipeSuccess {
                        self.didUnlock = true
                    }
            }
        }
        .buttonStyle(NoTapAnimationStyle())
        .onChange(of: didUnlock) {
            haha = title
        }
    }
}

struct PlanProperties {
    var id: UUID = UUID()
    var isClicked: Bool
    var didUnlock: Bool
}


struct PlansView: View {
    @State var planProperties: [PlanProperties]
    
    var planplans: [PlanPlan]
    
    @Binding var haha: String
    
    init(planplans: [PlanPlan], haha: Binding<String>) {
        _planProperties = State(initialValue: Array(repeating: PlanProperties(isClicked: false, didUnlock: false), count: planplans.count))
        self.planplans = planplans
        self._haha = haha
    }
    
    @State private var selectedPlanIndex: Int?
    
//    @Binding var haha: String
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 20)
            
            Text("Current plan")
                .foregroundColor(.black)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            beforeClick(
                imageName: planplans[0].imageName,
                title: planplans[0].title,
                description: planplans[0].description,
                price: planplans[0].price,
                isClicked: $planProperties[0].isClicked,
                didUnlock: $planProperties[0].didUnlock
            )
            
            Text("All options")
                .foregroundColor(.black)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            ForEach($planProperties.indices, id: \.self) { item in
                PlanButton(
                    imageName: planplans[item].imageName,
                    title: planplans[item].title,
                    description: planplans[item].description,
                    price: planplans[item].price,
                    isClicked: Binding(
                        get: { selectedPlanIndex == item },
                        set: { newValue in
                            selectedPlanIndex = newValue ? item : nil
                        }
                    ),
                    didUnlock: $planProperties[item].didUnlock,
                    haha: $haha
                    )
            }
        }
    }
}

#Preview {
    PlansView(planplans: ModelModelData().plansplans, haha: .constant(""))
}
