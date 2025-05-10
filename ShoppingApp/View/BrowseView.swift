//
//  BrowseView.swift
//  ShoppingApp
//
//  Created by Kuba Kromołowski on 09/05/2025.
//

import SwiftUI

struct BrowseView: View {
    @EnvironmentObject var browseViewModel: BrowseViewModel
    @EnvironmentObject var checkoutViewModel: CheckoutViewModel
    
    var body: some View {
        if let products = browseViewModel.products {
            List {
                ForEach(products.items, id: \.productId) { product in
                    ProductView(id: product.productId, description: product.description,
                                price: product.price, image: product.image,
                                favourite: product.isFavorite,
                                amount: checkoutViewModel.card[product.productId] ?? 0)
                        .frame(height: 250)
                        .environmentObject(checkoutViewModel)
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
