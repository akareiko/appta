//
//  StarGraphView.swift
//  appta
//
//  Created by Assylzhan Tati on 10/26/23.
//

import SwiftUI

struct StarGraphView: View {
    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { color in
                    StarGraphSegment()
            }
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color("starbucks-rewardgold").opacity(0.6))
            
            ForEach(0..<5, id: \.self) { color in
                    StarGraphSegment()
            }
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color("starbucks-rewardgold").opacity(0.6))
            
            ForEach(0..<5, id: \.self) { color in
                    StarGraphSegment()
            }
             
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(Color("starbucks-rewardgold").opacity(0.6))
        }
    }
}

#Preview {
    StarGraphView()
}
