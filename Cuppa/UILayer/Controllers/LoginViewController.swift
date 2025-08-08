//
//  LoginViewController.swift
//  Cuppa
//
//  Created by admin on 01.08.2025.
//

import UIKit

enum LoginViewState {
    case initial
    case signIn
    case signUp
}

protocol LoginViewInput: AnyObject {
    func startLoader()
    func stopLoader()
    func showErrorLabel()
    func shakeButton()
    func hideNavigationItem()
}

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private var state: LoginViewState = .signUp
    var viewOutput: LoginViewOutput!
    private var isKeyboardShow = false
    private var bottomCTValue = 0.0
    
    // MARK: - Views
    
    private lazy var bottomView = FDBottomView()
    private lazy var titleLabel = UILabel()
    private lazy var signInUsername = FDTextField()
    private lazy var signInPassword = FDTextField()
    private lazy var signUpUsername = FDTextField()
    private lazy var signUpPassword = FDTextField()
    private lazy var signUpReEnterPass = FDTextField()
    private lazy var forgotLabel = UILabel()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    private lazy var verticalStack = UIStackView()
    private lazy var loader = UIActivityIndicatorView(style: .large)
    private lazy var loaderContainer = UIView()
    
    private var erroLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Constraints
    
    private var stackViewBottomCT = NSLayoutConstraint()
    
    // MARK: - Initializers
    
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupLayout()
        setupObservers()
    }
    
    deinit {
        stopKeyboardListener()
    }
    
    func  TGPress() {
        print("telegram")
    }
    
    func  VKPress() {
        print("VK")
    }
}

// MARK: - Layout

