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

    @Published var shouldShowCartBadge: Bool = false
    @Published var totalPrice: Double = 0
    
    private let interactor: HomeInteractor
    private var cancellables = Set<AnyCancellable>()
    
    init(interactor: HomeInteractor) {
        self.interactor = interactor
        interactor.cartBadgeInfo.sink { [weak self] data in
            self?.shouldShowCartBadge = data.shouldAppear
            self?.totalPrice = data.totalPrice
        }.store(in: &cancellables)
    }
    
    var cartBadgeView: AnyView = AnyView(Text("HomeVM"))
    
    func addRandomProduct() {
        interactor.addRandomProduct()
    }
    
    func removeRandomProduct() {
        interactor.removeRandomProduct()
    }
    
    
}
