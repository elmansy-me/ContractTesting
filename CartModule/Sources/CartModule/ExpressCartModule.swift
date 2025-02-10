// The Swift Programming Language
// https://docs.swift.org/swift-book

@MainActor
public class ExpressCartModule {
    static public let contract: ExpressCartInteractor = {
       let viewModel = ExpressCartViewModel()
        return ExpressCartInteractorImpl(viewModel: viewModel)
    }()
}
