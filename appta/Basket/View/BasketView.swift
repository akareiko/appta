//
//  CustomSwipeActionsView.swift
//  ImageViewer
//
//  Created by Assylzhan Tati on 1/4/24.
//

import SwiftUI

struct BasketView: View {
    @ObservedObject var coffee: SelectedCoffee
    
    @State private var isToggleOn: Bool = false
    @State private var showDetail: [String : Bool] = [:]
    @State private var toggleDrinkCustomizerBasket: Bool = false
    @State private var showFavourites: Bool = false
    
    @Binding var customizedDrink: [OrderModel]
    
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
                                        .foregroundColor(.black)
                                    
                                    Text("Basket")
                                        .font(.title.bold())
                                        .foregroundColor(.black)
                                }
                                Text("Your chosen beverages")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Button(action: {showFavourites.toggle()}, label: {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color("starbucks-rewardgold"))
                                    .sheet(isPresented: $showFavourites, content: {
                                        FavouritesView()
                                            .presentationBackground(.ultraThinMaterial)
                                    })
                                    
                            })
                            
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
                    
                    HStack{
                        Text("Address: Dostyk 5 (TRC 'Keruen')")
                            .font(.footnote.bold())
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                    
                        Button(action: {
                            customizedDrink.removeAll()
                        }) {
                            HStack{
                                Text("Delete")
                                    .font(.footnote)
                                    .foregroundColor(Color("starbucks-errorred"))
                                
                                Image(systemName: "trash.fill")
                                    .foregroundColor(Color("starbucks-errorred"))
                            }
                        }
                    }
                    .padding(.horizontal, 15)
                    
                    ScrollView(.vertical){
                        LazyVStack(spacing: 0){
                            if customizedDrink.count > 0{
                                ForEach(customizedDrink){thing in
                                        SwipeAction(cornerRadius: 15, direction: .trailing) {
                                            if thing.quantity > 0 {
                                                BasketCardView(order: thing)
                                            }
                                        } actions: {
                                            Action(tint: Color("starbucks-rewardgold"), icon: "square.and.pencil", text: "Edit"){
                                                updateSelectedCoffee(with: thing)
                                                toggleDrinkCustomizerBasket.toggle()
                                            }
                                            
                                            Action(tint: Color("starbucks-errorred"), icon: "trash.fill", text: "Delete"){
                                                withAnimation(.easeInOut){
                                                    customizedDrink.removeAll(where: {$0 == thing })
                                                }
                                            }
                                        }
                                        
                                        SwipeAction(cornerRadius: 15, direction: .leading) {
                                            
                                        } actions: {
                                            Action(tint: Color("starbucks-rewardgold"), icon: "square.and.pencil", text: "Edit"){
                                            }
                                            
                                            Action(tint: Color("starbucks-rewardgold"), icon: "square.and.pencil", text: "Edit"){
                                            }
                                        }
                                        
                                        if showDetail[thing.id, default: false] {
                                            VStack(alignment: .leading){
                                                Text("Details:")
                                                    .font(.callout.bold())
                                                    .foregroundColor(.black)
                                                
                                                HStack{
                                                    VStack(alignment: .leading){
                                                        Text("Drink: \(thing.drink.title)")
                                                            .font(.footnote)
                                                            .foregroundColor(.secondary)
                                                        
                                                        Text("Milk: \(thing.optionArray[0]?.name ?? "")")
                                                            .font(.footnote)
                                                            .foregroundColor(.secondary)
                                                        
                                                        Text("Syrup: \(thing.optionArray[1]?.name ?? "")")
                                                            .font(.footnote)
                                                            .foregroundColor(.secondary)
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    VStack(alignment: .leading){
                                                        Text("Temperature: \(thing.optionArray[2]?.name ?? "")")
                                                            .font(.footnote)
                                                            .foregroundColor(.secondary)
                                                        
                                                        Text("Blend: \(thing.optionArray[3]?.name ?? "")")
                                                            .font(.footnote)
                                                            .foregroundColor(.secondary)
                                                        
                                                        Text("Strength: \(thing.optionArray[4]?.name ?? "")")
                                                            .font(.footnote)
                                                            .foregroundColor(.secondary)
                                                    }
                                                }
                                            }
                                            .padding(.horizontal, 15)
                                            .padding(.bottom, 15)
                                        }
                                }
                            }
                            else {
                                VStack{
                                    Text("Your basket is empty")
                                        .font(.callout)
                                        .foregroundColor(.black)
                                    
                                    NavigationLink(destination: CoffeeShopList()){
                                        Text("Go shopping")
                                            .font(.callout)
                                            .foregroundColor(Color("starbucks-rewardgold"))
                                    }
                                }
                                .offset(CGSize(width: 0, height: 200))
                            }
                        }
                        .sheet(isPresented: $toggleDrinkCustomizerBasket){
                            DrinkCustomizer(coffee: coffee, customizedDrink: $customizedDrink)
                                .presentationBackground(.ultraThinMaterial)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                    }
                }
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Do you want to use your coffee tokens?")
                            .font(.callout)
                            .foregroundColor(.black)
                            .lineLimit(2)
                            .frame(width: 150)
                        
                        Toggle("", isOn: $isToggleOn)
                    }
                    .padding(.horizontal, 20)
                    
                    HStack{
                        DropView()
                            .padding(.leading, 10)
                            .offset(CGSize(width: 0, height: -115))
                        
                        Spacer()
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("Total Price: ")
                                    .font(.callout)
                                    .foregroundColor(.black)
                                
                                HStack{
                                    Text("KZT \(calculateTotalPrice())")
                                        .font(.title3.bold())
                                        .foregroundColor(.black)
                                    
                                    Image(systemName: "tengesign")
                                        .resizable()
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .frame(width: 13, height: 13)
                                }
                            }
                            .padding(.horizontal, 10)
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 10, height: 20)
                                .foregroundColor(.black)
                        }
                        .frame(width: 180)
                        .padding(.trailing, 20)
                        .offset(CGSize(width: 0, height: 2))
                    }
                }
                .frame(height: 130)
                .background(.white)
                .offset(CGSize(width: 0, height: 300))
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    // Sample Card View
    @ViewBuilder
    func BasketCardView(order: OrderModel) -> some View {
        VStack(alignment: .leading){
            Button {
                withAnimation(.spring){
                    showDetail[order.id, default: false].toggle()
                }
            } label: {
                HStack(spacing: 8){
                    Spacer(minLength: 0)
                    
                    HStack(){
                        Text("\(order.quantity)")
                            .font(.callout.bold())
                            .foregroundColor(.black)
                            .padding(.trailing, 5)
                        
                        Rectangle()
                            .frame(width: 1, height: 20)
                            .background(.thinMaterial)
                    }
                    
                    Image(order.drink.image)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                        .padding(.bottom, 10)
                        .padding(.leading, -10)
                    
                    Spacer(minLength: 0)
                    
//                    Circle()
//                        .frame(width: 50)
//                        .foregroundColor(Color("starbucks-housegreen"))
//                        .overlay(content: {
//                            Image(order.image)
//                                .resizable()
//                                .clipShape(Circle())
//                                .frame(width: 50, height: 50)
//                                .padding(.bottom, 10)
//                        })
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text(order.drink.title)
                            .font(.callout.bold())
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                    
                        Text("Size: \(order.drink.drinkSize[order.drinkSizeIndex]) ml")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                    .frame(width: 120)
                    .padding(.leading, -40)
                    
                    Spacer(minLength: 0)
                    
                    HStack{
                        Text("KZT")
                            .font(.callout.bold())
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        Text("\(order.customizedPrice)")
                            .font(.callout)
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        Image(systemName: "tengesign")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.black)
                    }
                    
                    Spacer(minLength: 0)
                }
                .foregroundStyle(.white.opacity(0.4))
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
            .rotationEffect(.init(degrees: direction == .leading ? -180 : 0))
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

extension BasketView {
    func calculateTotalPrice() -> Int {
        var total = 0
        
        for order in customizedDrink {
            total += order.customizedPrice * order.quantity
        }
        
        return total
    }
    
        func updateSelectedCoffee(with thing: OrderModel) {
            coffee.selectedCoffee = thing.drink
        }
}


@resultBuilder
struct ActionBuilder{
    static func buildBlock(_ components: Action...) -> [Action]{
        return components
    }
}
