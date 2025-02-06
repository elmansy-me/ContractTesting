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
        let provider: ExpressCartInteractor = ExpressCartModule.contract
        let mediator = CartMediatorImpl(cartProvider: provider)
        return mediator
    }()
    
    func start() -> some View {
        let cartInteractor = ExpressCartModule.contract
        let mediator = CartMediatorImpl(cartProvider: cartInteractor)
        return HomeView(cartInteractor: mediator)
    }
}
