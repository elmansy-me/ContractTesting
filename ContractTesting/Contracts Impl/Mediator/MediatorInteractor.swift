//
//  MediatorInteractor.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import Foundation
import Consumer
import CartModule

@MainActor
protocol MediatorInteractor: ConsumerContract {
    var cartProvider: CartInteractor { get }
}
