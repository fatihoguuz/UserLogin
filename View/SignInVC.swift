//
//  SignInVC.swift
//  UserLogin
//
//  Created by Fatih Oğuz on 10.08.2024.
//

import Foundation
import UIKit

class SignInVC: UIViewController, TextFieldCreatable {
    
    var nameTextField : UITextField?
    var passwordTextField : UITextField?
    var saveButton : UIButton?
    
    override func viewDidLoad() {
        view.backgroundColor = .orange
        setupUI()
        
    }
    
    func setupUI() {
        let nameTextField = createCustomTextField(
                    frame: CGRect(x: view.frame.width / 8, y: view.frame.height / 3, width: 300, height: 30),
                    backgroundColor: .white,
                    textColor: .black,
                    placeholder: "Name",
                    cornerRadius: 10,
                    leftPadding: 20     )
        view.addSubview(nameTextField)
        
     
        
        let passwordTextField = createCustomTextField(
                    frame: CGRect(x: view.frame.width / 8, y: view.frame.height / 2 - 50, width: 300, height: 30),
                    backgroundColor: .white,
                    textColor: .black,
                    placeholder: "Password",
                    cornerRadius: 10,
                    leftPadding: 20     )
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        
        saveButton = UIButton.init(frame: CGRect(x: view.frame.width / 8 , y: view.frame.height / 2 + 100 , width: 300, height: 40))
        saveButton?.setTitle("Save", for: .normal)
        saveButton?.tintColor = .black
        saveButton?.backgroundColor = .systemOrange
        saveButton?.layer.cornerRadius = 10
        saveButton?.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        view.addSubview(self.saveButton!)
    }
    
    @objc func saveButtonAction() {
        let goHomeVC = HomeVC()
        self.navigationController?.pushViewController(goHomeVC, animated: true)
    }
    
    
    
}
