//
//  DropDownPicker.swift
//  appta
//
//  Created by Assylzhan Tati on 11/23/23.
//

import SwiftUI

struct DropDownView: View {
    var hint: String
    var options: [String]
    var anchor: Anchor = .bottom
    var maxWidth: CGFloat = 180
    var cornerRadius: CGFloat = 15
    @Binding var selection: String?
    // View Properties
    @State private var showOptions: Bool = false
    // Environmental Scheme
    @Environment(\.colorScheme) private var scheme
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0){
                HStack(spacing: 0) {
                    Text(selection ?? hint)
                        .foregroundStyle(selection == nil ? .gray : .primary)
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "chevron.down")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 15)
                .frame(width: size.width, height: size.width)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        showOptions.toggle()
                    }
                }
            }
            .background((scheme == .dark ? Color.black : Color.white).shadow(color: .primary.opacity(0.15), radius: 4))
        }
        .frame(width: maxWidth, height: 50)
    }
    
    enum Anchor {
        case top
        case bottom
    }
}

#Preview {
    MenuRoundedPanel08()
}
