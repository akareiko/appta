////
////  CustomPopUpViewModifier.swift
////  appta
////
////  Created by Assylzhan Tati on 1/22/24.
////
//
//import Foundation
//import SwiftUI
//
//struct CustomPopUpViewModifier: ViewModifier {
//    
//    @ObservedObject var customSheetManager: CustomSheetManager
//    
//    func body(content: Content) -> some View {
//        content
//            .overlay(alignment: .bottom){
//                if case let .present(config) = customSheetManager.action {
//                    CustomPopUpSheet(config: config){
//                        withAnimation{
//                            customSheetManager.dismiss()
//                        }
//                    }
//                     
//                }
//            }
//            .ignoresSafeArea()
//    }
//}
//
//extension View {
//    func popup(with sheetManager: CustomSheetManager) -> some View {
//        self.modifier(CustomPopUpViewModifier(customSheetManager: sheetManager))
//    }
//}
