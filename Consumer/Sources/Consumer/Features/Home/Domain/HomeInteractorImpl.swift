//
//  File.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import SwiftUI
import Combine

class HomeInteractorImpl: HomeInteractor {
    
    var cartBadgeView: AnyPublisher<AnyView, Never> {
        $_cartBadgeView.eraseToAnyPublisher()
    }
    
    @Published private var _cartBadgeView: AnyView = AnyView(EmptyView())
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        bind()
    }
    
    func addRandomProduct() {
        let randomItem = ConsumerCartItemModel(id: UUID().uuidString, price: 50)
        print("🔥 Consumer: Requesting parent to add an item...")
        contract?.addItem(item: randomItem)
    }
    
    func removeRandomProduct() {
        print("🔥 Consumer: Requesting parent to remove an item...")
        contract?.removeLastItem()
    }
    
    func getRandomPrice() -> Double {
        Double(Int.random(in: 50...200))
    }
    
    func bind() {
        contract?.cartBadgeView.sink(receiveValue: { [weak self] view in
            print("🔥 Consumer: Did recieve a new cart badge view.")
            self?._cartBadgeView = view
        }).store(in: &cancellables)
    }
    
}
