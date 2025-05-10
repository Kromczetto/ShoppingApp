//
//  CheckoutViewModel.swift
//  ShoppingApp
//
//  Created by Kuba Kromołowski on 10/05/2025.
//

import Foundation

class CheckoutViewModel: ObservableObject {
    @Published var cart: [String: Int] = [:]
    @Published var alertString: String = ""
    @Published var totalPrice: Double = 0
    
    func addProductToCard(id: String, price: String, maxOrder: Int) {
        if let val = cart[id] {
            if maxOrder < val + 1 {
                return
            }
            cart[id] = val + 1
            if let p = Double(String(price.dropLast(2))) {
                totalPrice += p
                totalPrice = (totalPrice * 100).rounded() / 100
                print(p)
            } else {
                print("Cast problem")
                print(String(price.dropLast(2)))
            }
        } else {
            cart[id] = 1
            if let p = Double(String(price.dropLast(2))) {
                totalPrice += p
                totalPrice = (totalPrice * 100).rounded() / 100
                print(p)
            } else {
                print("Cast problem")
            }
        }
    }
    func removeProductFromCard(id: String, amount: Int, price: String) {
        if amount == 0 {
            return
        }
        guard let exists = cart[id] else {
            print("Item not found")
            return
        }
        if exists - 1 == 0 {
            cart.removeValue(forKey: id)
            if let p = Double(String(price.dropLast(2))) {
                totalPrice -= p
                totalPrice = (totalPrice * 100).rounded() / 100
            }
            return
        }
        cart[id] = exists - 1
        if let p = Double(String(price.dropLast(2))) {
            totalPrice -= p
            totalPrice = (totalPrice * 100).rounded() / 100
        }
    }
    func prepairAlertString() {
        alertString = ""
        for i in cart {
            alertString += "\(i.key), "
        }
        alertString = String(alertString.dropLast(2))
    }
    //Function used to debug
    func printCard() {
        for(i, amount) in cart {
            print("id: \(i), amount: \(amount)")
        }
    }
}
