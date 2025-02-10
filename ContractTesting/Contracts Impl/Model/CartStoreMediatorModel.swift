//
//  CartStoreMediatorModel.swift
//  ContractTesting
//
//  Created by Pavlo Bilohaienko on 06.02.2025.
//

import CartModule
import Consumer

struct CartStoreMediatorModel: ExpressCartStore, MarketplaceStore {
    let id: String
    let localizedName: String
    let minimumOrder: Double
    let currency: String
  
    init(id: String, localizedName: String, minimumOrder: Double, currency: String) {
        self.id = id
        self.localizedName = localizedName
        self.minimumOrder = minimumOrder
        self.currency = currency
    }
  
    init(marketplaceStore: any MarketplaceStore) {
        self.id = marketplaceStore.id
        self.localizedName = marketplaceStore.localizedName
        self.minimumOrder = marketplaceStore.minimumOrder
        self.currency = marketplaceStore.currency
    }
}
