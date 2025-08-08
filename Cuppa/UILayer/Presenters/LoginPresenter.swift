//
//  LoginPresenter.swift
//  Cuppa
//
//  Created by admin on 02.08.2025.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func loginStart(login: String, password: String)
    func registrationStart(login: String, password: String, reEnterPassword: String)
    func goToTGLogin()
    func goToVKLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPass()
    func back()
}

class LoginPresenter {
    private var coordinator: LoginCoordinator?
    weak var viewInput: LoginViewInput?
    
    init(coordinator: LoginCoordinator? = nil, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
}

private extension LoginPresenter {
    func goToMainScreen() {
        coordinator?.finish()
    }
}

extension LoginPresenter: LoginViewOutput {
    func loginStart(login: String, password: String) {
        if login.count >= 2 && password.count >= 2 {
            self.viewInput?.hideNavigationItem()
            self.viewInput?.startLoader()
            DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
                DispatchQueue.main.async {
                    self.viewInput?.stopLoader()
                    self.goToMainScreen()
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.viewInput?.shakeButton()
                self.viewInput?.showErrorLabel()
            }
        }
    }
    
    func registrationStart(login: String, password: String, reEnterPassword: String) {
        if login.count >= 2 && password.count >= 2 && password == reEnterPassword {
            self.viewInput?.hideNavigationItem()
                self.viewInput?.startLoader()
                DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
                    DispatchQueue.main.async {
                        self.viewInput?.stopLoader()
                        self.goToMainScreen()
                    }
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.viewInput?.shakeButton()
                    self.viewInput?.showErrorLabel()
                }
            }
        }
    
    func goToTGLogin() {
        
    }
    
    func goToVKLogin() {
        
    }
    
    func goToSignIn() {
        coordinator?.showSignInScene()
    }
    
    func goToSignUp() {
        coordinator?.showSignUpScene()
    }
    
    func goToForgotPass() {
        
    }
    
    func back() {
        
    }
}
