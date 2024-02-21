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
    @State var didUnlock: Bool = false
    @Binding var haha: String
    @Binding var didSwipe: Bool
    
    var body: some View {
        Button(action: {withAnimation(Animation.easeInOut(duration: 0.2)) {isClicked.toggle()}}) {
            if !isClicked && !didUnlock {
                beforeClick(imageName: imageName, title: title, description: description, price: price, isClicked: $isClicked, didUnlock: $didUnlock)
            }
            else {
                SwipeButtonView()
                    .onSwipeSuccess {
                        self.didUnlock = true
                        didSwipe = true
                        haha = title
                    }
                    .onSwipeFailure {
                        self.didUnlock = false
                        didSwipe = false
                        haha = ""
                    }
            }
        }
        .buttonStyle(NoTapAnimationStyle())
    }
}

struct PlanProperties {
    var id: UUID = UUID()
    var isClicked: Bool
    var didUnlock: Bool
}


struct PlansView: View {
    @StateObject var viewModel = CoffeeshopViewModel()
    var coffeeshop_id: String
    @Binding var haha: String
    @Binding var didSwipe: Bool
    
    @State private var selectedPlanIndex: Int?
    
    var body: some View {
        VStack {
            Text("Explore options")
                .foregroundColor(.black)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            ForEach(viewModel.plans.indices, id: \.self) { index in
                PlanButton(
                    imageName: viewModel.plans[index].plan_image,
                    title: viewModel.plans[index].plan_name,
                    description: viewModel.plans[index].plan_description,
                    price: viewModel.plans[index].plan_price,
                    isClicked: Binding(
                        get: { selectedPlanIndex == index },
                        set: { newValue in
                            selectedPlanIndex = newValue ? index : nil
                        }
                    ),
                    haha: $haha,
                    didSwipe: $didSwipe
                )
            }
            
        }
        .task {
            try? await viewModel.getPlans(coffeeshop_id: coffeeshop_id)
        }
    }
}

#Preview {
    PlansView(coffeeshop_id: "mqkKxYkBMX30XJaXgkWn", haha: .constant(""), didSwipe: .constant(false))
}
