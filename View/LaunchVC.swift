//
//  LaunchVC.swift
//  UserLogin
//
//  Created by Fatih Oğuz on 10.08.2024.
//

import UIKit

class LaunchVC: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - UIComponents
    private let toSignUpButton: CustomButton = CustomButton()
    private let toSignInButton: CustomButton = CustomButton()
    private let launchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    static let current: LaunchVC = LaunchVC()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupContraits()
        toSignInButton.delegate = self
        toSignUpButton.delegate = self
    }
}
//MARK: - SetupUI
extension LaunchVC {
    private func setupUI() {
        navigationItem.hidesBackButton = true
        view.backgroundColor = AppColorS.darkOrange
        view.addSubview(launchImageView)
        view.addSubview(toSignUpButton)
        view.addSubview(toSignInButton)
        view.addSubview(containerView)
        view.sendSubviewToBack(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        toSignInButton.translatesAutoresizingMaskIntoConstraints = false
        toSignInButton.configure(title: "Sing In" , cornerRadius: 20)
        toSignUpButton.translatesAutoresizingMaskIntoConstraints = false
        toSignUpButton.configure(title: "Sing Up",cornerRadius: 20)
        containerView.backgroundColor = AppColorS.addOrange
    }
    
    private func setupContraits() {
        let imageHeight = view.bounds.height * 0.4
        let containerHeight = view.bounds.height * 0.7
        
        NSLayoutConstraint.activate([
            launchImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            launchImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            launchImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            launchImageView.heightAnchor.constraint(equalToConstant: imageHeight),
            
            toSignUpButton.topAnchor.constraint(equalTo: launchImageView.bottomAnchor, constant: 100),
            toSignUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            toSignUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            toSignUpButton.heightAnchor.constraint(equalToConstant: 70),
            
            toSignInButton.topAnchor.constraint(equalTo: toSignUpButton.bottomAnchor, constant: 30),
            toSignInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            toSignInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            toSignInButton.heightAnchor.constraint(equalToConstant: 70),
            
            containerView.topAnchor.constraint(equalTo: launchImageView.bottomAnchor, constant: 50),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            containerView.heightAnchor.constraint(equalToConstant: containerHeight),
        ])
    }
}
//MARK: - Selectors
extension LaunchVC: CustomButtonDelegate {
    func didTapButton(_ button: CustomButton) {
        if button == toSignUpButton {
            let goSignUpVC = SignUpVC()
            self.navigationController?.pushViewController(goSignUpVC, animated: false)
        } else if button == toSignInButton {
            let goSignInVC = SignInVC()
            self.navigationController?.pushViewController(goSignInVC, animated: false)
        }
    }
}
