//
//  FDSearchField.swift
//  Cuppa
//
//  Created by admin on 30.07.2025.
//

import UIKit

class FDSearchField: UITextField {
    init() {
        super.init(frame: .zero)
    setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    func setupLayout() {
        
        self.layer.cornerRadius = 24
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 2
        self.placeholder = "Search"
        let imageView = UIImageView(frame: CGRect(x: 20, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: "loupe")
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20 + 20 + 10, height: 24))
        leftPaddingView.addSubview(imageView)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        self.leftView = leftPaddingView
        self.rightView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
}
