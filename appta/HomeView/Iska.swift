//
//  Iska.swift
//  appta
//
//  Created by Legato on 23.08.2023.
//

import SwiftUI

struct Iska: View {
    var body: some View {
        VStack {
            Spacer()
            ZStack{
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.green)
                Text("\(1)")
                    .foregroundColor(.white)
                    .font(.system(size: 70, weight: .bold))
            }
            Spacer()
        }
        Spacer()
    }
}

struct Iska_Previews: PreviewProvider {
    static var previews: some View {
        Iska()
    }
}
