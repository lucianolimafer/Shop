//
//  CarsModel.swift
//  Shop
//
//  Created by Luciano Lima Ferreira on 22/05/24.
//

import SwiftUI

struct CarsModel: Identifiable, Hashable {
    var id: String
    var title: String
    var brand: String
    var description: String
    var images: [String]
    var reviews: [ReviewModel]
    var price: Int
}

struct ReviewModel: Identifiable, Hashable {
    var id: String
    var userName: String
    var image: String
    var review: String
    var rating: Double
}

//MARK: mocks

var sampleCarsMock: [CarsModel] = [
    .init(
        id: "abc",
        title: "Model S",
        brand: "Tesla",
        description: "Desde o revestimento do radiador iluminado até a traseira elegante e dinâmica, com detalhes de iluminação fascinantes: o novo Classe E Sedan possui um design inspirador e avança em uma dinâmica inovadora com elementos de design progressivos.",
        images: [
            "https://platform.cstatic-images.com/xlarge/in/v2/stock_photos/b0a52b41-0262-44c8-b790-c45233f8de84/68b9f3f7-ca9c-4e7d-8c76-8403d766fb4a.png",
            "https://platform.cstatic-images.com/xlarge/in/v2/stock_photos/b0a52b41-0262-44c8-b790-c45233f8de84/bea82c18-b839-4bfb-a135-a2a44cc3a79a.png"
        ],
        reviews: [sampleReview],
        price: 100000
    )
]

var sampleReview: ReviewModel = .init(
    id: "1",
    userName: "Elon Musk",
    image: "https://www.psd.org.br/wp-content/uploads/2014/08/Og-Pozzoli.jpg",
    review: "Esse eu também tenho.",
    rating: 4.3
)
