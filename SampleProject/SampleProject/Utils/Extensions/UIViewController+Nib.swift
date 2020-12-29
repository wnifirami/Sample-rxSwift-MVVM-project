//
//  UIViewController+Nib.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//


import UIKit
extension UIViewController {
    static func initFromNib() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: self), bundle: nil)  }
        return instanceFromNib()
    }
}


extension UINavigationController {
    
    var currentViewController: UIViewController {
        var viewController = UIViewController()
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            viewController = topController
        }
        return viewController
    }
}
