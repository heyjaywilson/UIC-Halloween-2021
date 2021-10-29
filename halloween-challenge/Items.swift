//
//  Items.swift
//  halloween-challenge
//
//  Created by Maegan Wilson on 10/29/21.
//

import Foundation


struct StoreItem: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let price: Double
    var quantity: Int = 10
    
    mutating func purchase(amt: Int){
        quantity = quantity - amt
    }
}

var StoreItems = [
    StoreItem(imageName: "vampire", name: "Vampire", price: 50.0),
    StoreItem(imageName: "black-cat", name: "Black Cat", price: 5.0),
    StoreItem(imageName: "candy-apple", name: "Candy Apple", price: 0.5),
    StoreItem(imageName: "candy-tree", name: "Candy Tree", price: 500.0),
    StoreItem(imageName: "frankenstein", name: "Frankenstein Look A Like", price: 500.0),
    StoreItem(imageName: "ghost", name: "Ghost", price: 10.0),
    StoreItem(imageName: "haunted-tree", name: "Haunted Tree", price: 1000.0),
    StoreItem(imageName: "jackolantern", name: "Jack-o-lantern", price: 29.99),
    StoreItem(imageName: "owl", name: "Owl", price: 30.0),
    StoreItem(imageName: "scary-scare-crow", name: "Scare Crow", price: 500.0),
    StoreItem(imageName: "spider", name: "Spoopy Spider", price: 499.99),
    StoreItem(imageName: "stabbed-toy", name: "Scary Toy", price: 5.98),
    StoreItem(imageName: "stump", name: "Scary Stump", price: 155.0),
    StoreItem(imageName: "well", name: "Well Well Well", price: 400.0),
    StoreItem(imageName: "witch", name: "Wicked Witch", price: 9900.0)
]
