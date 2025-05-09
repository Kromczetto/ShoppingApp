//
//  ProductView.swift
//  ShoppingApp
//
//  Created by Kuba Kromomołowski on 09/05/2025.
//

import SwiftUI

struct ProductView: View {
    @State var description: String = "item sanjasj njkajk nsakn kjas"
    @State var price: String = "10"
    @State var image: String = "bag.png"
    @State var favourite: Bool = true
    @State var amount: Int = 0
    
    var body: some View {
        HStack {
            ProductImageView(image: $image, favourite: $favourite)
            Spacer()
            ProducktDescriptionView(description: $description, price: $price, amount: $amount)
        }
        .frame(height: 200)
    }
}

#Preview {
    ProductView()
}
