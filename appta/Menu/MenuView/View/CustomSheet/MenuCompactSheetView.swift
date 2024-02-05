////
////  CompactSheetView.swift
////  appta
////
////  Created by Assylzhan Tati on 1/21/24.
////
//
//import SwiftUI
//
//struct MenuCompactSheetView: View {
//    @StateObject var customSheetManager = CustomSheetManager()
//    
//    var body: some View {
//        ZStack{
//            Button {
//                withAnimation(.smooth){
//                    customSheetManager.present(with: .init(systemName: "info", title: "Text Here", content: "Herro everynyan i wish i were a bird"))
//                }
//            } label: {
//                Text("Pop up view")
//                    .font(.callout.bold())
//                    .foregroundColor(.white)
//                    .padding(.init(top: 10, leading: 15, bottom: 10, trailing: 15))
//                    .background(.black)
//                    .cornerRadius(20)
//            }
//            .offset(CGSize(width: 0, height: 300))
//        }
//        .popup(with: customSheetManager)
//    }
//}
//
//#Preview {
//    MenuCompactSheetView()
//}
