//
//  AppCoordinator.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//

import Foundation
import UIKit
class AppCoordinator: Coordinator {
    // MARK: - Properties
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var window: UIWindow?
    
    // MARK: - Initializers
    init(navigationController: UINavigationController ) {
        self.navigationController = navigationController
    }
    
    // MARK: - LifeCycle
    func start() {
        // here we call start functions
        showLoginCoordinator()
    }
    
    func coordinatorDidExit(coordinator: Coordinator) { }
}
