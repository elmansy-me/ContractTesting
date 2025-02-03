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
        bind()
    }
    
     
    var cartBadgeView: AnyPublisher<AnyView, Never> {
        $_cartBadgeView.eraseToAnyPublisher()
    }
    
    @Published private var _cartBadgeView: AnyView = AnyView(Text("ConsumerContractImpl"))
    
    private var cancellables = Set<AnyCancellable>()
    
    func addItem(item: ConsumerCartItem) {
        let item = CartItemModel(item: item)
        print("🔥 ParentApp: Passing consumer's AddItem request to CartModule")
        cartProvider.addItem(item: item)
    }
    
    func removeLastItem() {
        print("🔥 ParentApp: Passing consumer's RemoveItem request to CartModule")
        cartProvider.removeLastItem()
    }
    
    func bind() {
        cartProvider.view.sink { [weak self] view in
            print("🔥 ParentApp: Passing CartModule's cartBadgeView to Consumer")
            self?._cartBadgeView = view
        }.store(in: &cancellables)
    }
}
