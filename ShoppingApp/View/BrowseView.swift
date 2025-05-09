//
//  BrowseView.swift
//  ShoppingApp
//
//  Created by Kuba Kromołowski on 09/05/2025.
//

import SwiftUI

struct BrowseView: View {
    @StateObject var browseViewModel = BrowseViewModel()
    
    var body: some View {
        if let products = browseViewModel.products {
            List {
                ForEach(products.items, id: \.productId) { product in
                    ProductView(description: product.description, price: product.price, image: product.image, favourite: product.isFavorite)
                        .frame(height: 250)
                }
            }
        } else {
            Text("Loading data")
                .onAppear {
                    browseViewModel.readJSONFromFile(JSONName: "items")
                }
        }
        MenuView()
    }
}

#Preview {
    BrowseView()
}
