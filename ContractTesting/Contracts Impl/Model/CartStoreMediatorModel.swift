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
  
    init(id: String, localizedName: String) {
        self.id = id
        self.localizedName = localizedName
    }
  
    init(marketplaceStore: any MarketplaceStore) {
        self.id = marketplaceStore.id
        self.localizedName = marketplaceStore.localizedName
    }
}
