import Foundation

public struct Product { //can be accessed outside source file
    public let name: String
    private(set) var price: Double // private(set) can be read outside class definition, but not set
    public var purchasePrice: Double {
        price
    }
}

open class Cart { // defined as open to make it able to create subclasses from it from within module
    public var products: [Product] = []
    public init() {}
    
    open func calculatePrice() -> Double { // defined as open, to make it able to override function in subclasses outside module
        products.reduce(0) { $0 + $1.price }
    }
    public func newPurchase(name: String, price: Double) {
        let newProduct = Product(name: name, price: price)
        products.append(newProduct)
    }
}
