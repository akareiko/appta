import SwiftUI

struct PageIntro: Identifiable, Equatable {
    static func == (lhs: PageIntro, rhs: PageIntro) -> Bool {
        return lhs.id == rhs.id &&
               lhs.title == rhs.title &&
               lhs.subTitle == rhs.subTitle &&
               lhs.displaysAction == rhs.displaysAction
    }
    
    var id: UUID = .init()
    var introBlock: Int
    var title: String
    var subTitle: String
    var icon: String
    var displaysAction: Bool = false
}


//var pageIntros: [PageIntro] = [
//    .init(introBlock: AnyView(BeforePlansView(myModel: MyModel()).environmentObject(GlobalWars())), title: "Step One", subTitle: "Choose Your CoffeeShop  ", icon: "mug.fill"),
//    .init(introBlock: AnyView(PlansView(planplans: ModelModelData().plansplans).environmentObject(GlobalWars())), title: "Step Two", subTitle: "Choose your plan  ", icon: "plus.rectangle", displaysAction: true)
//]

var pageIntros: [PageIntro] = [
    .init(introBlock: 1, title: "Step One", subTitle: "Choose Your CoffeeShop  ", icon: "mug.fill"),
    .init(introBlock: 2, title: "Step Two", subTitle: "Choose Your Plan  ", icon: "plus.rectangle"),
    .init(introBlock: 3, title: "Step Three", subTitle: "Choose Payment Method  ", icon: "creditcard.fill"),
    .init(introBlock: 4, title: "Proceed With Payment", subTitle: "Agree?  ", icon: "dollarsign", displaysAction: true)
]
