//
//  MediatorInteractor.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Consumer
import CartModule

protocol MediatorInteractor: MarketplaceCartRepresenting {
    var cartProvider: ExpressCartInteractor { get }
}
