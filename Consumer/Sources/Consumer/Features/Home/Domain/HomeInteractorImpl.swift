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
    
    var cartBadgeInfo: AnyPublisher<CartBadgeInfo, Never> {
        $_cartBadgeInfo
            .compactMap { $0 }
                .eraseToAnyPublisher()
    }
    
    @Published private var _cartBadgeInfo: CartBadgeInfo?
    
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
        contract?.cartBadgeInfo.sink(receiveValue: { [weak self] data in
            print("🔥 Consumer: Did recieve a new cart info data.")
            self?._cartBadgeInfo = data
        }).store(in: &cancellables)
    }
    
}
