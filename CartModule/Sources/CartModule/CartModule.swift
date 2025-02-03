// The Swift Programming Language
// https://docs.swift.org/swift-book

@MainActor
public class CartModule {
    
    static public let contract: CartInteractor = CartInteractorImpl()
    
}
