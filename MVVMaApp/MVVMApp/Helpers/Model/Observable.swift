//
//  Observable.swift
//  MVVMaApp
//
//  Created by Дарья Воробей on 1/13/22.
//

import Foundation

public class Observable<T> {
    
//    typealias Listener = (T) -> Void
//    var listener: Listener?
//
//    var value: T {
//        didSet {
//            listener?(value)
//        }
//    }
//
//    init(_ value: T) {
//        self.value = value
//    }
//
//    func bind(listener: Listener?) {
//        self.listener = listener
//        listener?(value)
//    }
    
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
