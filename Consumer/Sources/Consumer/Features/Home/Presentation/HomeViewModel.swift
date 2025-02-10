//
//  File.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    private let cartHandler: CartHandler
    
    init(cartHandler: CartHandler) {
        self.cartHandler = cartHandler
    }
    
    var cartBadgeView: () -> any View {
        cartHandler.cartBadgeView
    }
    
    func addToCart(product: Product) {
        Task.detached {
            let randomQuantity: Int = Int.random(in: 1...3)
            let item = CartItem(product: product, quantity: randomQuantity)
            await self.cartHandler.addToCart(item)
        }
    }
    
    func removeFromCart(product: Product) {
        Task.detached {
            let item = CartItem(product: product, quantity: 1)
            await self.cartHandler.removeFromCart(item)
        }
    }
}
