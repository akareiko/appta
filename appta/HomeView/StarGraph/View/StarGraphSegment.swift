//
//  StarGraphSegment.swift
//  appta
//
//  Created by Assylzhan Tati on 10/27/23.
//

import SwiftUI

struct StarGraphSegment: View {
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 8, height: 5)
                .foregroundColor(Color("starbucks-rewardgold").opacity(0.2))
                .shadow(radius: 1)
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 8, height: 5)
                .foregroundColor(Color("starbucks-rewardgold"))
        }
    }
}

#Preview {
    StarGraphSegment()
}
