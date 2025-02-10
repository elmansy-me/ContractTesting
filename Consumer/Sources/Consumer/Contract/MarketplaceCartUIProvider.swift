//
//  MarketplaceCartProvider.swift
//  Consumer
//
//  Created by Pavlo Bilohaienko on 05.02.2025.
//

import SwiftUI

/// Combining UI-related interactions for the Cart: providing the badge view and delegating opening of the full-size cart.
public protocol MarketplaceCartUIProvider: Sendable {
    typealias BadgeViewWrapper = () -> any View
  
    /// Expected to receive`EmptyView` when cart is absent for a Store.
    func cartBadgeView(forStore store: any MarketplaceStore) -> BadgeViewWrapper
    func openCart() async
}
