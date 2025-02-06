//
//  CartHandler.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import SwiftUI
import Combine

actor CartHandler {
    nonisolated private let cartAdapter: MarketplaceCartRepresenting
    private let storeID: String
    private var cartState: (any MarketplaceCart)?
    
    init(storeID: String, cartAdapter: MarketplaceCartRepresenting) {
        self.storeID = storeID
        self.cartAdapter = cartAdapter
        Task.detached {
            await self.loadCart()
        }
    }
  
    private func loadCart() async {
        if let newCartState = try? await cartAdapter.cart(forStoreID: self.storeID) {
            await self.updateCartState(with: newCartState)
        }
    }
  
    private func updateCartState(with cart: any MarketplaceCart) async {
        self.cartState = cart
    }
  
    // MarketplaceCartProvider

    @MainActor
    var cartBadgeView: () -> any View {
        cartAdapter.cartBadgeView
    }

    func openCart() async {
        await cartAdapter.openCart()
    }

    // MarketplaceCartActionsHandler

    var cart: any MarketplaceCart {
        get async throws {
            do {
                return try await cartAdapter.cart(forStoreID: storeID)
            }
        }
    }

    func addToCart(_ item: any MarketplaceCartItem) async {
        guard let cartState = cartState else {
            return
        }
        if await isItemAddedToCart(item) {
            if let updatedCart = try? await cartAdapter.updateItem(item, inCart: cartState) {
                await self.updateCartState(with: updatedCart)
            }
        } else {
            if let updatedCart = try? await cartAdapter.addItem(item, toCart: cartState) {
                await self.updateCartState(with: updatedCart)
            }
        }
    }
  
    func removeFromCart(_ item: any MarketplaceCartItem) async {
        guard
            let cartState = cartState,
            await isItemAddedToCart(item)
        else {
            return
        }
        if (cartState.items.first(where: { item.id == $0.id })?.quantity ?? 0) > 1 {
            if let updatedCart = try? await cartAdapter.updateItem(item, inCart: cartState) {
                await self.updateCartState(with: updatedCart)
            }
        } else {
            if let updatedCart = try? await cartAdapter.removeItem(item, fromCart: cartState) {
                await self.updateCartState(with: updatedCart)
            }
        }
    }

    func clearCart() async throws {
        try await cartAdapter.clearCart()
    }
  
    // Private
  
    private func isItemAddedToCart(_ item: any MarketplaceCartItem) async -> Bool {
        guard let cartState = cartState else {
            return false
        }
        return cartState.items.contains(where: { $0.id == item.id })
    }
}
