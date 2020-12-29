//
//  LoginCoordinator.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//

import Foundation
import RxSwift
// MARK: - Properties
class LoginCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    let loginViewModel = LoginViewModel()
    let loginController: LoginViewController
    let disposeBag = DisposeBag()
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
       loginController = LoginViewController(viewModel: loginViewModel)
    }
    
    // MARK: - LifeCycle
    func start()  {
        navigationController.navigationBar.isHidden = true
        showLoginScreen() 
    }
    
    func coordinatorDidExit(coordinator: Coordinator) { }
    
}

