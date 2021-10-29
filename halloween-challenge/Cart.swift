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
        
        let indexOfFoundItem = items.firstIndex{ $0.id == item.id }
        print(items)
        
        guard let indexOfFoundItem = indexOfFoundItem else {
            print("INside guard")
            var tempItem = item
            tempItem.quantity = 1
            self.items.append(tempItem)
            print(items)
            return
        }
        print("Outside guard")
        self.items[indexOfFoundItem].quantity = items[indexOfFoundItem].quantity + 1
    }
}

extension Collection {
    func distance(to index: Index) -> Int { distance(from: startIndex, to: index) }
}
