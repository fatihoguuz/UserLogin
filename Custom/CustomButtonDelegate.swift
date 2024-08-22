//
//  CustomButtonDelegate.swift
//  UserLogin
//
//  Created by Fatih Oğuz on 21.08.2024.
//

import UIKit

protocol CustomButtonDelegate: AnyObject {
    func didTapButton(_ button: CustomButton)
}


class CustomButton: UIView {
    var delegate: CustomButtonDelegate?
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let testButton: UIButton = {
       let button = UIButton()
        button.tintColor = .white
        button.setTitleColor(UIColor.white ,for: .normal)
        button.backgroundColor = AppColorS.buttonOrange
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        //backgroundColor = .cyan
        addSubview(containerView)
        containerView.addSubview(testButton)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
            testButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            testButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            testButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            testButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        testButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    func configure(title: String,
                   backroundColor: UIColor? = AppColorS.buttonOrange,
                   titleColor: UIColor? = .black,
                   cornerRadius: CGFloat? = 10.0) {
        
        testButton.setTitle(title, for: .normal)
        testButton.backgroundColor = backroundColor
        testButton.setTitleColor(titleColor, for: .normal)
        testButton.layer.cornerRadius = cornerRadius ?? 10.0
    }
}

//MARK: - Selectors
extension CustomButton {
    @objc private func didTapButton() {
        delegate?.didTapButton(self)
    }
}

