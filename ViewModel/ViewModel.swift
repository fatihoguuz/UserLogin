//
//  ViewModel.swift
//  UserLogin
//
//  Created by Fatih Oğuz on 10.08.2024.
//

import Foundation
import UIKit

extension TextFieldCreatable {
    func createCustomTextField(frame: CGRect, backgroundColor: UIColor, textColor: UIColor, placeholder: String, cornerRadius: CGFloat, leftPadding: CGFloat) -> UITextField {
        let textField = UITextField(frame: frame)
        textField.backgroundColor = backgroundColor
        textField.textColor = textColor
        textField.placeholder = placeholder
        textField.layer.cornerRadius = cornerRadius
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: frame.height))
        textField.leftViewMode = .always
        return textField
    }
}
