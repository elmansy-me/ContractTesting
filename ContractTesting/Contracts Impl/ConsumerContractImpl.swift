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

class ConsumerContractImpl: ConsumerContract {
     
    var cartBadgeView: AnyPublisher<AnyView, Never> {
        $_cartBadgeView.eraseToAnyPublisher()
    }
    
    @Published private var _cartBadgeView: AnyView = AnyView(Text("ConsumerContractImpl"))
    
    init() {
        bind()
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func addItem(item: ConsumerCartItem) {
        let item = CartItemModel(item: item)
        print("🔥 ParentApp: Passing consumer's AddItem request to CartModule")
        CartModule.contract.addItem(item: item)
    }
    
    func removeLastItem() {
        print("🔥 ParentApp: Passing consumer's RemoveItem request to CartModule")
        CartModule.contract.removeLastItem()
    }
    
    func bind() {
        CartModule.contract.view.sink { [weak self] view in
            print("🔥 ParentApp: Passing CartModule's cartBadgeView to Consumer")
            self?._cartBadgeView = view
        }.store(in: &cancellables)
    }
}
