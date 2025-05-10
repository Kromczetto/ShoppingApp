//
//  MenuView.swift
//  ShoppingApp
//
//  Created by Kuba Kromołowski on 09/05/2025.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var browseViewModel: BrowseViewModel
    @EnvironmentObject var checkoutViewModel: CheckoutViewModel
    
    @State private var index: Int = 0
    var body: some View {
        TabView (selection: $index) {
            NavigationView {
                BrowseView()
                    .environmentObject(browseViewModel)
                    .environmentObject(checkoutViewModel)
            }
            .tabItem {
                Label("Browse",  systemImage: "square.grid.3x3")
            }
            .tag(0)
            NavigationView {
                CheckoutView()
                    .environmentObject(browseViewModel)
                    .environmentObject(checkoutViewModel)
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
        .environmentObject(BrowseViewModel())
        .environmentObject(CheckoutViewModel())
}
