//
//  AppCoordinator.swift
//  CountriesApp
//
//  Created by Ahmed Elmansy on 30/01/2025.
//

import SwiftUI
import Consumer

@MainActor
class AppCoordinator {

    func start() -> some View {
        setupInitialConfiguration()
        let view = HomeView()
        return view
    }
    
    private func setupInitialConfiguration() {
        let implementation = ConsumerContractImpl()
        Consumer.contract = implementation
    }
}
