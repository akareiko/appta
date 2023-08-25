//
//  SubscriptionView.swift
//  appta
//
//  Created by Legato on 23.08.2023.
//

import SwiftUI

struct SubscriptionView: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Subscriptions")
                .font(
                    .custom("Helvetica", fixedSize: 34))
                .padding(.leading, 20)
            List {
                Text("haha")
                Text("haha")
                Text("haha")
            }
        }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}
