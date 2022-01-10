//
//  Release.swift
//  macos-versions
//
//  Created by Дарья Воробей on 1/3/22.
//

import Foundation

struct Release: Decodable {
    let version: String
    let build: String
    let darwin: String
    let released: String
}
