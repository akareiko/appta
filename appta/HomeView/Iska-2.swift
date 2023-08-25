//
//  Iska-2.swift
//  appta
//
//  Created by Legato on 23.08.2023.
//

import SwiftUI

struct Iska_2: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
            Text("\(1)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .bold))
        }
    }
}

struct Iska_2_Previews: PreviewProvider {
    static var previews: some View {
        Iska_2()
    }
}
