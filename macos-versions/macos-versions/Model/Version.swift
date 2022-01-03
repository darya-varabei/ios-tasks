//
//  Version.swift
//  macos-versions
//
//  Created by Дарья Воробей on 1/3/22.
//

import Foundation

struct Version: Decodable {
    let family: Family
    let version: String
    let codename: String
    let announced: String
    let released: String
    let requirements: [String]
    let releases: [Release]
}
