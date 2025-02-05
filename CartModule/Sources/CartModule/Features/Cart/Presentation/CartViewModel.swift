//
//  CartViewModel.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation

@MainActor
final class CartViewModel: ObservableObject {
    @Published var totalPrice: Double = 0
    
    init() {}
  
    func addItemPrice(_ price: Double) -> Bool {
        totalPrice += price
        return true
    }
  
    func substractItemPrice(_ price: Double) -> Bool {
        if totalPrice >= price {
            totalPrice -= price
            return true
        }
        return false
    }
    
    func updateTotalPrice(_ price: Double) {
      self.totalPrice += price
    }
}
