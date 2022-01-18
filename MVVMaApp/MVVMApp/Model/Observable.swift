//
//  Observable.swift
//  MVVMaApp
//
//  Created by Дарья Воробей on 1/13/22.
//

import Foundation

//class Observable<T> {
//    typealias Listener = (T) -> Void
//    private var listener: Listener?
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
//}

class Observable<T> {
    
    typealias Listener = (T) -> ()
        var listener: Listener?
        
        func bind(_ listener: Listener?) {
            self.listener = listener
        }
        
        func bindAndFire(_ listener: Listener?) {
            self.listener = listener
            listener?(value)
        }
        
        var value: T {
            didSet {
                listener?(value)
            }
        }
        
        init(_ v: T) {
            value = v
        }

//    var value: T {
//        didSet {
//            listener?(value)
//        }
//    }
//
//    private var listener: ((T) -> Void)?
//
//    init(_ value: T) {
//        self.value = value
//    }
//
//    func bind(_ closure: @escaping (T) -> Void) {
//        closure(value)
//        listener = closure
//    }
}
