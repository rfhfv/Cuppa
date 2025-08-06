//
//  BigVCViewCell.swift
//  Cuppa
//
//  Created by admin on 29.07.2025.
//

import UIKit

class BigVCViewCell: UICollectionViewCell {
    
    let topView = UIView()
    let titleLabel = UILabel()
    let descriptionTitle = UILabel()
    let imageView = UIImageView()
    var isCategorySelected = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: NewsCategory) {
        
        titleLabel.text = category.rawValue
        
        switch category {
            
        case .firstNews:
            imageView.image = UIImage(named: "NewPlace")
        case .secondNews:
            imageView.image = UIImage(named: "Red eye")
        case .thirdNews:
            imageView.image = UIImage(named: "Grains")
        case .fourthNews:
            imageView.image = UIImage(named: "Tipot")
        case .fifthNews:
            imageView.image = UIImage(named: "Sokochai")
        case .sixthNews:
            imageView.image = UIImage(named: "Results")
        case .seventhNews:
            imageView.image = UIImage(named: "Exhibition")
        case .none:
            print()
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
    
    func configureDS(with categoryDS: DescriptionCategoty) {
        
        descriptionTitle.text = categoryDS.rawValue
        
        switch categoryDS {
            
        case .first:
            print()
        case .second:
            print()
        case .third:
            print()
        case .fourth:
            print()
        case .fifth:
            print()
        case .sixth:
            print()
        case .seventh:
            print()
        case .none:
            print()
        }
    }
    
    func setupCell() {
        contentView.backgroundColor = .clear
        setupTopView()
        setupBottomLabel()
        setupDescriptionTitle()
    }
    
    func setupTopView() {
        contentView.addSubview(topView)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .clear
        topView.layer.cornerRadius = 20
        topView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.widthAnchor.constraint(equalToConstant: 130),
            topView.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        topView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 140),
            imageView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    func setupBottomLabel() {
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "title label"
        titleLabel.textColor = .ypDarkGray
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            titleLabel.widthAnchor.constraint(equalToConstant: 150)
            
        ])
    }
    
    func setupDescriptionTitle() {
//        contentView.addSubview(descriptionTitle)
//        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
//        descriptionTitle.text = "Llafibvkf"
//        descriptionTitle.textColor = .ypDarkGray
//        descriptionTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        descriptionTitle.textAlignment = .left
//        descriptionTitle.numberOfLines = 0
//
//        NSLayoutConstraint.activate([
//            descriptionTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            descriptionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -30),
//            descriptionTitle.heightAnchor.constraint(equalToConstant: 50),
//            descriptionTitle.widthAnchor.constraint(equalToConstant: 150)
//            descriptionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
//        ])
    }
}

