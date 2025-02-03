//
//  AppCoordinator.swift
//  CountriesApp
//
//  Created by Ahmed Elmansy on 30/01/2025.
//

import SwiftUI
import Consumer
import CartModule

@MainActor
class AppCoordinator {

    lazy var mediator: MediatorInteractor = {
        let provider: CartInteractor = CartModule.contract
        let mediator = MediatorInteractorImpl(cartProvider: provider)
        return mediator
    }()
    
    func start() -> some View {
        setupInitialConfiguration()
        let view = HomeView()
        return view
    }
    
    private func setupInitialConfiguration() {
        Consumer.contract = mediator
    }
}
