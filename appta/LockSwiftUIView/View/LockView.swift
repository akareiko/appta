//
//  LockView.swift
//  appta
//
//  Created by Assylzhan Tati on 10/22/23.
//

import SwiftUI

struct LockView<Content: View>: View {
    /// Lock Properties
    var lockType: LockType
    var lockPin: String
    var isEnabled: Bool
    var lockWhenAppGoesBackground: Bool = true
    @ViewBuilder var content: Content
    var forgotPin: () -> () = { }
    /// View Properties
    @State private var pin: String = ""
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            content
                .frame(width: size.width, height: size.height)
            
            if isEnabled {
                Rectangle()
                    .ignoresSafeArea()
                
                ZStack {
                    if lockType == .both || lockType == .biometric {
                        
                    } else {
                        /// Custom Number Pad to type View Lock Pin
                        NumberPadPinView()
                    }
                }
            }
        }
    }
    
    /// Numbered Pin View
    @ViewBuilder
    func NumberPadPinView() -> some View {
        VStack(spacing: 15){
            Text("Enter Pin")
                .font(.title.bold())
                .frame(maxWidth: .infinity)
                
            HStack(spacing: 10){
                ForEach(0..<4, id: \.self){ index in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 55)
                    /// Showing Pin at each box with the help of Index
                        .overlay{
                            if pin.count > index {
                                let index = pin.index(pin.startIndex, offsetBy: index)
                                let string = String(pin[index])
                                
                                Text(string)
                                    .font(.title.bold())
                                    .foregroundStyle(.black)
                            }
                        }
                }
            }
            .padding(.top, 15)
            .overlay(alignment: .bottomTrailing, content: {
                Button("Forgot Pin?", action: forgotPin)
                    .foregroundStyle(.white)
                    .offset(y: 40)
            })
            .frame(maxWidth: .infinity)
            
            /// Custom Number Pad
            GeometryReader {_ in
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), content: {
                    ForEach(1...9, id:\.self) {number in
                        Button(action: {
                            /// Adding Number to Pin
                            /// Max Limit - 4
                            if pin.count < 4 {
                                pin.append("\(number)")
                            }
                        }, label: {
                            Text("\(number)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .contentShape(.rect)
                        })
                        .tint(.white)
                    }
                    
                    /// 0 and Back Button
                    Button(action: {
                        if !pin.isEmpty {
                            pin.removeLast()
                        }
                    }, label: {
                        Image(systemName: "delete.backward")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .contentShape(.rect)
                    })
                    .tint(.white)
                    
                    Button(action: {
                        if pin.count < 4 {
                            pin.append("0")
                        }
                    }, label: {
                        Text("0")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .contentShape(.rect)
                    })
                    .tint(.white)
                })
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .padding()
        .environment(\.colorScheme, .dark)
    }
    
    /// Lock Type
    enum LockType: String {
        case biometric = "Bio Metric Auth"
        case number = "Custom Number Lock"
        case both = "First preference will be biometric, and if it's not available, it will go for number lock."
    }
}

#Preview {
    PINView()
}
