//
//  DetailViewController.swift
//  Cuppa
//
//  Created by admin on 29.07.2025.
//

import UIKit

class DetailViewController: UIViewController {
    private let drinkName: String
    
    init(drinkName: String) {
        self.drinkName = drinkName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        let label = UILabel()
        label.text = "You chose: \(drinkName)"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

