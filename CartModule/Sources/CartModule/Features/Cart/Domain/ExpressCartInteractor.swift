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
  
    func cartBadgeView(forStore store: ExpressCartStore) -> BadgeViewWrapper
    func openCart() async
  
    func cart(forStore store: ExpressCartStore) async throws -> any ExpressCart
    func configure(recommendedItemsDisplayed: Bool, addressChangeAllowed: Bool)
    func clearCart() async throws
  
    func addItem(_ item: any ExpressCartItem, fromStore store: any ExpressCartStore) async throws -> any ExpressCart
    func updateItem(_ item: any ExpressCartItem, fromStore store: any ExpressCartStore) async throws -> any ExpressCart
    func removeItem(_ item: ExpressCartItem, fromStore store: any ExpressCartStore) async throws -> any ExpressCart
}
