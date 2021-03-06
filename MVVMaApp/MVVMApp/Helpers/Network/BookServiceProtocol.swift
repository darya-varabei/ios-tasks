//
//  BookServiceProtocol.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation
import UIKit

protocol BookServiceProtocol {
    func getAllBooks(completion: @escaping(_ result: [Book]?, _ success: Bool?, _ featured: [Identifier]?, _ identifierSuccess: Bool?) -> Void)
    func writeFeaturedIndexes(items: [Identifier])
}
