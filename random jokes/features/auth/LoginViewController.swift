//
//  ViewController.swift
//  random jokes
//
//  Created by Mahendra Khibrah on 18/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginSection = LoginSection()
    var submitButton = makeButton(withText: "Sign in")
    
    var registerStack = makeStackView(withOrientation: .horizontal)
    var redirectToRegisterLabel = makeLabel(withText: "Don't have an account?", size: 12)
    var registerLink = makeLinkText(withText: "Sign up", size: 12, target: nil, action: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        style()
        layout()
        
    }
    
    private func style(){
        loginSection.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        redirectToRegisterLabel.translatesAutoresizingMaskIntoConstraints = false
        registerLink.translatesAutoresizingMaskIntoConstraints = false
        
        registerStack.addArrangedSubview(redirectToRegisterLabel)
        registerStack.addArrangedSubview(registerLink)
    }
    
    private func layout(){
        view.addSubview(loginSection)
        NSLayoutConstraint.activate([
            loginSection.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            loginSection.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            loginSection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
        
        view.addSubview(submitButton)
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: loginSection.bottomAnchor, constant: 400),
            submitButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 10),
            submitButton.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor, constant: -10)
        ])
        
        view.addSubview(registerStack)
        NSLayoutConstraint.activate([
            registerStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerStack.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20)
        ])
    }
    
}

