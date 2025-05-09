//
//  ProductButton.swift
//  ShoppingApp
//
//  Created by Kuba Kromomołowski on 09/05/2025.
//

import SwiftUI

struct ProductButton: View {
    @State var action: () -> Void
    @State var sign: String = "+"
    @State var opacity: Double = 0.8
    var body: some View {
        Button {
            action()
        } label: {
            Text(sign)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.black)
                .font(.system(size: 32))
        }
        .buttonStyle(.plain)
        .background(Color(red: 1.0, green: 0.8, blue: 0.0, opacity: opacity))
    }
}
