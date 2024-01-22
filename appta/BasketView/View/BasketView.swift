//
//  CustomSwipeActionsView.swift
//  ImageViewer
//
//  Created by Assylzhan Tati on 1/4/24.
//

import SwiftUI

struct BasketView: View {
    @State var customizedDrink: [OrderModel] = []
    @State private var showDetail: [Int : Bool] = [0 : true]
    @Namespace var animation
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    VStack(alignment: .leading){
                        HStack(){
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "basket")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    
                                    Text("Basket")
                                        .font(.title.bold())
                                }
                                Text("Your chosen beverages")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Circle()
                                    .frame(width: 30)
                                    .foregroundColor(.black)
                                    .overlay(
                                        Image(systemName: "xmark")
                                            .foregroundColor(.white)
                                    )
                            }
                        }
                        .padding(.horizontal, 15)

                    }
                    .frame(height: 80)
                    .padding(.bottom, 20)
                    .offset(CGSize(width: 0, height: 20))
                    
                    ScrollView(.vertical){
                        LazyVStack(spacing: 10){
                            if customizedDrink.count > 0 {
                                ForEach(customizedDrink){thing in
                                    SwipeAction(cornerRadius: 15, direction: .trailing) {
                                        BasketCardView(order: thing)
                                    } actions: {
                                        Action(tint: Color("starbucks-rewardgold"), icon: "star.fill", text: "Favourite"){
                                            print("Bookmarked")
                                        }
                                        
                                        Action(tint: Color("starbucks-errorred"), icon: "trash.fill", text: "Delete"){
                                            withAnimation(.easeInOut){
                                                customizedDrink.removeAll(where: {$0 == thing })
                                            }
                                        }
                                    }
                                }
                            }
                            else {
                                Text("Your basket is empty")
                                    .font(.callout)
                                    .offset(CGSize(width: 0, height: 300))
                                
//                                NavigationLink(destination: CoffeeShopList()){
//                                    Text("Go shopping")
//                                        .font(.callout)
//                                        .foregroundColor(Color("starbucks-rewardgold"))
//                                        .offset(CGSize(width: 0, height: 300))
//                                }
                            }
                        }
                        .padding(15)
                        
                    }
                }
                
                VStack(alignment: .leading){
                    
                    HStack{
                        NavigationLink(destination: PaymentMethodView()){
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Payment method")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                    HStack{
                                        ZStack{
                                            Image(systemName: "creditcard.fill")
                                                .resizable()
                                                .foregroundColor(.black)
                                            //                                    .foregroundColor(Color("starbucks-rewardgold"))
                                                .frame(width: 25, height: 20)
                                            VStack{
                                                ZStack{
                                                    Circle()
                                                        .frame(width: 15, height: 15)
                                                        .foregroundColor(.white)
                                                    
                                                    VStack(){
                                                        
                                                    }
                                                    .frame(width: 15, height: 15)
                                                    .background(.thinMaterial)
                                                    .cornerRadius(40)
                                                    
                                                    VStack(){
                                                        Image(systemName: "plus")
                                                            .resizable()
                                                            .foregroundColor(.white)
                                                            .font(Font.system(size: 60, weight: .bold))
                                                            .frame(width: 9, height: 8)
                                                    }
                                                    .frame(width: 12, height: 12)
                                                    .background(.black)
                                                    .cornerRadius(40)
                                                }
                                            }
                                            .offset(CGSize(width: 10, height: 8))
                                        }
                                        
                                        Text("Add Card")
                                            .font(.callout)
                                            .foregroundColor(.black)
                                        
                                    }
                                }
                                .padding(.horizontal)
                                
                                Image(systemName: "chevron.down")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 16, height: 8)
                                    .offset(CGSize(width: 5, height: 5))
                                
                                Spacer()
                            }
                            .frame(width: 200, height: 70)
                            .background(.thinMaterial)
                            .cornerRadius(15)
                        }
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("Total Price: ")
                                    .font(.callout)
                                
                                HStack{
                                    Text("KZT \(4000)")
                                        .font(.title3.bold())
                                    
                                    Image(systemName: "tengesign")
                                        .resizable()
                                        .fontWeight(.bold)
                                        .frame(width: 13, height: 13)
                                }
                            }
                            .padding(.horizontal, 10)
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 10, height: 20)
                        }
                    }
                }
                .frame(height: 250)
                .padding(.top, 50)
                .offset(CGSize(width: 0, height: 310))
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    // Sample Card View
    @ViewBuilder
    func BasketCardView(order: OrderModel) -> some View {
        VStack{
            Button {
//                showDetail.toggle()
            } label: {
                HStack(spacing: 12){
                    Image(order.image)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text(order.title)
                            .font(.callout.bold())
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                        
                        Text("\(order.drinkSize)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer(minLength: 0)
                    
                    HStack(spacing: 5){
                        Text("KZT")
                            .font(.callout.bold())
                            .foregroundColor(.black)
                        
                        Text("\(order.customizedPrice)")
                            .font(.callout)
                            .foregroundColor(.black)
                        
                        Image(systemName: "tengesign")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.black)
                    }
                }
                .foregroundStyle(.white.opacity(0.4))
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(.thinMaterial)
            }
        }
    }
}

