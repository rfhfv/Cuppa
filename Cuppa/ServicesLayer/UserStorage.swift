//
//  UserStorage.swift
//  Cuppa
//
//  Created by admin on 01.08.2025.
//

import Foundation

class UserStorage {
    static let shared = UserStorage()
    
    var passedOnboarding: Bool {
        get { UserDefaults.standard.bool(forKey: " passedOnboarding") }
        set { UserDefaults.standard.set(newValue, forKey: " passedOnboarding") }
    }
}
