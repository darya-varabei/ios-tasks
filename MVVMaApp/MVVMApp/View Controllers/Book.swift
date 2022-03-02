//
//  Book.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/14/22.
//

import Foundation

struct Book: Decodable {
    let title: String
    let isbn: String?
    let pageCount: Int
    let publishedDate: PublishedDate?
    let thumbnailURL: String?
    let shortDescription, longDescription: String?
    let authors, categories: [String]
    
    enum CodingKeys: String, CodingKey {
        case title, isbn, pageCount, publishedDate
        case thumbnailURL = "thumbnailUrl"
        case shortDescription, longDescription, authors, categories
    }
}

struct PublishedDate: Decodable {
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case date = "$date"
    }
}
