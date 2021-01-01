//
//  LoaderView.swift
//  SampleProject
//
//  Created by Rami Ounifi on 1/1/2021.
//


import UIKit
import Lottie

enum LoaderCases: String {
    case login
    case loader
    
    
    var type: String {
        switch self {
        case .login:  return  "login"
        case .loader: return "loader"
            
        }
    }
}

extension LoaderCases: CustomStringConvertible {
    var description: String { return type  }
}

class LoaderView: UIView {
    // MARK: - Loader views
    let sizeAnimationView: CGFloat = 100
    let paddingLeftRight: CGFloat = 5.0
    let paddingTopBottom: CGFloat = 10.0
    
    let mainView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorConstant.transparentBlackColor
        return view
        
    }()
    
    let containerView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        return view
        
    }()
    
    let anomationView: AnimationView = {
        let anomationView = AnimationView()
        anomationView.translatesAutoresizingMaskIntoConstraints = false
        anomationView.backgroundColor = .white
        anomationView.contentMode = .scaleAspectFit
        anomationView.play()
        return anomationView
    }()
    var typeLoader: LoaderCases = .loader {
        didSet {
            self.anomationView.animation = Animation.named(self.typeLoader.description)
        }
    }
    
    
    
    // MARK: - initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        anomationView.animation = Animation.named(typeLoader.description)
         anomationView.loopMode = typeLoader == .loader ?  .loop : .playOnce
        setupLoader()
        
    }
    
    // required init
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Views methods
    func setupLoader() {
        
        self.addSubview(mainView)
        mainView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        mainView.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor ).isActive = true
        containerView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.3).isActive = true
        containerView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.15).isActive = true
        //add animation View
       
        containerView.addSubview(anomationView)
        anomationView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        anomationView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        anomationView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        anomationView.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        
    }
    
    // MARK: - helpers methods
    //start loading
    func startLoader() {
        anomationView.play()
        mainView.fadeIn()
    }
    
    //stop loader
    func stopLoader() {
        anomationView.stop()
        self.mainView.fadeOut()
    }
}

