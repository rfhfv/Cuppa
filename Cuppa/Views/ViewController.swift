//
//  ViewController.swift
//  Cuppa
//
//  Created by admin on 28.07.2025.
//

//import UIKit
//
//class ViewController: UIViewController {
//
//
//    let phoneNumber = UITextField()
//    let password = UITextField()
//    let registrationButton = UIButton()
//    let logoImage = UIImageView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .white
////        self.hidesBottomBarWhenPushed = true
//        phoneNumber.delegate = self
//        password.delegate = self
//
//        view.addSubview(phoneNumber)
//        view.addSubview(password)
//        view.addSubview(registrationButton)
//        view.addSubview(logoImage)
//
//        logoImage.image = UIImage(named: "WhiteSeal")
//
//
//        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
//        password.translatesAutoresizingMaskIntoConstraints = false
//        registrationButton.translatesAutoresizingMaskIntoConstraints = false
//        logoImage.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
//            logoImage.widthAnchor.constraint(equalToConstant: 120),
//            logoImage.heightAnchor.constraint(equalToConstant: 120),
//
//            phoneNumber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            phoneNumber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            phoneNumber.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 90),
//            phoneNumber.heightAnchor.constraint(equalToConstant: 30),
//
//            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            password.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor, constant: 16),
//            password.heightAnchor.constraint(equalToConstant: 30),
//
//            registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            registrationButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 150),
//            registrationButton.widthAnchor.constraint(equalToConstant: 200),
//            registrationButton.heightAnchor.constraint(equalToConstant: 60)
//        ])
//
//        phoneNumber.placeholder = "enter number"
//        phoneNumber.backgroundColor = .white
//        phoneNumber.layer.borderWidth = 1
//        phoneNumber.layer.cornerRadius = 10
//        phoneNumber.layer.borderColor = UIColor.white.cgColor
//        phoneNumber.isSecureTextEntry = true
//        phoneNumber.keyboardType = .phonePad
//        phoneNumber.keyboardAppearance = .light
//        phoneNumber.clearButtonMode = .always
//
//        password.placeholder = "enter passowrd"
//        password.layer.borderWidth = 1
//        password.layer.cornerRadius = 10
//        password.layer.borderColor = UIColor.white.cgColor
//        password.backgroundColor = .white
//        password.isSecureTextEntry = true
//        password.keyboardAppearance = .light
//        password.clearButtonMode = .always
//
//        registrationButton.backgroundColor = .white
//        registrationButton.setTitle("Registration", for: .normal)
//        registrationButton.setTitleColor(.black, for: .normal)
//        registrationButton.layer.borderColor = UIColor.clear.cgColor
//        registrationButton.layer.cornerRadius = 16
//        registrationButton.layer.borderWidth = 3
//        registrationButton.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
//
//    }
//
//    @objc func pushButton() {
//        let controller = HomeViewController()
//        navigationController?.pushViewController(controller, animated: true)
//    }
//}
//
//extension ViewController: UITextFieldDelegate {
//
//}
