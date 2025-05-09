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
            VStack {
                Image(systemName: favourite ? "heart.fill" : "heart")
                    .padding([.trailing], 170)
                    .padding([.top, .leading], 10)
                if let img = UIImage(named: image) {
                    Image(uiImage: img)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 150)
                        .padding([.bottom], 20)
                }
            }
            
            VStack {
                Text(description)
                    .padding([.top], 20)
                Spacer()
                Text(price)
                HStack {
                    ProductButton(action: { print("-") }, sign: "-", opacity: 0.4)
                    Text("\(amount)")
                    ProductButton(action: { print("+") }, sign: "+", opacity: 0.8)
                }

            }
            
        }
        .frame(height: 200)
            
    }
}

#Preview {
    ProductView()
}
