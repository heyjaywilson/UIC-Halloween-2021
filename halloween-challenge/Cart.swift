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
            tempTotal += item.price
        }
        return tempTotal
    }
}
