//
//  OnboardingPartViewController.swift
//  Cuppa
//
//  Created by admin on 31.07.2025.
//

import UIKit

class OnboardingPartViewController: UIViewController {
    
    // MARK: - Properties
    
    var imageToShow: UIImage? {
        didSet {
            imageView.image = imageToShow
        }
    }
    
     var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
     var buttonText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    var descriptionText: String? 
    
    // MARK: - Views
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
//    private let bottomButton = UIButton()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: - Layout

private extension OnboardingPartViewController {
    func setupLayout() {
        setupView()
        setupImageView()
        setupTitleLabel()
        setupDescription()
    }
    
    func setupView() {
        view.backgroundColor = .systemBlue
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 400),
            imageView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.textColor = .white
        
        NSLayoutConstraint.activate([
           titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
           titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupDescription() {
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
           descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
           descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
           descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70)
        ])
    }
}
