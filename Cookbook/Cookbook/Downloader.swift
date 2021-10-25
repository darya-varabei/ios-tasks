//
//  Downloader.swift
//  Cookbook
//
//  Created by Darya on 10/25/21.
//

import Foundation
import UIKit

class Downloader {
    class func downloadImageWithURL(url:String) -> UIImage! {
        let data = NSData(contentsOf: NSURL(string: url)! as URL)
        return UIImage(data: data! as Data)
    }
}
