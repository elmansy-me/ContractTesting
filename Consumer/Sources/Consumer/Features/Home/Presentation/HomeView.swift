//
//  SwiftUIView.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Button(action: addRandomItem) {
                Text("Add Random Product")
                    .font(.headline)
                    .foregroundColor(Color(.systemBackground))
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(.primary)
                    .cornerRadius(8)
            }
            .contentShape(Rectangle())
            
            Button(action: removeRandomItem) {
                Text("Remove Random Product")
                    .font(.headline)
                    .foregroundColor(Color(.systemBackground))
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(.primary)
                    .cornerRadius(8)
            }
            .contentShape(Rectangle())
            
            Spacer()
            
            Text("Cart Badge")
                .font(.headline)
                .foregroundColor(Color.primary)
          
            AnyView(viewModel.cartBadgeView())
        }
        .padding()
    }
  
    private func addRandomItem() {
        viewModel.addToCart(product: randomProduct)
    }
  
    private func removeRandomItem() {
        viewModel.removeFromCart(product: randomProduct)
    }
  
    private var randomProduct: Product {
        Product(
          id: "\(Int.random(in: 0...0))",
            name: "",
            price: 125.00,
            currency: "DZD",
            quantity: 1
        )
    }
}
