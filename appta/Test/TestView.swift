//
//  ContentView.swift
//  CustomSheetInSwiftUI
//
//  Created by Tunde Adegoroye on 21/03/2022.
//

import SwiftUI

struct TestView: View {
        
    @EnvironmentObject var sheetManager: SheetManager
    @State private var celsius: Double = 0

    var body: some View {
        ZStack {
            Color
                .mint
                .ignoresSafeArea()

            VStack {
                
                Button("Show Custom Sheet") {
                    withAnimation(.spring()) {
                          sheetManager.present(with: .init(systemName: "info",
                                                           title: "Text Here",
                                                           content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Viverra vitae congue eu consequat ac. Amet mauris commodo quis imperdiet massa. Quis varius quam quisque id diam. Vitae proin sagittis nisl rhoncus mattis rhoncus urna. "))
                   }
                }
                
                Button("Show Custom Sheet 2") {
                    withAnimation(.spring()) {
                          sheetManager.present(with: .init(systemName: "info",
                                                           title: "Another example",
                                                           content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Viverra vitae congue eu consequat ac. Amet mauris commodo quis imperdiet massa. Quis varius quam quisque id diam. Vitae proin sagittis nisl rhoncus mattis rhoncus urna. "))
                   }
                }
                Slider(value: $celsius, in: -100...100)
            }
        }
        .popup(with: sheetManager)
        .ignoresSafeArea()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .environmentObject(SheetManager())
    }
}
