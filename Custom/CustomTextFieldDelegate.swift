//
//  CustomTextFieldDelegate.swift
//  UserLogin
//
//  Created by Fatih Oğuz on 21.08.2024.
//

import UIKit

protocol CustomTextFieldDelegate: AnyObject{
    func didTapTextField(_ textField: UITextField)
}

class CustomTextField: UIView, UITextFieldDelegate {
    var delegate: CustomTextFieldDelegate?
   
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColorS.notOrange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameTF: UITextField = {
        let textField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.cornerRadius = 15
        textField.keyboardLayoutGuide.keyboardDismissPadding = 20
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let passwordTF: UITextField = {
        let textField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.cornerRadius = 15
        textField.keyboardLayoutGuide.keyboardDismissPadding = 20
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        nameTF.delegate = self
        passwordTF.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(nameTF)
        containerView.addSubview(passwordTF)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(nameTextFieldTapped))
             nameTF.addGestureRecognizer(tapGesture)
        nameTF.isUserInteractionEnabled = true

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            nameTF.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            nameTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            nameTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            nameTF.heightAnchor.constraint(equalToConstant: 50),

            passwordTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 10),
            passwordTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            passwordTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            passwordTF.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureTF(nameText:String? = nil,
                     passwordText: String? = nil,
                     backgroundColor: UIColor) {
        if let nameText = nameText {
              nameTF.placeholder = nameText
              nameTF.isHidden = false
          } else {
              nameTF.isHidden = true
          }
          
          if let passwordText = passwordText {
              passwordTF.placeholder = passwordText
              passwordTF.isHidden = false
             
          } else {
              passwordTF.isHidden = true
          }
        containerView.backgroundColor = backgroundColor
    }

}
extension CustomTextField {
    @objc private func nameTextFieldTapped() {
          delegate?.didTapTextField(nameTF)
      }
    @objc private func passwordTextFieldTapped() {
        delegate?.didTapTextField(passwordTF)
    }
}
