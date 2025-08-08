//
//  DetailViewController.swift
//  Cuppa
//
//  Created by admin on 29.07.2025.
//

import UIKit

class DetailViewController: UIViewController {
    
    var drink: DrinkMenu?
    private let image = UIImageView()
    private let label = UILabel()
    
    init( drink: DrinkMenu? = nil) {
        super.init(nibName: nil, bundle: nil)
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

extension DetailViewController {
    
    func setupLayout() {
        setupImage()
        emptyLabel()
    }
    
    func setupImage() {
        view.addSubview(image)
        image.image = UIImage(named: "DetailPic")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0.5
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 220),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 350),
            image.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    func emptyLabel() {
        view.addSubview(label)
        label.text = "Page under construction"
        label.textColor = .lightGray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

