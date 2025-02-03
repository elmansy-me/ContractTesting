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

    private let interactor: HomeInteractor
    private var cancellables = Set<AnyCancellable>()
    
    init(interactor: HomeInteractor) {
        self.interactor = interactor
        interactor.cartBadgeView.sink { [weak self] view in
            self?.cartBadgeView = view
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
