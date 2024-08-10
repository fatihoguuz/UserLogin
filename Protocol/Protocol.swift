//
//  Protocol.swift
//  UserLogin
//
//  Created by Fatih Oğuz on 10.08.2024.
//

import Foundation
import UIKit

protocol TextFieldCreatable {
    func createCustomTextField(
        frame: CGRect,
        backgroundColor: UIColor,
        textColor: UIColor,
        placeholder: String,
        cornerRadius: CGFloat,
        leftPadding: CGFloat ) -> UITextField
}
