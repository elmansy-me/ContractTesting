//
//  CartView.swift
//  ContractTesting
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import SwiftUI

struct CartView: View {
    
    let totalPrice: Double
    
    init(totalPrice: Double) {
        self.totalPrice = totalPrice
    }
    
    var body: some View {
        Button(action: {
            // TODO: Add Implementation
        }) {
            Text("Total Price = \(totalPrice)")
                .font(.headline)
                .foregroundColor(Color(.systemBackground))
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(.primary)
                .cornerRadius(8)
        }
        .contentShape(Rectangle())
        .padding()
    }
}
