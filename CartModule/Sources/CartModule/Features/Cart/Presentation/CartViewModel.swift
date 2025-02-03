//
//  CartViewModel.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation

@MainActor
class CartViewModel: ObservableObject {
    
    var totalPrice: Double
    
    init(totalPrice: Double) {
        self.totalPrice = totalPrice
    }
    
}
