//
//  ParserError.swift
//  macos-versions
//
//  Created by Дарья Воробей on 1/3/22.
//

import Foundation

enum ParserError: Error {
    case fileNotFound
    case invalidRequest
    case invalidDateFormat
    case parsingError
}
