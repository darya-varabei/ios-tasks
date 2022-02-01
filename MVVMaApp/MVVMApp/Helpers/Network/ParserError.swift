//
//  ParserError.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation

enum ParserError: Error {
    case fileNotFound
    case invalidRequest
    case invalidDateFormat
    case parsingError
}
