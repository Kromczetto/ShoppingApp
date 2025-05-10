//
//  ProductImageView.swift
//  ShoppingApp
//
//  Created by Kuba Kromomołowski on 09/05/2025.
//

import SwiftUI

struct ProductImageView: View {
    @Binding var image: String
    @Binding var favourite: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button {
                favourite.toggle()
            } label: {
                Image(systemName: favourite ? "heart.fill" : "heart")
                    .frame(height: 5, alignment: .leading)
                    .padding([.leading], 10)
                    .padding([.top],10)
            }
            .buttonStyle(.plain)
            if let img = UIImage(named: image) {
                Image(uiImage: img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 150)
                    .padding([.leading], 40)
                    .padding([.top],-15)
                    .padding([.bottom],10)
            }
        }
    }
}

