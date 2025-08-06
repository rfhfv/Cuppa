//
//  OnboardingViewPresenter.swift
//  Cuppa
//
//  Created by admin on 30.07.2025.
//

import Foundation

protocol OnboardingViewOutput: AnyObject {
    func OnboardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    
    private let userStorage = UserStorage.shared
    
    // MARK: - Properties
    
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func OnboardingFinish() {
        userStorage.passedOnboarding = true
        coordinator.finish()
    }
    
}
