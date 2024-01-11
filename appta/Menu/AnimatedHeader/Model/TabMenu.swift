//
//  Tab.swift
//  ImageViewer
//
//  Created by Assylzhan Tati on 12/15/23.
//

import SwiftUI

//struct Food: Identifiable {
//    var id = UUID().uuidString
//    var title: String
//    var price: String
//    var image: String
//}
//
//var foods = [
//    Food(title: "Americano", price: "600", image: "starbucks-americano"),
//    Food(title: "Cappucino", price: "900", image: "starbucks-cappucino"),
//    Food(title: "Latte", price: "1100", image: "starbucks-latte"),
//    Food(title: "Coldbrew", price: "1000", image: "starbucks-cold-brew"),
//    Food(title: "Raf", price: "1200", image: "starbucks-raf"),
//    Food(title: "Caramel Ribbon Crunch Frappucino", price: "1500", image: "starbucks-caramel-ribbon-crunch-frappuccino"),
//    Food(title: "Cinnamon Latte", price: "1600", image: "starbucks-cinnamon-latte"),
//    Food(title: "Iced Pumpkin Spice Latte", price: "1500", image: "starbucks-iced-pumpkin-spice-latte"),
//    Food(title: "Mocha Cookie Crumble Frappucino", price: "1400", image: "starbucks-mocha-cookie-crumble-frappuccino"),
//    Food(title: "Pumpkin Spice Cream Cold Brew", price: "1300", image: "starbucks-pumpkin-spice-cream-cold-brew"),
//    Food(title: "Pumpkin Spice Latte", price: "1600", image: "starbucks-pumpkin-spice-latte"),
//    Food(title: "White Chocolate Mocha Frappucino", price: "1800", image: "starbucks-white-chocolate-mocha-frappuccino"),
//]

//// Tab Model...
//struct TabMenu: Identifiable {
//    var id = UUID().uuidString
//    var tab: String
//    var foods: [Food]
//}

// Tab Items...
//var tabsItems = [
//    TabMenu(tab: "Home Style", foods: foods.shuffled()),
//    TabMenu(tab: "Promotions", foods: foods.shuffled()),
//    TabMenu(tab: "Black Coffee", foods: foods.shuffled()),
//    TabMenu(tab: "White Coffee", foods: foods.shuffled()),
//    TabMenu(tab: "Cold Drinks", foods: foods.shuffled()),
//    TabMenu(tab: "Matcha", foods: foods.shuffled()),
//    TabMenu(tab: "Signature Drinks", foods: foods.shuffled()),
//    TabMenu(tab: "Tea", foods: foods.shuffled()),
//    TabMenu(tab: "Hot Chocolate", foods: foods.shuffled()),
//    TabMenu(tab: "Add Ons", foods: foods.shuffled()),
//]

// DrinkModel to represent each drink with its details.
struct DrinkModel: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var index: Int
    var image: String
    var title: String
    var description: String
    var prices: [Int]  // Prices for grande, tall, and venti
//    var nutrition: NutritionModel
    var drinkSize: [Int]  // Size : Price
}


struct TabMenu: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var tab: String
    var drinkList: [DrinkModel]
}

