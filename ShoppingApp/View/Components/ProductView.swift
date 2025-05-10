//
//  ProductView.swift
//  ShoppingApp
//
//  Created by Kuba Kromołowski on 09/05/2025.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var browseViewModel: BrowseViewModel
    @EnvironmentObject var checkoutViewModel: CheckoutViewModel
    
    @State var id: String = "0"
    @State var description: String = "item with really long description"
    @State var price: String = "10"
    @State var image: String = "bag.png"
    @State var favourite: Bool = true

    var body: some View {
        HStack {
            ProductImageView(image: $image, favourite: $favourite)
            Spacer()
            ProducktDescriptionView(id: $id, description: $description, price: $price)
                .environmentObject(checkoutViewModel)
        }
        .frame(height: 200)
    }
}

#Preview {
    ProductView()
        .environmentObject(BrowseViewModel())
        .environmentObject(CheckoutViewModel())
}
