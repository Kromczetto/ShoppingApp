//
//  PoductData.swift
//  ShoppingApp
//
//  Created by Kuba Kromołowski on 09/05/2025.
//

import SwiftUI
struct Promotion: Codable {
    let type: String
    let value: String
}

struct ProductData: Codable {
    let productId: String
    let description: String
    let price: String
    let promotions: [Promotion]?
    let isFavorite: Bool
    let inStock: Int
    let image: String
}

struct Products: Codable {
    let items: [ProductData]
}
