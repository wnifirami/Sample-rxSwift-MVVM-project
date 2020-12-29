//
//  LoginViewModel+Extension.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//

import Foundation
import RxSwift
extension LoginCoordinator {
    // MARK: - Members
    func showLoginScreen() {
        self.navigationController.setViewControllers([loginController],animated: true)
    }
   
    
    
}
