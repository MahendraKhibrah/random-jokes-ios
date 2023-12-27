//
//  LoginSection.swift
//  random jokes
//
//  Created by Mahendra Khibrah on 18/12/23.
//
import Foundation
import UIKit

class LoginSection: UIView {
    var titleLabel = makeLabel(withText: "Sign in", size: 20)
    var greetingLabel = makeLabel(withText: "Hello, welcome back!", size: 12)
    var phoneLabel = makeLabel(withText: "Phone Number", size: 12)
    var phoneTextField = makeTextField(withPlaceholderText: "input your phone number")
    var titleStackView = makeStackView(withOrientation: .vertical)
    var phoneStackView = makeStackView(withOrientation: .vertical)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        let screenWidth = UIScreen.main.bounds.width
        
        return CGSize(width: screenWidth, height: UIView.noIntrinsicMetric)
    }
}

extension LoginSection {
    func style() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(greetingLabel)
        
        phoneStackView.addArrangedSubview(phoneLabel)
        phoneStackView.addArrangedSubview(phoneTextField)
    }
    
    func layout() {
        addSubview(titleStackView)
        addSubview(phoneStackView)
        
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            phoneStackView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 40),
            phoneStackView.leadingAnchor.constraint(equalTo: titleStackView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            phoneTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            phoneTextField.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
