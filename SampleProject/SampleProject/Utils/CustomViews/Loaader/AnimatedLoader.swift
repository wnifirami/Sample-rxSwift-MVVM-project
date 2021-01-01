//
//  AnimatedLoader.swift
//  SampleProject
//
//  Created by Rami Ounifi on 1/1/2021.
//


import UIKit
import Lottie


class AnimatedLoader {

  static var loader: LoaderView = {
    let loader = LoaderView()
    loader.translatesAutoresizingMaskIntoConstraints = false
    return loader
  }()
  
    static func showLoader(type: LoaderCases) {
    
    guard let window = UIApplication.shared.keyWindow else {
      return
    }
    loader.typeLoader = type
    window.addSubview(loader)
    loader.widthAnchor.constraint(equalTo: window.widthAnchor).isActive = true
    loader.heightAnchor.constraint(equalTo: window.heightAnchor).isActive = true
    loader.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
    loader.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
    loader.startLoader()
    
  }
  
  static func hideLoader() {
    loader.stopLoader()
    loader.removeFromSuperview()
  }

}
