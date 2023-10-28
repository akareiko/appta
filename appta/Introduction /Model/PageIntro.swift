//
//  PageIntro.swift
//  appta
//
//  Created by Assylzhan Tati on 9/24/23.
//

import SwiftUI

// Page Intro Model

struct PageIntro: Identifiable, Hashable {
    var id: UUID = .init()
    var introAssetImage: String
    var title: String
    var subTitle: String
    var displaysAction1: Bool = false
    var displaysAction2: Bool = false
}

var pageIntros: [PageIntro] = [
    .init(introAssetImage: "Page 1", title: "Welcome to Appta!", subTitle: "Thank you for choosing us, we can make your daily life experience better!"),
    .init(introAssetImage: "Page 2", title: "Get More,\nSpend Less!", subTitle: "Get more coffee in more than 150 Coffee Shops by our subscription!"),
    .init(introAssetImage: "Page 3", title: "Let's\nGet Started", subTitle: "To register to your account, kindly enter your details", displaysAction1: true),
    .init(introAssetImage: "Page 4", title: "Can I Have\nYour Number?", subTitle: "Please write down your phone number. Click the 'Send' button and enter received code for verification")
]
