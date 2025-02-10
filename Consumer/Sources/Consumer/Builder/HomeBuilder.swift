//
//  File.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import SwiftUI

@MainActor
public class HomeBuilder {
    public static func build(withCart cart: MarketplaceCartRepresenting) -> AnyView {
        let store = Store(
            id: "B558DA5C-CD25-4ED5-8BD5-7B622382547A",
            localizedName: "Carrefour",
            minimumOrder: 320.00,
            currency: "DZD"
        )
        let cartHandler = CartHandler(
            store: store,
            cartAdapter: cart
        )
        let viewModel = HomeViewModel(cartHandler: cartHandler)
        let view = HomeView(viewModel: viewModel)
        return AnyView(view)
    }
}