var drinksmenu: [TabMenu] = [
    .init(tab: "Home Style",
          drinkList: [
            .init(index: 0, image: "Caramel-Brule-Latte", title: "Caramel Brule Latte", description: "The Caramel-Brulé Latte is a luxurious coffee drink blending rich espresso with creamy milk, topped with a layer of frothy foam and a drizzle of caramel sauce, torched to create a caramelized topping reminiscent of crème brûlée. It's a perfect blend of bitter espresso and sweet, crunchy caramel, ideal for those who enjoy a sophisticated, dessert-like coffee experience.", prices: [1200, 1400, 1600], drinkSize: [300, 400, 500]),
            .init(index: 1, image: "Chestnut-Praline-Latte", title: "Chestnut Praline Latte", description: "The Chestnut-Praline Latte is a warm, nutty coffee beverage that combines the rich flavors of espresso and steamed milk with the sweet, toasty notes of chestnut and praline. Topped with whipped cream and a sprinkle of spiced praline crumbs, this latte offers a cozy, comforting taste with every sip, making it a festive favorite during the cooler months.", prices: [1300, 1500, 1700],  drinkSize: [300, 400, 500]),
            .init(index: 2, image: "Eggnog-Latte", title: "Eggnog Latte", description: "The Eggnog Latte is a festive holiday beverage blending rich espresso with creamy, spiced eggnog and a touch of milk. Topped with a sprinkle of nutmeg, this latte offers a warm, comforting taste, combining the boldness of coffee with the classic flavors of traditional eggnog. It's a perfect treat for savoring the holiday spirit.", prices: [1400, 1600, 1800], drinkSize: [300, 400, 500]),
            .init(index: 3, image: "Gingerbread-Latte-1", title: "Gingerbread Latte", description: "The Gingerbread Latte is a cozy, spiced beverage that combines the robust flavors of espresso with the warm, sweet notes of gingerbread. Steamed milk is infused with ginger, cinnamon, and nutmeg, creating a comforting blend reminiscent of freshly baked gingerbread cookies. Topped with whipped cream and a sprinkle of spices, this latte is a delightful treat that captures the essence of the holiday season.", prices: [1500, 1700, 1900], drinkSize: [300, 400, 500]),
            .init(index: 4, image: "Irish-Cream-Americano-", title: "Irish Cream Americano", description: "The Irish Cream Americano is a smooth, spirited coffee drink that marries the boldness of Americano (espresso diluted with hot water) with the creamy, vanilla and whiskey flavors of Irish Cream. This beverage offers a balance of rich coffee bitterness and the sweet, slightly boozy notes of the Irish Cream, making it a sophisticated choice for those who enjoy a touch of indulgence in their coffee routine.", prices: [1100, 1300, 1500], drinkSize: [300, 400, 500]),
            .init(index: 5, image: "Irish-Cream-Cold-Brew", title: "Irish Cream Cold Brew", description: "The Irish Cream Cold Brew is a refreshing and indulgent coffee drink that combines the smooth, rich taste of cold brew coffee with the sweet, creamy flavors of Irish Cream. This beverage is known for its silky texture and a perfect balance of coffee's natural bitterness with the whiskey, vanilla, and cream notes of the Irish Cream. Served over ice, it's a delightful pick-me-up that's especially popular for its cool, invigorating experience.", prices: [1000, 1200, 1400], drinkSize: [300, 400, 500]),
            .init(index: 6, image: "Peppermint-Mocha", title: "Peppermint Mocha", description: "The Peppermint Mocha is a festive and flavorful coffee drink that combines the rich, deep taste of chocolate mocha with the refreshing zing of peppermint. This delightful beverage is made with espresso, steamed milk, and the addition of chocolate syrup and peppermint flavoring. Topped with whipped cream and a sprinkle of crushed peppermint candies or a drizzle of chocolate syrup, it's a holiday favorite that offers a perfect balance of warmth, sweetness, and a minty kick.", prices: [1000, 1250, 1500], drinkSize: [300, 400, 500])].shuffled()),
    
        .init(tab: "Black Coffee",
              drinkList: [
                .init(index: 0, image: "Caramel-Brule-Latte", title: "Caramel Brule Latte", description: "The Caramel-Brulé Latte is a luxurious coffee drink blending rich espresso with creamy milk, topped with a layer of frothy foam and a drizzle of caramel sauce, torched to create a caramelized topping reminiscent of crème brûlée. It's a perfect blend of bitter espresso and sweet, crunchy caramel, ideal for those who enjoy a sophisticated, dessert-like coffee experience.", prices: [1200, 1400, 1600], drinkSize: [300, 400, 500]),
                .init(index: 1, image: "Chestnut-Praline-Latte", title: "Chestnut Praline Latte", description: "The Chestnut-Praline Latte is a warm, nutty coffee beverage that combines the rich flavors of espresso and steamed milk with the sweet, toasty notes of chestnut and praline. Topped with whipped cream and a sprinkle of spiced praline crumbs, this latte offers a cozy, comforting taste with every sip, making it a festive favorite during the cooler months.", prices: [1300, 1500, 1700],  drinkSize: [300, 400, 500]),
                .init(index: 2, image: "Eggnog-Latte", title: "Eggnog Latte", description: "The Eggnog Latte is a festive holiday beverage blending rich espresso with creamy, spiced eggnog and a touch of milk. Topped with a sprinkle of nutmeg, this latte offers a warm, comforting taste, combining the boldness of coffee with the classic flavors of traditional eggnog. It's a perfect treat for savoring the holiday spirit.", prices: [1400, 1600, 1800], drinkSize: [300, 400, 500]),
                .init(index: 3, image: "Gingerbread-Latte-1", title: "Gingerbread Latte", description: "The Gingerbread Latte is a cozy, spiced beverage that combines the robust flavors of espresso with the warm, sweet notes of gingerbread. Steamed milk is infused with ginger, cinnamon, and nutmeg, creating a comforting blend reminiscent of freshly baked gingerbread cookies. Topped with whipped cream and a sprinkle of spices, this latte is a delightful treat that captures the essence of the holiday season.", prices: [1500, 1700, 1900], drinkSize: [300, 400, 500]),
                .init(index: 4, image: "Irish-Cream-Americano-", title: "Irish Cream Americano", description: "The Irish Cream Americano is a smooth, spirited coffee drink that marries the boldness of Americano (espresso diluted with hot water) with the creamy, vanilla and whiskey flavors of Irish Cream. This beverage offers a balance of rich coffee bitterness and the sweet, slightly boozy notes of the Irish Cream, making it a sophisticated choice for those who enjoy a touch of indulgence in their coffee routine.", prices: [1100, 1300, 1500], drinkSize: [300, 400, 500]),
                .init(index: 5, image: "Irish-Cream-Cold-Brew", title: "Irish Cream Cold Brew", description: "The Irish Cream Cold Brew is a refreshing and indulgent coffee drink that combines the smooth, rich taste of cold brew coffee with the sweet, creamy flavors of Irish Cream. This beverage is known for its silky texture and a perfect balance of coffee's natural bitterness with the whiskey, vanilla, and cream notes of the Irish Cream. Served over ice, it's a delightful pick-me-up that's especially popular for its cool, invigorating experience.", prices: [1000, 1200, 1400], drinkSize: [300, 400, 500]),
                .init(index: 6, image: "Peppermint-Mocha", title: "Peppermint Mocha", description: "The Peppermint Mocha is a festive and flavorful coffee drink that combines the rich, deep taste of chocolate mocha with the refreshing zing of peppermint. This delightful beverage is made with espresso, steamed milk, and the addition of chocolate syrup and peppermint flavoring. Topped with whipped cream and a sprinkle of crushed peppermint candies or a drizzle of chocolate syrup, it's a holiday favorite that offers a perfect balance of warmth, sweetness, and a minty kick.", prices: [1000, 1250, 1500], drinkSize: [300, 400, 500])].shuffled()),
    
        .init(tab: "Cold Drinks",
              drinkList: [
                .init(index: 0, image: "Caramel-Brule-Latte", title: "Caramel Brule Latte", description: "The Caramel-Brulé Latte is a luxurious coffee drink blending rich espresso with creamy milk, topped with a layer of frothy foam and a drizzle of caramel sauce, torched to create a caramelized topping reminiscent of crème brûlée. It's a perfect blend of bitter espresso and sweet, crunchy caramel, ideal for those who enjoy a sophisticated, dessert-like coffee experience.", prices: [1200, 1400, 1600], drinkSize: [300, 400, 500]),
                .init(index: 1, image: "Chestnut-Praline-Latte", title: "Chestnut Praline Latte", description: "The Chestnut-Praline Latte is a warm, nutty coffee beverage that combines the rich flavors of espresso and steamed milk with the sweet, toasty notes of chestnut and praline. Topped with whipped cream and a sprinkle of spiced praline crumbs, this latte offers a cozy, comforting taste with every sip, making it a festive favorite during the cooler months.", prices: [1300, 1500, 1700],  drinkSize: [300, 400, 500]),
                .init(index: 2, image: "Eggnog-Latte", title: "Eggnog Latte", description: "The Eggnog Latte is a festive holiday beverage blending rich espresso with creamy, spiced eggnog and a touch of milk. Topped with a sprinkle of nutmeg, this latte offers a warm, comforting taste, combining the boldness of coffee with the classic flavors of traditional eggnog. It's a perfect treat for savoring the holiday spirit.", prices: [1400, 1600, 1800], drinkSize: [300, 400, 500]),
                .init(index: 3, image: "Gingerbread-Latte-1", title: "Gingerbread Latte", description: "The Gingerbread Latte is a cozy, spiced beverage that combines the robust flavors of espresso with the warm, sweet notes of gingerbread. Steamed milk is infused with ginger, cinnamon, and nutmeg, creating a comforting blend reminiscent of freshly baked gingerbread cookies. Topped with whipped cream and a sprinkle of spices, this latte is a delightful treat that captures the essence of the holiday season.", prices: [1500, 1700, 1900], drinkSize: [300, 400, 500]),
                .init(index: 4, image: "Irish-Cream-Americano-", title: "Irish Cream Americano", description: "The Irish Cream Americano is a smooth, spirited coffee drink that marries the boldness of Americano (espresso diluted with hot water) with the creamy, vanilla and whiskey flavors of Irish Cream. This beverage offers a balance of rich coffee bitterness and the sweet, slightly boozy notes of the Irish Cream, making it a sophisticated choice for those who enjoy a touch of indulgence in their coffee routine.", prices: [1100, 1300, 1500], drinkSize: [300, 400, 500]),
                .init(index: 5, image: "Irish-Cream-Cold-Brew", title: "Irish Cream Cold Brew", description: "The Irish Cream Cold Brew is a refreshing and indulgent coffee drink that combines the smooth, rich taste of cold brew coffee with the sweet, creamy flavors of Irish Cream. This beverage is known for its silky texture and a perfect balance of coffee's natural bitterness with the whiskey, vanilla, and cream notes of the Irish Cream. Served over ice, it's a delightful pick-me-up that's especially popular for its cool, invigorating experience.", prices: [1000, 1200, 1400], drinkSize: [300, 400, 500]),
                .init(index: 6, image: "Peppermint-Mocha", title: "Peppermint Mocha", description: "The Peppermint Mocha is a festive and flavorful coffee drink that combines the rich, deep taste of chocolate mocha with the refreshing zing of peppermint. This delightful beverage is made with espresso, steamed milk, and the addition of chocolate syrup and peppermint flavoring. Topped with whipped cream and a sprinkle of crushed peppermint candies or a drizzle of chocolate syrup, it's a holiday favorite that offers a perfect balance of warmth, sweetness, and a minty kick.", prices: [1000, 1250, 1500], drinkSize: [300, 400, 500])].shuffled()),
    
        .init(tab: "Signature Drinks",
              drinkList: [
                .init(index: 0, image: "Caramel-Brule-Latte", title: "Caramel Brule Latte", description: "The Caramel-Brulé Latte is a luxurious coffee drink blending rich espresso with creamy milk, topped with a layer of frothy foam and a drizzle of caramel sauce, torched to create a caramelized topping reminiscent of crème brûlée. It's a perfect blend of bitter espresso and sweet, crunchy caramel, ideal for those who enjoy a sophisticated, dessert-like coffee experience.", prices: [1200, 1400, 1600], drinkSize: [300, 400, 500]),
                .init(index: 1, image: "Chestnut-Praline-Latte", title: "Chestnut Praline Latte", description: "The Chestnut-Praline Latte is a warm, nutty coffee beverage that combines the rich flavors of espresso and steamed milk with the sweet, toasty notes of chestnut and praline. Topped with whipped cream and a sprinkle of spiced praline crumbs, this latte offers a cozy, comforting taste with every sip, making it a festive favorite during the cooler months.", prices: [1300, 1500, 1700],  drinkSize: [300, 400, 500]),
                .init(index: 2, image: "Eggnog-Latte", title: "Eggnog Latte", description: "The Eggnog Latte is a festive holiday beverage blending rich espresso with creamy, spiced eggnog and a touch of milk. Topped with a sprinkle of nutmeg, this latte offers a warm, comforting taste, combining the boldness of coffee with the classic flavors of traditional eggnog. It's a perfect treat for savoring the holiday spirit.", prices: [1400, 1600, 1800], drinkSize: [300, 400, 500]),
                .init(index: 3, image: "Gingerbread-Latte-1", title: "Gingerbread Latte", description: "The Gingerbread Latte is a cozy, spiced beverage that combines the robust flavors of espresso with the warm, sweet notes of gingerbread. Steamed milk is infused with ginger, cinnamon, and nutmeg, creating a comforting blend reminiscent of freshly baked gingerbread cookies. Topped with whipped cream and a sprinkle of spices, this latte is a delightful treat that captures the essence of the holiday season.", prices: [1500, 1700, 1900], drinkSize: [300, 400, 500]),
                .init(index: 4, image: "Irish-Cream-Americano-", title: "Irish Cream Americano", description: "The Irish Cream Americano is a smooth, spirited coffee drink that marries the boldness of Americano (espresso diluted with hot water) with the creamy, vanilla and whiskey flavors of Irish Cream. This beverage offers a balance of rich coffee bitterness and the sweet, slightly boozy notes of the Irish Cream, making it a sophisticated choice for those who enjoy a touch of indulgence in their coffee routine.", prices: [1100, 1300, 1500], drinkSize: [300, 400, 500]),
                .init(index: 5, image: "Irish-Cream-Cold-Brew", title: "Irish Cream Cold Brew", description: "The Irish Cream Cold Brew is a refreshing and indulgent coffee drink that combines the smooth, rich taste of cold brew coffee with the sweet, creamy flavors of Irish Cream. This beverage is known for its silky texture and a perfect balance of coffee's natural bitterness with the whiskey, vanilla, and cream notes of the Irish Cream. Served over ice, it's a delightful pick-me-up that's especially popular for its cool, invigorating experience.", prices: [1000, 1200, 1400], drinkSize: [300, 400, 500]),
                .init(index: 6, image: "Peppermint-Mocha", title: "Peppermint Mocha", description: "The Peppermint Mocha is a festive and flavorful coffee drink that combines the rich, deep taste of chocolate mocha with the refreshing zing of peppermint. This delightful beverage is made with espresso, steamed milk, and the addition of chocolate syrup and peppermint flavoring. Topped with whipped cream and a sprinkle of crushed peppermint candies or a drizzle of chocolate syrup, it's a holiday favorite that offers a perfect balance of warmth, sweetness, and a minty kick.", prices: [1000, 1250, 1500], drinkSize: [300, 400, 500])].shuffled()),
    
        .init(tab: "Adds On",
              drinkList: [
                .init(index: 0, image: "Caramel-Brule-Latte", title: "Caramel Brule Latte", description: "The Caramel-Brulé Latte is a luxurious coffee drink blending rich espresso with creamy milk, topped with a layer of frothy foam and a drizzle of caramel sauce, torched to create a caramelized topping reminiscent of crème brûlée. It's a perfect blend of bitter espresso and sweet, crunchy caramel, ideal for those who enjoy a sophisticated, dessert-like coffee experience.", prices: [1200, 1400, 1600], drinkSize: [300, 400, 500]),
                .init(index: 1, image: "Chestnut-Praline-Latte", title: "Chestnut Praline Latte", description: "The Chestnut-Praline Latte is a warm, nutty coffee beverage that combines the rich flavors of espresso and steamed milk with the sweet, toasty notes of chestnut and praline. Topped with whipped cream and a sprinkle of spiced praline crumbs, this latte offers a cozy, comforting taste with every sip, making it a festive favorite during the cooler months.", prices: [1300, 1500, 1700],  drinkSize: [300, 400, 500]),
                .init(index: 2, image: "Eggnog-Latte", title: "Eggnog Latte", description: "The Eggnog Latte is a festive holiday beverage blending rich espresso with creamy, spiced eggnog and a touch of milk. Topped with a sprinkle of nutmeg, this latte offers a warm, comforting taste, combining the boldness of coffee with the classic flavors of traditional eggnog. It's a perfect treat for savoring the holiday spirit.", prices: [1400, 1600, 1800], drinkSize: [300, 400, 500]),
                .init(index: 3, image: "Gingerbread-Latte-1", title: "Gingerbread Latte", description: "The Gingerbread Latte is a cozy, spiced beverage that combines the robust flavors of espresso with the warm, sweet notes of gingerbread. Steamed milk is infused with ginger, cinnamon, and nutmeg, creating a comforting blend reminiscent of freshly baked gingerbread cookies. Topped with whipped cream and a sprinkle of spices, this latte is a delightful treat that captures the essence of the holiday season.", prices: [1500, 1700, 1900], drinkSize: [300, 400, 500]),
                .init(index: 4, image: "Irish-Cream-Americano-", title: "Irish Cream Americano", description: "The Irish Cream Americano is a smooth, spirited coffee drink that marries the boldness of Americano (espresso diluted with hot water) with the creamy, vanilla and whiskey flavors of Irish Cream. This beverage offers a balance of rich coffee bitterness and the sweet, slightly boozy notes of the Irish Cream, making it a sophisticated choice for those who enjoy a touch of indulgence in their coffee routine.", prices: [1100, 1300, 1500], drinkSize: [300, 400, 500]),
                .init(index: 5, image: "Irish-Cream-Cold-Brew", title: "Irish Cream Cold Brew", description: "The Irish Cream Cold Brew is a refreshing and indulgent coffee drink that combines the smooth, rich taste of cold brew coffee with the sweet, creamy flavors of Irish Cream. This beverage is known for its silky texture and a perfect balance of coffee's natural bitterness with the whiskey, vanilla, and cream notes of the Irish Cream. Served over ice, it's a delightful pick-me-up that's especially popular for its cool, invigorating experience.", prices: [1000, 1200, 1400], drinkSize: [300, 400, 500]),
                .init(index: 6, image: "Peppermint-Mocha", title: "Peppermint Mocha", description: "The Peppermint Mocha is a festive and flavorful coffee drink that combines the rich, deep taste of chocolate mocha with the refreshing zing of peppermint. This delightful beverage is made with espresso, steamed milk, and the addition of chocolate syrup and peppermint flavoring. Topped with whipped cream and a sprinkle of crushed peppermint candies or a drizzle of chocolate syrup, it's a holiday favorite that offers a perfect balance of warmth, sweetness, and a minty kick.", prices: [1000, 1250, 1500], drinkSize: [300, 400, 500])].shuffled())
]

struct NutritionModel: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var index: Int
    var calories: Int
    var portionSize: [Int]
    var caffeine: Int
    var sugar: Int
    var protein: Int
    var fat: Int
}

var nutritionmodel: [NutritionModel] = [
    .init(index: 0, calories: 1400, portionSize: [300, 400, 500], caffeine: 5, sugar: 20, protein: 4, fat: 100),
    .init(index: 2, calories: 1500, portionSize: [300, 400, 500], caffeine: 2, sugar: 40, protein: 5, fat: 250),
    .init(index: 3, calories: 1600, portionSize: [300, 400, 500], caffeine: 3, sugar: 20, protein: 2, fat: 120),
    .init(index: 4, calories: 1200, portionSize: [300, 400, 500], caffeine: 6, sugar: 25, protein: 1, fat: 180),
    .init(index: 5, calories: 1100, portionSize: [300, 400, 500], caffeine: 2, sugar: 34, protein: 2, fat: 250),
    .init(index: 6, calories: 1400, portionSize: [300, 400, 500], caffeine: 8, sugar: 18, protein: 3, fat: 250),
]
