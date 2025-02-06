//
//  HomeView.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import SwiftUI
import Consumer
import CartModule

struct HomeView: View {
    let cartInteractor: MediatorInteractor
    
    var body: some View {
        Consumer.HomeBuilder.build(withCart: self.cartInteractor)
    }
}
