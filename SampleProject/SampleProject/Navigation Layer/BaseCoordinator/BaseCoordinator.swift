//
//  BaseCoordinator.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//

import Foundation
import UIKit
protocol Coordinator: AnyObject{
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
    func coordinatorDidExit(coordinator: Coordinator) }

extension Coordinator {
    func coordinatorDidExit(_ coordinator: Coordinator) {
        guard let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) else { return }
        self.childCoordinators.remove(at: index) }
    
    func areTheySiblings(class1: AnyObject!, class2: AnyObject!) -> Bool {
        return object_getClassName(class1) == object_getClassName(class2)
    }
    
    func appendChildCoordinator(child: Coordinator) {
        let exist = self.childCoordinators.filter({areTheySiblings(class1: $0, class2: child)}).isEmpty
        if exist {  childCoordinators.append(child) }
    }
}

