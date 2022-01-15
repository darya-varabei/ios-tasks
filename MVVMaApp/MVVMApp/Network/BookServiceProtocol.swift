//
//  BookServiceProtocol.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation

protocol BookServiceProtocol {
    func getAllBooks(completion: @escaping(_ result: [Book]?, _ success: Bool?) -> Void)
}
