//
//  File.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import SwiftUI

@MainActor
public class HomeBuilder {
    public static func build() -> AnyView {
        guard let cartContract = contract else {
            return AnyView(EmptyView())
        }
      
        // TODO: Pass cart contract as a normal DI.
        let cartHandler = CartHandler(cartContract: cartContract)
        let viewModel = HomeViewModel(cartProvider: cartHandler)
        let view = HomeView(viewModel: viewModel)
        return AnyView(view)
    }
}
