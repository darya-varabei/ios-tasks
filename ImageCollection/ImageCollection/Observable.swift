//
//  Observable.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 20.02.22.
//

import Foundation

public class Observable<T> {
    
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) -> Void) {
        self.observer = observer
    }
}
