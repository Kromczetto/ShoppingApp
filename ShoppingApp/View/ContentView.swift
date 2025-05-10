//
//  ContentView.swift
//  ShoppingApp
//
//  Created by Kuba Kromołowski on 09/05/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var browseViewModel = BrowseViewModel()
    @StateObject var checkoutViewModel = CheckoutViewModel()
    
    var body: some View {
        VStack {
            MenuView()
                .environmentObject(browseViewModel)
                .environmentObject(checkoutViewModel)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
