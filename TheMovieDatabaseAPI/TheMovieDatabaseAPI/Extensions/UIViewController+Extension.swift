//
//  UIViewController+Extension.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import UIKit

private var dataAssociationKey: UInt8 = 0

extension UIViewController {
    var data: Any? {
        get {
            objc_getAssociatedObject(self, &dataAssociationKey) as Any?
        }
        set(newValue) {
            objc_setAssociatedObject(self, &dataAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
}
