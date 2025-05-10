//
//  CheckoutView.swift
//  ShoppingApp
//
//  Created by Kuba Kromołowski on 09/05/2025.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var browseViewModel: BrowseViewModel
    @EnvironmentObject var checkoutViewModel: CheckoutViewModel
    
    var body: some View {
        if let products = browseViewModel.products {
            List {
                ForEach(products.items, id: \.productId) { product in
                    if checkoutViewModel.card[product.productId] != nil {
                        ProductView(id: product.productId, description: product.description,
                                    price: product.price, image: product.image,
                                    favourite: product.isFavorite,
                                    amount: checkoutViewModel.card[product.productId]!)
                            .frame(height: 250)
                            .environmentObject(checkoutViewModel)
                    }
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
    CheckoutView()
}
