//
//  ExpressCartInteractor.swift
//  CartModule
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import SwiftUI
import Combine

public protocol ExpressCartInteractor: Sendable {
    typealias BadgeViewWrapper = () -> any View
    typealias CartUpdatesHandler = @Sendable (any ExpressCart) async -> Void
  
    func cartBadgeView(forStore store: ExpressCartStore) -> BadgeViewWrapper
    func openCart() async
  
    func cart(forStore store: ExpressCartStore) async throws -> any ExpressCart
    func subscribeToCartUpdates(forStore store: any ExpressCartStore, handler: @escaping CartUpdatesHandler) async
        
    func configure(recommendedItemsDisplayed: Bool, addressChangeAllowed: Bool)
    func clearCart() async throws
  
    func addItem(_ item: any ExpressSellingItem, quantity: Int, forStore store: any ExpressCartStore) async throws -> any ExpressCart
    func updateItem(_ item: any ExpressSellingItem, newQuantity: Int, forStore store: any ExpressCartStore) async throws -> any ExpressCart
    func removeItem(_ item: any ExpressSellingItem, forStore store: any ExpressCartStore) async throws -> any ExpressCart
}
