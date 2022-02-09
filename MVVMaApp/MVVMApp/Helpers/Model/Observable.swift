//
//  Observable.swift
//  MVVMaApp
//
//  Created by Дарья Воробей on 1/13/22.
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
