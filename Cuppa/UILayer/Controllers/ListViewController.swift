//
//  ListViewController.swift
//  Cuppa
//
//  Created by admin on 06.08.2025.
//

import UIKit

class ListViewController: UIViewController {
    
    let presenter: ListPresenter
    
    private let image = UIImageView()
    private let label = UILabel()
    private let titleLabel = UILabel()
    
    init(presenter: ListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = .white
    }
}

// MARK: - Layout

extension ListViewController {
    func setupLayout() {
        bigImage()
        emptyLabel()
        topTitleLabel()
    }
    
    func bigImage() {
        view.addSubview(image)
        image.image = UIImage(named: "3dHeart")
        image.alpha = 0.5
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 280),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 250),
            image.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func emptyLabel() {
        view.addSubview(label)
        label.text = "It's empty"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 0),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func topTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Favorite List"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        titleLabel.textColor = .ypDarkGray
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
