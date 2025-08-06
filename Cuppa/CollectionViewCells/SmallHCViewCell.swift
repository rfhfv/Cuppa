//
//  SmallHCViewCell.swift
//  Cuppa
//
//  Created by admin on 29.07.2025.
//

import UIKit

class SmallHCViewCell: UICollectionViewCell {
    
    let topView = UIView()
    let bottomLabel = UILabel()
    let imageView = UIImageView()
    var isCategorySelected = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: DrinkCategory) {
        
        bottomLabel.text = category.rawValue
        
        switch category {
        case .coffee:
            imageView.image = UIImage(named: "3dCoffee")
        case .tea:
            imageView.image = UIImage(named: "3dTea")
        case .milkshake:
            imageView.image = UIImage(named: "3dMilkshake")
        case .matcha:
            imageView.image = UIImage(named: "3dMatcha")
        case .soda:
            imageView.image = UIImage(named: "3dSoda")
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 53),
                imageView.heightAnchor.constraint(equalToConstant: 53)])
        case .water:
            imageView.image = UIImage(named: "3dWater")
        case .food:
            imageView.image = UIImage(named: "3dFood")
        case .none:
            print(#function)
        }
    }
    
    func toggleSelection() {
        if isCategorySelected {
            topView.backgroundColor = .ypGray
        } else {
            topView.backgroundColor = .systemBlue
        }
        isCategorySelected.toggle()
    }
    
    func setupCell() {
        contentView.backgroundColor = .clear
        setupTopView()
        setupBottomLabel()
    }
    
    func setupTopView() {
        contentView.addSubview(topView)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .ypGray
        topView.layer.cornerRadius = 20
        topView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            topView.widthAnchor.constraint(equalToConstant: 70),
            topView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        topView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setupBottomLabel() {
        contentView.addSubview(bottomLabel)

       bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.text = "text label"
        bottomLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        bottomLabel.textColor = .ypDarkGray

        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 5),
            bottomLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
