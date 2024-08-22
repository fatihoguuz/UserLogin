//
//  SignUpVC.swift
//  UserLogin
//
//  Created by Fatih Oğuz on 10.08.2024.
//

import UIKit

class SignUpVC: UIViewController, CustomButtonDelegate, CustomTextFieldDelegate{
    
    private var nameTextField: CustomTextField = CustomTextField()
    private let passwordTextField: CustomTextField = CustomTextField()
    var saveButton : CustomButton = CustomButton()
    static let current: SignUpVC = SignUpVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupContraits()
        nameTextField.delegate = self
        passwordTextField.delegate = self
        saveButton.delegate = self
        view.bringSubviewToFront(nameTextField)
    }
    
    
    private func setupUI() {
         view.backgroundColor = AppColorS.darkOrange
         navigationController?.navigationBar.tintColor = AppColorS.navOrange
        //navigationItem.hidesBackButton = true
         view.addSubview(nameTextField)
         view.addSubview(passwordTextField)
         view.addSubview(saveButton)

         // `translatesAutoresizingMaskIntoConstraints` ayarları
         nameTextField.translatesAutoresizingMaskIntoConstraints = false
         passwordTextField.translatesAutoresizingMaskIntoConstraints = false
         saveButton.translatesAutoresizingMaskIntoConstraints = false
         
         // Diğer konfigürasyonlar
        nameTextField.configureTF(nameText: "Name", backgroundColor: AppColorS.notOrange)
        passwordTextField.configureTF(passwordText: "Password",backgroundColor: AppColorS.notOrange)
        saveButton.configure(title: "Save", backroundColor: AppColorS.buttonOrange)
    }
           private func setupContraits(){
               NSLayoutConstraint.activate([
               
                nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                     nameTextField.heightAnchor.constraint(equalToConstant: 70),

                     // passwordTextField Kısıtlamaları
                     passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: -20),
                     passwordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
                     passwordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
                     passwordTextField.heightAnchor.constraint(equalToConstant: 70),

                     // saveButton Kısıtlamaları
                     saveButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 120),
                     saveButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
                     saveButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
                     saveButton.heightAnchor.constraint(equalToConstant: 70)
               ])
           
        }
    func didTapTextField(_ textField: UITextField) {
        nameTextField.configureTF(nameText: "Enter Name", backgroundColor: AppColorS.notOrange)
        textField.backgroundColor = .lightGray
                textField.becomeFirstResponder()
    }
    
    func didTapButton(_ button: CustomButton) {
        saveButton.configure(title: "Success",backroundColor: .white)
        self.navigationController?.pushViewController(HomeVC(), animated: false)
    }
        
    }


