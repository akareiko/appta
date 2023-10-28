//
//  ProgressBar.swift
//  appta
//
//  Created by Assylzhan Tati on 10/25/23.
//

import SwiftUI

struct ProgressMeter: View {
    @State private var barLimit: Float = 200
    @State private var progressValue: Float = 0
    
    var body: some View {
        VStack{
            HStack{
                Text("Progress Meter")
                    .padding()
            }
        }
        
        ProgressBar(barTotal: barLimit, barValue: progressValue)
        
        Divider()
        
        HStack{
            Slider(value: $barLimit, in: 10 ... 200, step: 10)
                .tint(.red)
                
            
            Text("\(barLimit, format: .number.precision(.fractionLength(0)))")
        }
        .padding(.horizontal)
        .padding(.top)
        
        HStack{
            Slider(value: $progressValue, in: 10 ... barLimit)
                .tint(.blue)
            
            Text("\(progressValue, format: .number.precision(.fractionLength(0)))")
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProgressMeter()
}
