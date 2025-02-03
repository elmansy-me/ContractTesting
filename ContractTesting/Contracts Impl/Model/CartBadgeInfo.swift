//
//  CartBadgeInfo.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import CartModule
import Consumer

struct CartBadgeInfo: Consumer.CartBadgeInfo {
    let shouldAppear: Bool
    let totalPrice: Double
}

//extension CartBadgeInfo: CartModule.
