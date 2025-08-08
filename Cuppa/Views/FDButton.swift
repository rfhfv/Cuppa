//
//  FDButton.swift
//  Cuppa
//
//  Created by admin on 02.08.2025.
//

import UIKit

enum FDButtomColorSchemes {
    case white
    case blue
    case gray
}

class FDButton: UIView {
    
    private let button = UIButton()
    var action: (() -> Void)?
    
    var scheme: FDButtomColorSchemes = .white {
        didSet {
            setColorScheme(scheme: scheme)
        }
    }
    
    init(scheme: FDButtomColorSchemes = .white) {
        super.init(frame: .zero)
        self.scheme = scheme
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .clear
        setupButton()
    }
    
    private func  setupButton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    @objc private func buttonPressed() {
        guard let action = self.action else { return }
        action()
    }
    
    private func setColorScheme(scheme: FDButtomColorSchemes) {
        switch scheme {
            
        case .white:
            button.backgroundColor = .white
            button.setTitleColor(.systemBlue, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        case .blue:
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        case .gray:
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    public func setTitle(_ title: String?) {
        button.setTitle(title, for: .normal)
    }
    
    func setLoginTarger(_ targer: Any?, action: Selector) {
        button.addTarget(targer, action: action, for: .touchUpInside)
    }
    
    func setRegistrationEnable(_ isEnabled: Bool) {
        button.isEnabled = isEnabled
        button.backgroundColor = isEnabled ? .blue : .gray
    }
}
