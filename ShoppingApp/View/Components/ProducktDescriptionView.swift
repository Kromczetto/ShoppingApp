//
//  ProducktDescriptionView.swift
//  ShoppingApp
//
//  Created by Kuba Kromołowski on 09/05/2025.
//

import SwiftUI

struct ProducktDescriptionView: View {
    @EnvironmentObject var checkoutViewModel: CheckoutViewModel
    
    @Binding var id: String
    @Binding var description: String
    @Binding var price: String
    @Binding var maxOrder: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Text(description)
            Spacer()
            HStack {
                Text(price)
                    .foregroundStyle(.red)
                    .font(.system(size: 24))
                Spacer()
            }
            HStack(alignment: .center, spacing: 0) {
                ProductButton(action: {
                    var amount = checkoutViewModel.cart[id] ?? 0
                    checkoutViewModel.removeProductFromCard(id: id, amount: amount, price: price)
                    if amount > 0 { amount -= 1; };
                    checkoutViewModel.printCard()
                }, sign: "-", opacity: 0.2)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Text("\(checkoutViewModel.cart[id] ?? 0)")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white)
                ProductButton(action: {
                    var amount = checkoutViewModel.cart[id] ?? 0
                    checkoutViewModel.addProductToCard(id: id, price: price, maxOrder: maxOrder);
                    amount += 1;
                    checkoutViewModel.printCard()
                }, sign: "+", opacity: 0.8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }.frame(height: 40)
        }
        .padding(3)
        .padding([.top], 5)
        .frame(height: 200)
        .background(Color(red: 1, green: 0.8, blue: 0.0, opacity: 0.2))
    }
}

