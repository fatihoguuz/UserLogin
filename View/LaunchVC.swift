//
//  LaunchVC.swift
//  UserLogin
//
//  Created by Fatih Oğuz on 10.08.2024.
//

import Foundation
import UIKit

class LaunchVC: UIViewController {
    
    var toSignUpButton : UIButton?
    var toSignInButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemOrange
        let imageView = UIImageView(frame: CGRect(x: view.frame.width / 18, y: view.frame.height / 8, width: 350, height: 350))
        imageView.image = UIImage.init(named: "2")
        view.addSubview(imageView)
        
        
        toSignUpButton = UIButton.init(frame: CGRect(x: (view.frame.width - 300) / 2, y: view.frame.height / 2 + 200, width: 120, height: 80))
        toSignUpButton?.setTitle("Sign Up", for: .normal)
        toSignUpButton?.tintColor = .black
        toSignUpButton?.backgroundColor = .orange
        toSignUpButton?.layer.cornerRadius = 10
        toSignUpButton?.addTarget(self, action: #selector(toSignUp), for:.touchUpInside )
        view.addSubview(self.toSignUpButton!)
        
        toSignInButton = UIButton.init(frame: CGRect(x: (view.frame.width + 50) / 2, y: view.frame.height / 2 + 200, width: 120, height: 80))
        toSignInButton?.setTitle("Sign In", for: .normal)
        toSignInButton?.tintColor = .black
        toSignInButton?.backgroundColor = .orange
        toSignInButton?.layer.cornerRadius = 10
        toSignInButton?.addTarget(self, action: #selector(toSignIn), for:.touchUpInside )
        view.addSubview(self.toSignInButton!)
    }

    @objc func toSignUp() {
        let goSignUpVC = SignUpVC()
        self.navigationController?.pushViewController(goSignUpVC, animated: true)

    }
    @objc func toSignIn() {
        let goSignInVC = SignInVC()
        self.navigationController?.pushViewController(goSignInVC, animated: true)

    }

}

