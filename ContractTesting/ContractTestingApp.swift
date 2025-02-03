//
//  ContractTestingApp.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import SwiftUI

@main
struct ContractTestingApp: App {
    
    private let appCoordinator = AppCoordinator()
    @StateObject private var navigationCoordinator = NavigationCoordinator()

    var body: some Scene {
        WindowGroup {
            appCoordinator.start()
                .environmentObject(navigationCoordinator)
        }
    }
}
