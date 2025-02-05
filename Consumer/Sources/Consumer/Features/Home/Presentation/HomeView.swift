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
        let item = ConsumerCartItemModel(id: "\(Int.random(in: 0..<5))", price: 120.00, count: 1)
        viewModel.addItem(item)
    }
    
    private func removeRandomItem() {
        let item = ConsumerCartItemModel(id: "\(Int.random(in: 0..<5))", price: 120.00, count: 1)
        viewModel.removeItem(item)
    }
}
