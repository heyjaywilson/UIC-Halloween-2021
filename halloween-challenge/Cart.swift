//
//  Cart.swift
//  halloween-challenge
//
//  Created by Maegan Wilson on 10/29/21.
//

import Foundation

struct Cart {
    var items: [StoreItem] = []
    
    var total: Double {
        var tempTotal = 0.0
        for item in items{
            tempTotal += item.price * Double(item.quantity)
        }
        return tempTotal
    }
    
    mutating func addItemToCart(_ item: StoreItem){
        // check if item UUID is in cart
        // if in cart, then increase quantity
        // else add item with quanity 1
        
        guard let indexOfFoundItem = items.firstIndex(of: item) else {
            var tempItem = item
            tempItem.quantity = 1
            items.append(tempItem)
            return
        }
        items[indexOfFoundItem].quantity = items[indexOfFoundItem].quantity + 1
        
//        let foundItem = items.filter{ $0.id == item.id }
//        if foundItem.isEmpty {
//            var tempItem = item
//            tempItem.quantity = 1
//            items.append(tempItem)
//        } else {
//            var tempItem = foundItem[0]
//            tempItem.quantity = tempItem.quantity + 1
//            guard let indexOfFoundItem = items.firstIndex(of: item)
//            items[indexOfFoundItem] = tempItem
//        }
    }
}
