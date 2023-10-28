//
//  ProgressBar.swift
//  appta
//
//  Created by Assylzhan Tati on 10/25/23.
//

import SwiftUI

struct ProgressBar: View {
    
    let barTotal: Float
    let barValue: Float
    
    var body: some View {
        GeometryReader{ screen in
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: .infinity)
                    .foregroundColor(Color("starbucks-rewardgold").opacity(0.5))
                    .frame(width: 270)
                
                RoundedRectangle(cornerRadius: .infinity)
                    .foregroundColor(Color("starbucks-rewardgold"))
                    .frame(width: 270 * CGFloat(barValue)/CGFloat(barTotal))
            }
            .frame(width: UIScreen.main.bounds.width, height: 5)
            
        }
    }
}

#Preview {
    ProgressBar(barTotal: 200, barValue: 80)
}
