//
//  Home.swift
//  appta
//
//  Created by Assylzhan Tati on 9/24/23.
//

import SwiftUI

struct IntroView: View {
    @State private var activeIntro: PageIntro = pageIntros[0]
    var body: some View {
        GeometryReader{
            let size = $0.size
            IntroView(intro: $activeIntro, size: size)
        }
    }
}

struct IntroView: View {
    @Binding var intro: PageIntro
    var size: CGSize
    
    var body: some View {
        VStack{
            // Image View
            GeometryReader {
                let size = $0.size
                
                Image(intro.introAssetImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.width, height: size.height)
            }
        }
    }
}

#Preview {
    IntroView()
}
