//
//  CheckoutViewModel.swift
//  ShoppingApp
//
//  Created by Kuba Kromołowski on 10/05/2025.
//

import Foundation

class CheckoutViewModel: ObservableObject {
    @Published var card: [String: Int] = [:]
    @Published var alertString: String = ""
    
    func addProductToCard(id: String) {
        if let val = card[id] {
            card[id] = val + 1
        } else {
            card[id] = 1
        }
    }
    func removeProductFromCard(id: String, amount: Int) {
        if amount == 0 {
            return
        }
        guard let exists = card[id] else {
            print("Item not found")
            return
        }
        if exists - 1 == 0 {
            card.removeValue(forKey: id)
            return
        }
        card[id] = exists - 1
    }
    func prepairAlertString() {
        alertString = ""
        for i in card {
            alertString += "\(i.key), "
        }
        alertString = String(alertString.dropLast(2))
    }
    //Function used to debug
    func printCard() {
        for(i, amount) in card {
            print("id: \(i), amount: \(amount)")
        }
    }
}
