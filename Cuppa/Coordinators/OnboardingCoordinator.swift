//
//  OnboardingCoordinator.swift
//  Cuppa
//
//  Created by admin on 30.07.2025.
//

import UIKit

// MARK: - OnboardingCoordinator

class OnboardingCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let factory = SceneFactory.self
    
    // MARK: - Methods
    
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("OnboardingCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

// MARK: - Navigation

private extension OnboardingCoordinator {
    func showOnboarding() {
        let viewController = factory.makeOnboardingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
