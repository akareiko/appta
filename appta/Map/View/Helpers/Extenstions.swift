//
//  Extenstions.swift
//  appta
//
//  Created by Assylzhan Tati on 10/2/23.
//

import SwiftUI

// MARK: Custom View Extension
// MARK: Custom Bottom Sheet Extracting From Native SwiftUI

extension View {
    @ViewBuilder
    func bottomSheet<Content: View>(
        presentationDetents: Set<PresentationDetent>,
        isPresented: Binding<Bool>,
        dragIndicator: Visibility = .visible,
        sheetCornerRadius: CGFloat?,
        largestUndimmedIdentifier: UISheetPresentationController.Detent.Identifier = .large,
        isTransparentBG: Bool = false,
        interactiveDisabled: Bool = true,
        @ViewBuilder content: @escaping ()->Content,
        onDismiss: @escaping ()->()
    )->some View{
        self
            .sheet(isPresented: isPresented){
                onDismiss()
            } content: {
                content()
                    .presentationDetents(presentationDetents)
                    .presentationDragIndicator(dragIndicator)
                    .interactiveDismissDisabled(interactiveDisabled)
                    .onAppear{
                        // MARK: Custom Code For Bottom Sheet
                        // Finding the Presented View Controller
                        guard let windows = UIApplication.shared.connectedScenes.first as?
                            UIWindowScene else{
                            return
                        }
                        
                        if let controller =
                            windows.windows.first?.rootViewController?.presentedViewController, let sheet = controller.presentationController as? UISheetPresentationController{
                            
                            // FOR TRANSPERANT BACKGROUND
                            
                            if isTransparentBG{
                                controller.view.backgroundColor = .clear
                            }
                            
                            // FROM THIS EXTRACTING PRESENTATION CONTROLLER
                            // SOME TIMES BUTTONS AND ACTIONS WILL BE TINTED IN HIDDEN FORM
                            // TO AVOID THIS
                            
                            controller.presentingViewController?.view.tintAdjustmentMode = .normal
                            
                            // MARK: As Usual Set Properties What Ever Your Wish Here With Sheet Contoller
                            sheet.largestUndimmedDetentIdentifier = largestUndimmedIdentifier
                            sheet.preferredCornerRadius = sheetCornerRadius
                        } else {
                            print("NO CONTROLLER FOUND")
                        }
                    }
                
            }
            
    }
}
