//
//  BrowseViewModel.swift
//  ShoppingApp
//
//  Created by Kuba Kromomołowski on 09/05/2025.
//

import Foundation

class BrowseViewModel: ObservableObject {
    @Published var products: Products?
    
    func readJSONFromFile(JSONName: String) {
        print("Reading")
        do {
            if let path = Bundle.main.path(forResource: JSONName, ofType: "json") {
                let url = URL(fileURLWithPath: path)
                print(url)
                let data = try Data(contentsOf: url)
                print("Loaded")
                jsonParser(json: data)
            } else {
                print("Problem with loading")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func jsonParser(json: Data) {
        do {
            let decodedJson = try JSONDecoder().decode(Products.self, from: json)
            products = decodedJson
            print("Decoded")
        } catch {
            products = nil
            print(error.localizedDescription)
        }
    }
}
