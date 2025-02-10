//
//  SwiftUIView.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State private var isCartBadgePresented: Bool = false
    
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
          
            if isCartBadgePresented {
                AnyView(viewModel.cartBadgeView())
            }
        }
        .padding()
        .onAppear {
            // For simulation purposes only
            Task {
                await Task.sleep(3_000_000_000) // 3 seconds delay
                isCartBadgePresented = true
            }
        }
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
            discountedPrice: 110.00,
            currency: "DZD"
        )
    }
}
