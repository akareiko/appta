//
//  InfiniteCarouselModel.swift
//  Features
//
//  Created by Assylzhan Tati on 11/6/23.
//

import SwiftUI

struct InfiniteCarouselModel: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var image: String
}

var carousel: [InfiniteCarouselModel] = [
    .init(title: "Starbucks", subTitle: "The Best Coffee In The World", image: "starbucks-poster01"),
    .init(title: "Starbucks", subTitle: "The Best Coffee In The World", image: "starbucks-poster02"),
    .init(title: "Starbucks", subTitle: "The Best Coffee In The World", image: "starbucks-poster03"),
    .init(title: "Starbucks", subTitle: "The Best Coffee In The World", image: "starbucks-poster04"),
    .init(title: "Starbucks", subTitle: "The Best Coffee In The World", image: "starbucks-poster05"),
    .init(title: "Starbucks", subTitle: "The Best Coffee In The World", image: "starbucks-poster06")
]


