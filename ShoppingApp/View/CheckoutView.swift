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
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        if let products = browseViewModel.products {
            List {
                ForEach(products.items, id: \.productId) { product in
                    if checkoutViewModel.card[product.productId] != nil {
                        ProductView(id: product.productId, description: product.description,
                                    price: product.price, image: product.image,
                                    favourite: product.isFavorite,
                                    amount: checkoutViewModel.card[product.productId] ?? 0)
                            .frame(height: 250)
                            .environmentObject(checkoutViewModel)
                    }
                }
            }
            if !checkoutViewModel.card.isEmpty {
                Button {
                    checkoutViewModel.prepairAlertString()
                    showAlert.toggle()
                } label: {
                    Text("Checkout")
                        .frame(maxWidth: .infinity, minHeight: 50)
                }
                .background(Color(red: 1, green: 0.8, blue: 0, opacity: 0.8))
                .cornerRadius(5)
                .frame(height: 100)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Your order:"),
                        message: Text(checkoutViewModel.alertString),
                        primaryButton: .default(Text("Order")),
                        secondaryButton: .destructive(Text("Cancel"))
                    )
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
