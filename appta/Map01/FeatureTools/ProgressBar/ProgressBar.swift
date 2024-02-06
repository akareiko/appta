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
                    .foregroundColor(Color("starbucks-lightgold").opacity(0.5))
                    .frame(width: 235)
                
                RoundedRectangle(cornerRadius: .infinity)
                    .foregroundColor(Color("starbucks-lightgold"))
                    .frame(width: 235 * CGFloat(barValue)/CGFloat(barTotal))
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: 5)
            
        }
    }
}

#Preview {
    ProgressBar(barTotal: 200, barValue: 80)
}