private extension LoginViewController {
    func setupLayout() {
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSingUpButton()
        case .signIn:
            setupBottomView()
            setupStack()
            setupSignInPassword()
            setupSignInUsername()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
            setupNavigationBar()
            setupErrorLabel()
        case .signUp:
            setupBottomView()
            setupStack()
            setupSignUpUsername()
            setupSignUpPass()
            setupSignUpReEnterPass()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
            setupNavigationBar()
            setupErrorLabel()
        }
        setupLoaderView()
    }
    
    func setupNavigationBar() {
        let backImage = UIImage(named: "Back")
        let backButtonItem = UIBarButtonItem(
            image: backImage,
            style: .plain,
            target: navigationController,
            action: #selector(navigationController?.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    func setupStack() {
        view.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 20
        
        switch state {
        case .initial:
            return
        case .signIn:
            verticalStack.addArrangedSubview(signInUsername)
            verticalStack.addArrangedSubview(signInPassword)
            self.bottomCTValue = -260
            stackViewBottomCT = verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: bottomCTValue)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackViewBottomCT
            ])
        case .signUp:
            verticalStack.addArrangedSubview(signUpUsername)
            verticalStack.addArrangedSubview(signUpPassword)
            verticalStack.addArrangedSubview(signUpReEnterPass)
            self.bottomCTValue = -230
            stackViewBottomCT = verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: bottomCTValue)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackViewBottomCT
            ])
        }
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.button1Action =  { [weak self] in
            self?.VKPress()
        }
        
        bottomView.button2Action = { [weak self] in
            self?.TGPress()
        }
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    func setupSignInPassword() {
        signInPassword.translatesAutoresizingMaskIntoConstraints = false
        signInPassword.placeholder = "Password"
        signInPassword.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            signInPassword.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signInPassword.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signInPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignInUsername()  {
        signInUsername.translatesAutoresizingMaskIntoConstraints = false
        signInUsername.placeholder = "Username"
        signInUsername.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            signInUsername.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signInUsername.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signInUsername.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        switch state {
        case .signIn:
            titleLabel.text = "Sign in"
            titleLabel.textColor = .white
        case .signUp:
            titleLabel.text = "Sign up"
            titleLabel.textColor = .white
        case .initial:
            return
        }
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
            titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupLogoImage() {
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "WhiteSeal")
        logoImage.layer.cornerRadius = 24
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 120),
            logoImage.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In")
        signInButton.scheme = .white
        signInButton.action = { [weak self] in
            self?.onSignInTapped()
        }
        
        switch state {
        case .initial:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 80),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signIn:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signUp:
            signInButton.setTitle("Sign Up")
            signInButton.action = { [weak self] in
                self?.onSignUpTapped()
            }
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    
    func setupSingUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up")
        signUpButton.scheme = .white
        signUpButton.action = { [weak self] in
            self?.onSignUpTapped()
        }
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupForgotLabel() {
        view.addSubview(forgotLabel)
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotLabel.text = "Forgot Password?"
        forgotLabel.textColor = .white
        
        NSLayoutConstraint.activate([
            forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            forgotLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30)
        ])
    }
    
    func setupSignUpPass() {
        signUpPassword.translatesAutoresizingMaskIntoConstraints = false
        signUpPassword.placeholder = "Enter Password"
        signUpPassword.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            signUpPassword.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpPassword.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signUpPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignUpUsername() {
        signUpUsername.translatesAutoresizingMaskIntoConstraints = false
        signUpUsername.placeholder = "Enter Username"
        signUpUsername.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            signUpUsername.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpUsername.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signUpUsername.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignUpReEnterPass() {
        signUpReEnterPass.translatesAutoresizingMaskIntoConstraints = false
        signUpReEnterPass.placeholder = "Re-enter Password"
        signUpReEnterPass.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            signUpReEnterPass.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpReEnterPass.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signUpReEnterPass.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupLoaderView() {
        view.addSubview(loaderContainer)
        loaderContainer.translatesAutoresizingMaskIntoConstraints = false
        loaderContainer.backgroundColor = .systemBlue
        loaderContainer.isHidden = true
        
        NSLayoutConstraint.activate([
            loaderContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            loaderContainer.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        loaderContainer.addSubview(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.color = .white
        
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: loaderContainer.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: loaderContainer.centerYAnchor)
        ])
    }
    
    func setupErrorLabel() {
        view.addSubview(erroLabel)
        erroLabel.isHidden = true
        erroLabel.textColor = .white
        erroLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            erroLabel.topAnchor.constraint(equalTo: forgotLabel.bottomAnchor, constant: 20),
            erroLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            erroLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        switch state {
        case .initial:
            return
        case .signIn:
            erroLabel.text = "Incorrect data"
        case.signUp:
            erroLabel.text = "Passwords don't match"
            
        }
    }
}

// MARK: - Private methods

private extension LoginViewController {
    
    func onBackPressed() {
    }
    
    func onSignInTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignIn()
        case .signIn:
            viewOutput.loginStart(login: signInUsername.text ?? "", password: signInPassword.text ?? "")
        case .signUp:
            viewOutput.registrationStart(login: signInUsername.text ?? "", password: signInPassword.text ?? "", reEnterPassword: signInPassword.text ?? "")
        }
    }
    
    func onSignUpTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignUp()
        case .signIn:
            viewOutput.loginStart(login: signInUsername.text ?? "", password: signInPassword.text ?? "")
        case .signUp:
            viewOutput.registrationStart(login: signUpUsername.text ?? "", password: signUpPassword.text ?? "", reEnterPassword: signUpReEnterPass.text ?? "")
        }
    }
    
    func onVKTapped() {
    }
    
    func onTGTapped() {
    }
    
    func onForgotTapped() {
    }
}

// MARK: - LoginViewInput delegate
extension LoginViewController: LoginViewInput {
    func showErrorLabel() {
        erroLabel.isHidden  = false
    }
    
    func startLoader() {
        loaderContainer.isHidden = false
        loader.startAnimating()
    }
    
    func stopLoader() {
        loaderContainer.isHidden = true
        loader.stopAnimating()
    }
    
    func hideNavigationItem() {
        navigationItem.leftBarButtonItem?.isHidden = true
    }
    
    func shakeButton() {
        signInButton.shake()
        erroLabel.shake()
    }
}

// MARK: - Keyboard listener

private extension LoginViewController {
    func setupObservers() {
        startKeyboardListener()
    }
    
    func startKeyboardListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_ :)), name: UIResponder.keyboardDidShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_ :)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_ :)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func stopKeyboardListener() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHieght = keyboardFrame.cgRectValue.height
        
        if !isKeyboardShow {
            UIView.animate(withDuration: 0.2) {
                self.stackViewBottomCT.constant -= keyboardHieght / 4
                self.view.layoutIfNeeded()
                self.isKeyboardShow = true
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        if isKeyboardShow {
            UIView.animate(withDuration: 0.2) {
                self.stackViewBottomCT.constant = self.bottomCTValue
                self.view.layoutIfNeeded()
                self.isKeyboardShow = false
            }
        }
    }
}
