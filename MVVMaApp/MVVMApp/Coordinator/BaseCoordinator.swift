//
//  BaseCoordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/22/22.
//

import Foundation

protocol BaseCoordinator: Coordinator {
    var booksCoordinator: BooksBaseCoordinator { get }
    var featuredCoordinator: FeaturedBaseCoordinator { get }
    //var deepLinkCoordinator: DeepLinkBaseCoordinator { get }
    //func handleDeepLink(text: String)
}

protocol BooksBaseCoordinated {
    var coordinator: BooksBaseCoordinator? { get }
}

protocol FeaturedBaseCoordinated {
    var coordinator: FeaturedBaseCoordinator? { get }
}

