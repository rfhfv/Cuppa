//
//  ListCoordinator.swift
//  Cuppa
//
//  Created by admin on 30.07.2025.
//

import UIKit

class ListCoordinator: Coordinator {
    
    let factory = SceneFactory.self
    
    override func start() {
        showListScene()
    }
    
    override func finish() {
        print("AppCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

extension ListCoordinator {
    func showListScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeListScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
