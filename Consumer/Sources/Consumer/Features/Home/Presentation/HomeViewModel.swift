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
    private let cartProvider: MarketplaceCartProvider
    
    init(cartProvider: MarketplaceCartProvider) {
        self.cartProvider = cartProvider
    }
    
    var cartBadgeView: () -> any View {
        cartProvider.cartBadgeView
    }
    
    func addItem(_ item: any MarketplaceCartItem) {
        cartProvider.addItem(item)
    }
    
    func removeItem(_ item: any MarketplaceCartItem) {
        cartProvider.removeItem(item)
    }
}
