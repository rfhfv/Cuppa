//
//  FDCollectionTitle.swift
//  Cuppa
//
//  Created by admin on 30.07.2025.
//

import UIKit

class FDCollectionTitle: UITextField {
    
    let title = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
}


private extension FDCollectionTitle {
    func setupLayout() {
        congfigureView()
        configureTitle()
    }
    
    func congfigureView() {
        self.backgroundColor = .clear
    }
    
    func  configureTitle() {
        addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 18)
        title.text = "Title"
    }
}
