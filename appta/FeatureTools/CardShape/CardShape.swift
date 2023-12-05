//
//  CardShape.swift
//  appta
//
//  Created by Assylzhan Tati on 10/7/23.
//

import SwiftUI

struct CardShape: Shape {
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: 15, height: 15)
        )
        return Path(path.cgPath)
    }
}

