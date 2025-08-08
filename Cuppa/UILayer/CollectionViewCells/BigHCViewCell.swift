//
//  BigHCViewCell.swift
//  Cuppa
//
//  Created by admin on 29.07.2025.
//

import UIKit

class BigHCViewCell: UICollectionViewCell {
    
    let topView = UIView()
    let titleLabel = UILabel()
    let imageView = UIImageView()
    var isCategorySelected = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: DrinkMenu) {
        
        titleLabel.text = category.rawValue
        
        switch category {
        case .milkyWay:
            imageView.image = UIImage(named: "1")
        case .milkyNut:
            imageView.image = UIImage(named: "2")
        case .iceWorld:
            imageView.image = UIImage(named: "3")
        case .smallMoon:
            imageView.image = UIImage(named: "4")
        case .firstLull:
            imageView.image = UIImage(named: "5")
        case .sleepyOwl:
            imageView.image = UIImage(named: "6")
        case .warmDawn:
            imageView.image = UIImage(named: "7")
        case .purpleSky:
            imageView.image = UIImage(named: "8")
        case .youngDew:
            imageView.image = UIImage(named: "9")
        case .happyEnd:
            imageView.image = UIImage(named: "10")
        case .truelove:
            imageView.image = UIImage(named: "11")
        case .pureHeart:
            imageView.image = UIImage(named: "12")
        case .softTouch:
            imageView.image = UIImage(named: "13")
        case .wildFire:
            imageView.image = UIImage(named: "14")
        case .none:
            print(#function)
        }
    }
    
    func toggleSelection() {
        if isCategorySelected {
            topView.backgroundColor = .ypGray
            titleLabel.textColor = .ypDarkGray
        } else {
            topView.backgroundColor = .systemBlue
            titleLabel.textColor = .white
        }
        isCategorySelected.toggle()
    }
    
    func setupCell() {
        contentView.backgroundColor = .clear
        setupTopView()
        setupTitleLabel()
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
            topView.widthAnchor.constraint(equalToConstant: 130),
            topView.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        topView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: 80),
            imageView.widthAnchor.constraint(equalToConstant: 180),
            imageView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "title label"
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .ypDarkGray
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 15)
        ])
    }
}

