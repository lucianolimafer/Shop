//
//  BrandsModel.swift
//  Shop
//
//  Created by Luciano Lima Ferreira on 22/05/24.
//

import SwiftUI

struct BrandsModel: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var icon: String
}

var sampleBrandsMock: [BrandsModel] = [
    .init(title: "Todos", icon: ""),
    .init(title: "Porsche", icon: "porsche-icon"),
    .init(title: "Mercedes", icon: "mercedes-icon"),
    .init(title: "BMW", icon: "bmw-icon"),
    .init(title: "Tesla", icon: "tesla-icon")
]
