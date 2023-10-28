//
//  PINView.swift
//  appta
//
//  Created by Assylzhan Tati on 10/22/23.
//

import SwiftUI

struct PINView: View {
    var body: some View {
        LockView(lockType: .both, lockPin: "0328", isEnabled: true){
            VStack(spacing: 15){
                Image(systemName: "globe")
                    .imageScale(.large)
                
                
                
            }
        }
    }
}

#Preview {
    PINView()
}
