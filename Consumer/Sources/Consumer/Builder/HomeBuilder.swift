//
//  File.swift
//  Consumer
//
//  Created by Ahmed Elmansy on 03/02/2025.
//

import SwiftUI

@MainActor
public class HomeBuilder {
    
    public static func build() -> AnyView {
        let interactor = HomeInteractorImpl()
        let viewModel = HomeViewModel(interactor: interactor)
        let view = HomeView(viewModel: viewModel)
        return AnyView(view)
    }
    
}
