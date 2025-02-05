//
//  ConsumerContractImpl.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import Consumer
import CartModule
import SwiftUI
import Combine

class MediatorInteractorImpl: MediatorInteractor {
    
    let cartProvider: CartInteractor
    
    init(cartProvider: CartInteractor) {
        self.cartProvider = cartProvider
    }
    
    var cartBadgeView: () -> any View {
        cartProvider.cartBadgeView
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func addItem(item: any MarketplaceCartItem) {
        let item = CartItemModel(item: item)
        
        print("🔥 ParentApp: Passing consumer's AddItem request to CartModule")
        cartProvider.addItem(item)
    }
    
    func removeItem(item: any MarketplaceCartItem) {
        let item = CartItemModel(item: item)
        
        print("🔥 ParentApp: Passing consumer's RemoveItem request to CartModule")
        cartProvider.removeItem(item)
    }
}
