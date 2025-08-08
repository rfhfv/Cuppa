//
//  ProfileCoordinator.swift
//  Cuppa
//
//  Created by admin on 30.07.2025.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    let factory = SceneFactory.self
    
    override func start() {
        showProfileScene()
    }
    
    override func finish() {
        print("AppCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

extension ProfileCoordinator {
    func showProfileScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeProfileScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
