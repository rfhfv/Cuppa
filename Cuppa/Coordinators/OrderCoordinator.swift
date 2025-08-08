//
//  OrderCoordinator.swift
//  Cuppa
//
//  Created by admin on 30.07.2025.
//

import UIKit

class OrderCoordinator: Coordinator {
    
    let factory = SceneFactory.self
    
    override func start() {
        showOrderScene()
    }
    
    override func finish() {
        print("OrderCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

extension OrderCoordinator {
    func showOrderScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeOrderScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
