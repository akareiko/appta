import SwiftUI

struct PageIntro2: Identifiable, Hashable {
    var id: UUID = .init()
    var introAssetImage: String
    var title: String
    var subTitle: String
    var displaysAction: Bool = false
}

var pageIntros2: [PageIntro2] = [
    .init(introAssetImage: "Page 1", title: "Starbucks", subTitle: "Starbucks"),
    .init(introAssetImage: "Page 2", title: "Starbucks", subTitle: "Starbucks"),
    .init(introAssetImage: "Page 3", title: "Starbucks", subTitle: "Starbucks", displaysAction: true),
]
