//
//  SwiftUIView.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Button(action: viewModel.addRandomProduct) {
                Text("Add Random Product")
                    .font(.headline)
                    .foregroundColor(Color(.systemBackground))
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(.primary)
                    .cornerRadius(8)
            }
            .contentShape(Rectangle())
            
            Button(action: viewModel.removeRandomProduct) {
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
            viewModel.cartBadgeView
        }
        .padding()
    }
}
