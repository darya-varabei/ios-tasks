//
//  RandomImage.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 20.02.22.
//

import Foundation

struct RandomImage: Decodable {
    let link: URL

    enum CodingKeys: String, CodingKey {
        case link = "image"
    }
}
