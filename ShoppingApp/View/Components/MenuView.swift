//
//  MenuView.swift
//  ShoppingApp
//
//  Created by Kuba Kromomołowski on 09/05/2025.
//

import SwiftUI

struct MenuView: View {
    @State private var index: Int = 0
    var body: some View {
        TabView (selection: $index) {
            NavigationView {
                BrowseView()
            }
            .tabItem {
                Label("Browse",  systemImage: "square.grid.3x3")
            }
            .tag(0)
            NavigationView {
                CheckoutView()
            }
            .tabItem {
                Label("Browse",  systemImage: "clock.fill")
            }
            .tag(1)
        }
        .tint(Color(.sRGB, red: 0.0, green: 0.0, blue: 0.7, opacity: 1))
    }
}

#Preview {
    MenuView()
}
