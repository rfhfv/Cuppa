//
//  ProfileViewController.swift
//  Cuppa
//
//  Created by admin on 06.08.2025.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let presenter: ProfilePresenter
    private let signOutButton = FDButton()
    private var profileImage = UIImageView()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 20
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    init(presenter: ProfilePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
}

// MARK: - Layout

extension ProfileViewController {
    func setupLayout() {
        setupProfileImage()
        setupStackView()
        setupSignOutButton()
    }
    
    func setupProfileImage() {
        profileImage.image = UIImage(named: "3dProfile")
        view.addSubview(profileImage)
        profileImage.alpha = 0.9
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 130),
            profileImage.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        stackView.addArrangedSubview(makeMenuButton(iconName: "person", text: "My Profile"))
        stackView.addArrangedSubview(makeMenuButton(iconName: "key", text: "Change Password"))
        stackView.addArrangedSubview(makeMenuButton(iconName: "dollarsign.circle", text: "Payment Settings"))
        stackView.addArrangedSubview(makeMenuButton(iconName: "person.3", text: "About Us"))
        
        func makeMenuButton(iconName: String, text: String) -> UIView {
            let container = UIView()
            container.backgroundColor = .clear
            container.layer.cornerRadius = 25
            container.layer.borderWidth = 1
            container.layer.borderColor = UIColor(white: 0.85, alpha: 1).cgColor
            container.translatesAutoresizingMaskIntoConstraints = false
            container.heightAnchor.constraint(equalToConstant: 55).isActive = true
            let iconImageView = UIImageView(image: UIImage(systemName: iconName))
            iconImageView.tintColor = .gray
            iconImageView.contentMode = .scaleAspectFit
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            iconImageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
            
            let label = UILabel()
            label.text = text
            label.font = UIFont.systemFont(ofSize: 18)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            let hStack = UIStackView(arrangedSubviews: [iconImageView, label])
            hStack.axis = .horizontal
            hStack.spacing = 12
            hStack.alignment = .center
            hStack.translatesAutoresizingMaskIntoConstraints = false
            
            container.addSubview(hStack)
            NSLayoutConstraint.activate([
                hStack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
                hStack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
                hStack.topAnchor.constraint(equalTo: container.topAnchor),
                hStack.bottomAnchor.constraint(equalTo: container.bottomAnchor)
            ])
            return container
        }
    }
    
    func setupSignOutButton() {
        view.addSubview(signOutButton)
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.setTitle("Sign Out")
        signOutButton.scheme = .blue
        
        NSLayoutConstraint.activate([
            signOutButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 55),
            signOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signOutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

