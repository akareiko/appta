//
//  HapticVibrationTest.swift
//  appta
//
//  Created by Assylzhan Tati on 3/22/24.
//

import SwiftUI

struct HapticVibrationTest: View {

    let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
    
    var body: some View {
        VStack{
            Button {
                impactFeedbackGenerator.impactOccurred()
            } label: {
                Text("Impact Feedback")
            }

            Button {
                selectionFeedbackGenerator.selectionChanged()
            } label: {
                Text("Selection Feedback")
            }
            
            Button {
                notificationFeedbackGenerator.notificationOccurred(.error)
            } label: {
                Text("Notification Feedback")
            }
        }
        .padding()
    }
}

#Preview {
    HapticVibrationTest()
}
