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
    var cartBadgeView: () -> any View { get }
    func openCart() async
  
    func cart(forStoreID storeID: String) async throws -> any ExpressCart
    func configure(recommendedItemsDisplayed: Bool, addressChangeAllowed: Bool)
    func clearCart() async throws
  
    func addItem(_ item: any ExpressCartItem, toCart cart: any ExpressCart) async throws -> any ExpressCart
    func updateItem(_ item: any ExpressCartItem, inCart cart: any ExpressCart) async throws -> any ExpressCart
    func removeItem(_ item: ExpressCartItem, fromCart cart: any ExpressCart) async throws -> any ExpressCart
}
