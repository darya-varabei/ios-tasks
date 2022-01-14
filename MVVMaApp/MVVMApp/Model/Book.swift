//
//  Book.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/14/22.
//

import Foundation

struct Book: Decodable {
    let title: String
    let isbn: String
    let pageCount: Int
    let publishedDate: PublishedDate
    let thumbnailUrl: String
    let longDescription: String
    let status: String
    let authors: [String]
    let categories: [String]
}

struct PublishedDate: Decodable {
    let date: String

    enum CodingKeys: String, CodingKey {
        case date = "$date"
    }
}
