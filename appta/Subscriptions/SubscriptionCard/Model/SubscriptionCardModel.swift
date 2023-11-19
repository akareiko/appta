//
//  SubscriptionCardModel.swift
//  appta
//
//  Created by Assylzhan Tati on 10/6/23.
//

import SwiftUI

struct SubscriptionCardModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var image: String
    var color: String
    var frontimage: String
    var pattern: String
    var text1: String
    var text2: String
}

var SubscriptionCards: [SubscriptionCardModel] = [
    .init(image: "starbucks-logo", color: "starbucks-green", frontimage: "starbucks-logo-enlarged", pattern: "subscriptioncard-pattern01", text1: "Discover the joy of a fresh cup of coffee delivered to your doorstep every week. With our coffee subscription, you'll enjoy: ", text2: "Ready to experience exceptional coffee moments?"),
    .init(image: "timhortons-logo", color: "timhortons-red", frontimage: "timhortons-logo-enlarged", pattern: "subscriptioncard-pattern02", text1: "Elevate your coffee game with our weekly coffee subscription service. Delight in the convenience of a fresh, handpicked blend arriving at your doorstep regularly.", text2: "Get ready to savor every sip and make each coffee moment extraordinary."),
    .init(image: "costacoffee-logo", color: "costacoffee-purple", frontimage: "costacoffee-logo-enlarged", pattern: "subscriptioncard-pattern01", text1: "Embrace the art of coffee with our subscription service. Imagine the anticipation as you await your weekly coffee delivery, knowing that a world of flavors and aromas is just a brew away.", text2: "Join us in redefining your coffee experience."),
    .init(image: "pretamanger-logo", color: "pretamanger-red", frontimage: "pretamanger-logo-enlarged", pattern: "subscriptioncard-pattern03", text1: "Reimagine your mornings with our coffee subscription. Let the excitement build as you anticipate the arrival.", text2: "Dive into the world of exceptional coffee, one cup at a time."),
    .init(image: "coffeeday-logo", color: "coffeeday-green", frontimage: "coffeeday-logo-enlarged", pattern: "subscriptioncard-pattern01", text1: "Discover the secret to consistently great coffee with our subscription. Say goodbye to the hassle of running out of beans and hello to the pleasure of a fresh batch on your doorstep each week.", text2: "Elevate your coffee ritual and relish the goodness in every cup."),
    .init(image: "", color: "silver", frontimage: "", pattern: "subscriptioncard-pattern01", text1: "Add a new subscription card of your favourite coffee shops", text2: "Elevate your coffee ritual and relish the goodness in every cup."),
]

