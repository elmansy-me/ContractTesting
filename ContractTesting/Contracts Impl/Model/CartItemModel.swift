//
//  CartItem.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import CartModule
import Consumer

struct CartItemModel: CartItem {
    
    let id: String
    let price: Double
    
    init(id: String, price: Double) {
        self.id = id
        self.price = price
    }
    
    init(item: ConsumerCartItem) {
        self.id = item.id
        self.price = item.price
    }
    
}
