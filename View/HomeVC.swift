//
//  HomeVC.swift
//  UserLogin
//
//  Created by Fatih Oğuz on 10.08.2024.
//

import Foundation
import UIKit

private let successLabel: UILabel = {
  let label = UILabel()
    label.textColor = .white
    label.text = "SUCCESS"
    label.font = UIFont.boldSystemFont(ofSize: 60)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()

private let logOutButton: CustomButton = CustomButton()

class HomeVC: UIViewController, CustomButtonDelegate {

    override func viewDidLoad() {
        setupUI()
        setupContraits()
    }
    func setupUI(){
        navigationItem.hidesBackButton = true
        view.backgroundColor = AppColorS.darkOrange
        view.addSubview(successLabel)
        view.addSubview(logOutButton)
        logOutButton.delegate = self
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.configure(title: "Log Out", backroundColor: AppColorS.buttonOrange ,cornerRadius: 15)
    }
    
    private func setupContraits(){
        NSLayoutConstraint.activate([
            successLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            successLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            successLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            successLabel.heightAnchor.constraint(equalToConstant: 80),

            logOutButton.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 120),
            logOutButton.leadingAnchor.constraint(equalTo: successLabel.leadingAnchor),
            logOutButton.trailingAnchor.constraint(equalTo: successLabel.trailingAnchor),
            logOutButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    
    }
    func didTapButton(_ button: CustomButton) {
        self.navigationController?.pushViewController(LaunchVC(), animated: false)
    }
    }
 
  //  let goLaunchVC = LaunchVC()
 // self.navigationController?.pushViewController(goLaunchVC, animated: true)
