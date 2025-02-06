//
//  MarketplaceCartProvider.swift
//  Consumer
//
//  Created by Pavlo Bilohaienko on 05.02.2025.
//

import SwiftUI

/// CartProvider protocol is responsible for UI interactions: providing cart badge view and opening the cart from C&C implementation end.
public protocol MarketplaceCartUIProvider: Sendable {
    var cartBadgeView: () -> any View { get }

    func openCart() async
}