struct SwipeAction<Content: View>: View {
    var cornerRadius: CGFloat = 0
    var direction: SwipeDirection = .trailing
    @ViewBuilder var content: Content
    @ActionBuilder var actions: [Action]
    // View Properties
    @Environment(\.colorScheme) private var scheme
    // View Unique ID
    let viewID = UUID()
    @State private var isEnabled: Bool = true
    @State private var scrollOffset: CGFloat = .zero
    var body: some View {
        ScrollViewReader{ proxy in
            ScrollView(.horizontal){
                LazyHStack(spacing: 0){
                    content
                        .rotationEffect(.init(degrees: direction == .leading ? -180 : 0))
                        // To take full available space
                        .containerRelativeFrame(.horizontal)
                        .background(scheme == .dark ? .black : .white)
                        .background{
                            if let firstAction = filteredActions.first {
                                Rectangle()
                                    .fill(firstAction.tint)
                                    .opacity(scrollOffset == .zero ? 0 : 1)
                            }
                        }
                        .id(viewID)
                        .transition(.identity)
                        .overlay{
                            GeometryReader {
                                let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX
                                
                                Color.clear
                                    .preference(key: OffsetKey3.self, value: minX)
                                    .onPreferenceChange(OffsetKey3.self) {
                                        scrollOffset = $0
                                    }
                            }
                        }
                    
                    ActionButtons{
                        withAnimation(.snappy){
                            proxy.scrollTo(viewID, anchor: direction == .trailing ? .topLeading : .topTrailing)
                        }
                    }
                    .opacity(scrollOffset == .zero ? 0 : 1)
                }
                .scrollTargetLayout()
                .visualEffect{ content, geometryProxy in
                    content
                        .offset(x: scrollOffset(geometryProxy))
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .background{
                if let lastAction = filteredActions.last {
                    Rectangle()
                        .fill(lastAction.tint)
                        .opacity(scrollOffset == .zero ? 0 : 1)
                }
            }
            .clipShape(.rect(cornerRadius: cornerRadius))
            .rotationEffect(.init(degrees: direction == .leading ? 180 : 0))
        }
        .allowsHitTesting(isEnabled)
        .transition(CustomTransition())
    }
    
    // Action Buttons
    @ViewBuilder
    func ActionButtons(resetPosition: @escaping () -> ()) -> some View {
        // Each Button Will Have 100 Width
        Rectangle()
            .fill(.clear)
            .frame(width: CGFloat(filteredActions.count) * 100)
            .overlay(alignment: direction.alignment){
                HStack(spacing: 0){
                    ForEach(filteredActions){ button in
                        Button(action: {
                            Task{
                                isEnabled = false
                                resetPosition()
                                try? await Task.sleep(for: .seconds(0.25))
                                button.action()
                                try? await Task.sleep(for: .seconds(0.1))
                                isEnabled = true
                            }
                        }, label: {
                            VStack(spacing: -5){
                                Image(systemName: button.icon)
                                    .font(button.iconFont)
                                    .foregroundStyle(button.iconTint)
                                    .frame(width: 100)
                                    .frame(maxHeight: .infinity)
                                    .contentShape(.rect)
                                
                                Text(button.text)
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 2)
                            }
                        })
                        .buttonStyle(.plain)
                        .background(button.tint)
                        .rotationEffect(.init(degrees: direction == .leading ? -180 : 0))
                    }
                }
            }
    }
    
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        
        return (minX > 0 ? -minX : 0)
    }
    
    var filteredActions: [Action]{
        return actions.filter({$0.isEnabled})
    }
}

// Offset Key
struct OffsetKey3: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// Custom Transition
struct CustomTransition: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View{
        content
            .mask{
                GeometryReader {
                    let size = $0.size
                    Rectangle()
                        .offset(y: phase == .identity ? 0 : -size.height)
                }
                .containerRelativeFrame(.horizontal)
            }
    }
}

// Swipe Direction
enum SwipeDirection {
    case leading
    case trailing
    
    var alignment: Alignment {
        switch self{
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
}

struct Action: Identifiable {
    private(set) var id: UUID = .init()
    var tint: Color
    var icon: String
    var text: String
    var iconFont: Font = .title
    var iconTint: Color = .white
    var isEnabled: Bool = true
    var action: () -> ()
}

//extension BasketView {
//    func calculateTotalPrice() -> Int {
//        var total = 0
//
//        for (_, optionType) in optionArray {
//            if let price = optionType.price {
//                total += price
//            }
//        }
//
//        return 0
//
//    }
//}

@resultBuilder
struct ActionBuilder{
    static func buildBlock(_ components: Action...) -> [Action] {
        return components
    }
}

#Preview {
    BasketView()
}
