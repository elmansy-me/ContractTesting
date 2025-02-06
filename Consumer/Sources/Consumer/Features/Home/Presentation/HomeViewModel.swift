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
            await self.cartHandler.addToCart(product)
        }
    }
    
    func removeFromCart(product: Product) {
        Task.detached {
            await self.cartHandler.removeFromCart(product)
        }
    }
}
