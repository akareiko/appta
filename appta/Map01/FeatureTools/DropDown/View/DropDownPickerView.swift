//
//  DropDownPickerView.swift
//  ImageViewer
//
//  Created by Assylzhan Tati on 1/11/24.
//

import SwiftUI

struct DropDownPickerView: View {
    //Customization Properties
    var hint: String
    var options: [PaymentOption]
    var anchor: Anchor = .bottom
    var maxWidth: CGFloat = 180
    var cornerRadius: CGFloat = 15
    @Binding var selection: String?
    @State private var icon: String = ""
    // View Properties
    @State private var showOptions: Bool = false
    // Environment Scheme
    @Environment(\.colorScheme) private var scheme
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State private var zIndex: Double = 1000.0
    var body: some View {
        GeometryReader{
            let size = $0.size
            
            VStack(spacing: 0){
                if showOptions && anchor == .top {
                    OptionsView()
                }
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Payment method")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        HStack{
                            ZStack{
                                Image(systemName: selection ?? "creditcard.fill")
                                    .resizable()
                                    .foregroundColor(.black)
                                //                                    .foregroundColor(Color("starbucks-rewardgold"))
                                    .frame(width: 25, height: 20)
                                if (selection == nil) {
                                    VStack{
                                        ZStack{
                                            Circle()
                                                .frame(width: 15, height: 15)
                                                .foregroundColor(.white)
                                            
                                            
                                            VStack(){
                                                Image(systemName: "plus")
                                                    .resizable()
                                                    .foregroundColor(.white)
                                                    .font(Font.system(size: 60, weight: .bold))
                                                    .frame(width: 9, height: 8)
                                                
                                                    .frame(width: 12, height: 12)
                                                    .background(.black)
                                                    .cornerRadius(40)
                                                
                                            }
                                        }
                                    }
                                    .offset(CGSize(width: 10, height: 8))
                                } else {
                                    Image(icon)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                            }
                            
                            Text(selection ?? "Add Card")
                                .font(.callout)
                                .foregroundColor(.black)
                            
                        }
                    }
                    .padding(.horizontal)
                    
                    Image(systemName: "chevron.down")
                        .font(.title3)
                        .foregroundStyle(.gray)
                        //Rotating Icon
                        .rotationEffect(.init(degrees: showOptions ? -180 : 0))
                    
                    Spacer()
                }
                .frame(width: 200, height: 70)
                .background(.thinMaterial)
                .cornerRadius(15)
                .onTapGesture{
                    index += 1
                    zIndex = index
                    withAnimation(.snappy){
                        showOptions.toggle()
                    }
                }
                .zIndex(10)
                
                if showOptions && anchor == .bottom {
                    OptionsView()
                }
            }
            .clipped()
            // Clips All Interaction with it's bounds
            .background(.ultraThinMaterial.opacity(0.5)) //
            .cornerRadius(15)
            .frame(height: size.width, alignment: anchor == .top ? .bottom : .top)
        }
        .frame(width: maxWidth, height: 50)
        .zIndex(zIndex)
    }
    
    @ViewBuilder
    func OptionsView() -> some View {
        VStack(spacing: 10){
            ForEach(options){ option in
                HStack(spacing: 0){
                    Image(option.icon)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 10)
                        .padding(.leading, -10)
                    
                    
                    VStack(alignment: .leading){
                        Text(option.title)
                            .font(.callout)
                            .lineLimit(1)
                        
                        Text(option.subtitle)
                            .font(.footnote)
                            .lineLimit(1)
                    }
                    Spacer(minLength: 0)
                    
                    Image(systemName: "checkmark")
                        .font(.caption)
                        .opacity(selection == option.title ? 1 : 0)
                }
                .foregroundStyle(selection == option.title ? Color.primary : Color.gray)
                .animation(.none, value: selection)
                .frame(height: 40)
                .contentShape(.rect)
                .onTapGesture{
                    withAnimation(.snappy){
                        selection = option.title
                        icon = option.icon
                        // Closing Drop Down View
                        showOptions = false
                        
                    }
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
        // Adding Transition
        .transition(.move(edge: anchor == .top ? .bottom : .top))
    }
    
    // Drop Down Direction
    enum Anchor {
        case top
        case bottom
    }
}

struct PaymentOption: Identifiable, Hashable {
    var id = UUID().uuidString
    var title: String
    var subtitle: String
    var icon: String
    var images: [String]
}

#Preview {
    DropView()
}
