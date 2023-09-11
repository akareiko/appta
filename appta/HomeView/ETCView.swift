//
//  ETCView.swift
//  appta
//
//  Created by Legato on 11.09.2023.
//

import SwiftUI

struct ETCView: View {
    var body: some View {
            VStack {
                AVPlayerView(url: Bundle.main.url(forResource: "hehehe", withExtension: "mp4")!)
                    .frame(height: 1500)
                    .navigationBarTitle("Video Player", displayMode: .inline)
            }
        }
}

struct ETCView_Previews: PreviewProvider {
    static var previews: some View {
        ETCView()
    }
}
