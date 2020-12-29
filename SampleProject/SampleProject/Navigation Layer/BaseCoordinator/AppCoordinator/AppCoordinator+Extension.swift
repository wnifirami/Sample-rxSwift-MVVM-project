//
//  AppCoordinator+Extension.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//

import Foundation
import Foundation
extension AppCoordinator {
    func showLoginCoordinator(){
        let loginCoordinator = LoginCoordinator(navigationController: self.navigationController)
        loginCoordinator.parentCoordinator = self
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
    }
    
}
