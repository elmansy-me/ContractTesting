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
class CartHandler: MarketplaceCartProvider {
    private var cartContract: ConsumerContract
  
    var cartBadgeView: () -> any View {
        cartContract.cartBadgeView
    }
  
    init(cartContract: ConsumerContract) {
        self.cartContract = cartContract
    }
    
    func addItem(_ item: any MarketplaceCartItem) {
        cartContract.addItem(item: item)
    }
    
    func removeItem(_ item: any MarketplaceCartItem) {
        cartContract.removeItem(item: item)
    }
}
