import SwiftUI

struct PageIntro: Identifiable, Equatable {
    static func == (lhs: PageIntro, rhs: PageIntro) -> Bool {
        return lhs.id == rhs.id &&
               lhs.title == rhs.title &&
               lhs.subTitle == rhs.subTitle &&
               lhs.displaysAction1 == rhs.displaysAction1 &&
               lhs.displaysAction2 == rhs.displaysAction2
    }
    
    var id: UUID = .init()
    var introBlock: AnyView
    var title: String
    var subTitle: String
    var displaysAction1: Bool = false
    var displaysAction2: Bool = false
}

var pageIntros: [PageIntro] = [
    .init(introBlock: AnyView(BeforePlansView()), title: "Welcome to Appta!", subTitle: "Thank you for choosing us, we can make your daily life experience better!"),
    .init(introBlock: AnyView(PlansView(planplan: ModelModelData().plansplans[0])), title: "Get More,\nSpend Less!", subTitle: "Get more coffee in more than 150 Coffee Shops by our subscription!")
]
