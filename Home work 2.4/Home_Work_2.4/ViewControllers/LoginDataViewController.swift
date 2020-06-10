//
//  ViewController.swift
//  Home_Work_2.4
//
//  Created by Юлия on 29.05.2020.
//  Copyright © 2020 Юлия. All rights reserved.
//

import UIKit

class LoginDataViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var messageView: UIView!
    
    @IBOutlet var wrongMessage: UIStackView!
    @IBOutlet var loginMessage: UIStackView!
    @IBOutlet var passwordMessage: UIStackView!
    
    @IBOutlet var logInCheck: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageView.layer.cornerRadius = 15
        hiddenMessage()
        self.userNameTextField.delegate = self
        self.passwordTextField.delegate = self
        userNameTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        if touches.first != nil  {
            if userNameTextField.isFirstResponder {
                userNameTextField.resignFirstResponder();
            }
            if passwordTextField.isFirstResponder {
                passwordTextField.resignFirstResponder()
            }
            super .touchesBegan(touches, with: event)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let tabBarController = segue.destination as! UITabBarController
           let destinationVC = tabBarController.viewControllers?.first as! SuccessfulLoginViewController
           
           if я{
               destinationVC.welcomeLabel = userNameTextField.text
           }
       }
    
    @IBAction func logInButton() {
        let loginData = LoginData.getLoginData()
        
        if userNameTextField.text != loginData.userName ||
            passwordTextField.text != loginData.password {
            showMessage(wrongMessage)
        } else {
            logInCheck.sendActions(for: .touchUpInside)
        }
    }
       
    @IBAction func inwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func OKButton() {
        hiddenMessage()
        passwordTextField.text = nil
    }
    
    
    @IBAction func forgotUserNameButton() {
       showMessage(loginMessage)
    }
    
    @IBAction func forgotPasswordButton() {
       showMessage(passwordMessage)
    }
    
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        switch textField {
        case userNameTextField: passwordTextField.becomeFirstResponder()
        case passwordTextField: logInButton()
        default: break
        }
        return true
}

    private func hiddenMessage() {
        messageView.isHidden = true
        loginMessage.isHidden = true
        passwordMessage.isHidden = true
        wrongMessage.isHidden = true
    }
    
    private func showMessage (_ sender: UIView) {
        messageView.isHidden = false
        view.bringSubviewToFront(messageView)
        
        switch sender.tag {
        case 0: wrongMessage.isHidden = false
        case 1: loginMessage.isHidden = false
        case 2: passwordMessage.isHidden = false
        default: break
        }
    }
}



