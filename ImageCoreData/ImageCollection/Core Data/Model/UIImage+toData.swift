//
//  UIImage+toData.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 22.02.22.
//

import Foundation
import UIKit

extension UIImage {
    var toData: Data? {
        return pngData()
    }
}

extension Data {
    func toImage(data: Data) -> UIImage? {
        return UIImage(data: data)
    }
}
