//
//  HomeVC.swift
//  UserLogin
//
//  Created by Fatih Oğuz on 10.08.2024.
//

import Foundation
import UIKit

var successLabel : UILabel?
var logOutButton : UIButton?

class HomeVC: UIViewController {
   
   
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemOrange
        
        successLabel = UILabel.init(frame: CGRect(x: Int(view.frame.width) / 5 - 20, y: Int(view.frame.height) / 4, width: 300, height: 100))
        successLabel?.textColor = .white
        successLabel?.text = "SUCCESS"
        successLabel?.font = UIFont.boldSystemFont(ofSize: 60)
        view.addSubview(successLabel!)
        
        logOutButton = UIButton.init(frame: CGRect(x: view.frame.width / 8 , y: view.frame.height / 2 + 100 , width: 300, height: 40))
        logOutButton?.setTitle("Log Out", for: .normal)
        logOutButton?.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        logOutButton?.backgroundColor = .white
        logOutButton?.layer.cornerRadius = 10
        logOutButton?.addTarget(self, action: #selector(LogOutButtonAction), for: .touchUpInside)
        view.addSubview(logOutButton!)
    }
    @objc func LogOutButtonAction() {
        let goLaunchVC = LaunchVC()
        self.navigationController?.pushViewController(goLaunchVC, animated: true)
    }
    }
