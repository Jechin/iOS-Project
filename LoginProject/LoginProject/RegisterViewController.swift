//
//  RegisterViewController.swift
//  LoginProject
//
//  Created by 於泽辰 on 2022/10/24.
//

import Foundation
import SnapKit
import UIKit

class RegisterViewController: UIViewController {
    let newPasswdTextField = PasswdTextField(tag: 1, placeholder: "Password")
    let confirmTextField = PasswdTextField(tag: 2, placeholder: "Confirm Password")
    let emailTextField = UITextField()
    let usernameTextField = UITextField()
    
    let registerView = UIView()
    let successView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUpResetView()
        setUpSuccessView()
        self.successView.isHidden = true
    }
    
    func setUpResetView() {
        self.view.addSubview(registerView)
        self.registerView.snp.makeConstraints { make in
            make.size.equalTo(self.view.snp.size)
            make.center.equalTo(self.view.snp.center)
        }
        setUpBackButton()
        setUpTitleLabel()
        setUpTextField()
        setUpPassTextField()
        setUpConfirmButton()
        setUpOtherLoginLabel()
        setUpAppleButton()
        setUpBackLoginButton()
    }
    
    func setUpSuccessView() {
        self.view.addSubview(successView)
        self.successView.snp.makeConstraints { make in
            make.size.equalTo(self.view.snp.size)
            make.center.equalTo(self.view.snp.center)
        }
        
        // setup image
        let successImage = UIImageView()
        successImage.image = UIImage(named: "success")
        successView.addSubview(successImage)
        successImage.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(300)
        }
        
        // setup title
        let successTitle = UILabel()
        successTitle.text = "Register Successfully!"
        successTitle.textColor = .black
        successTitle.font = UIFont(name: "Menlo Bold", size: 28)
        successTitle.textAlignment = .center
        self.successView.addSubview(successTitle)
        successTitle.snp.makeConstraints { make in
            make.top.equalTo(successImage.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        // setup detail
        let detailLabel = UILabel()
        detailLabel.text = "Account registration is successful."
        detailLabel.textColor = .systemGray3
        detailLabel.font = .systemFont(ofSize: 20)
        detailLabel.textAlignment = .center
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.numberOfLines = 2
        self.successView.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(successTitle.snp.bottom).offset(15)
            make.width.equalTo(view.snp.width).multipliedBy(0.6)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        
        // setup button
        let backLoginButton = UIButton()
        backLoginButton.setTitle("Back to Login", for: .normal)
        backLoginButton.setTitleColor(.white, for: .normal)
        backLoginButton.titleLabel?.font = .systemFont(ofSize: 14)
        backLoginButton.titleLabel?.textAlignment = .center
        backLoginButton.backgroundColor = .black
        backLoginButton.layer.cornerRadius = 5
        
        backLoginButton.addTarget(
            self,
            action: #selector(backLoginButtonClick),
            for: .touchUpInside
        )
        
        successView.addSubview(backLoginButton)
        backLoginButton.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(56)
            make.top.equalTo(558)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    func setUpBackButton() {
        let backButton = UIButton()
        let backPic = UIImageView()
        backPic.image = UIImage(named: "back")


        backButton.addSubview(backPic)

        backPic.snp.makeConstraints { make in
            make.center.equalTo(backButton.snp.center)
            make.height.equalTo(backButton.snp.height).multipliedBy(0.8)
            make.width.equalTo(backButton.snp.width).multipliedBy(0.8)
        }

        backButton.layer.borderColor = UIColor.systemGray5.cgColor
        backButton.layer.borderWidth = 1
        backButton.layer.cornerRadius = 10
        backButton.clipsToBounds = true
        
        backButton.addTarget(
            self,
            action: #selector(backClick),
            for: .touchUpInside
        )
        
        self.registerView.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(35)
            make.top.equalTo(view.snp.top).offset(60)
            make.left.equalTo(20)
        }
    }
    
    func setUpTitleLabel() {
        let titleLabel = UILabel()
//        let detailLabel = UILabel()
        titleLabel.text = "Hello! Register to started"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Menlo Regular", size: 30)
        titleLabel.textAlignment = .left
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 2
        
        self.registerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.85)
            make.left.equalTo(view.snp.left).offset(30)
            make.top.equalTo(view.snp.top).offset(120)
        }
        
//        detailLabel.text = "Your new password must be unique from those previous used."
//        detailLabel.textColor = .gray
//        detailLabel.font = .systemFont(ofSize: 14)
//        detailLabel.textAlignment = .left
//        detailLabel.adjustsFontSizeToFitWidth = true
//        detailLabel.lineBreakMode = .byWordWrapping
//        detailLabel.numberOfLines = 2
//        detailLabel.lineBreakStrategy = .standard
//
//        self.registerView.addSubview(detailLabel)
//        detailLabel.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(10)
//            make.centerX.equalTo(view.snp.centerX)
//            make.left.equalTo(titleLabel.snp.left)
//        }
        
    }
    
    func setUpTextField() {
        self.usernameTextField.placeholder = "  Username"
        self.usernameTextField.layer.cornerRadius = 10
        self.usernameTextField.clearButtonMode = .whileEditing
        self.usernameTextField.font = UIFont.systemFont(ofSize: 14)
        self.usernameTextField.textColor = .black
        self.usernameTextField.textAlignment = .left
        self.usernameTextField.backgroundColor = .systemGray6
        self.usernameTextField.keyboardType = .emailAddress
        self.usernameTextField.returnKeyType = .next
        self.usernameTextField.leftView = .init(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        self.usernameTextField.leftViewMode = .always
        
        self.registerView.addSubview(self.usernameTextField)
        self.usernameTextField.snp.makeConstraints{ make in
            make.top.equalTo(235)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(56)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        self.emailTextField.placeholder = "  Email"
        self.emailTextField.layer.cornerRadius = 10
        self.emailTextField.clearButtonMode = .whileEditing
        self.emailTextField.font = UIFont.systemFont(ofSize: 14)
        self.emailTextField.textColor = .black
        self.emailTextField.textAlignment = .left
        self.emailTextField.backgroundColor = .systemGray6
        self.emailTextField.keyboardType = .emailAddress
        self.emailTextField.returnKeyType = .next
        self.emailTextField.leftView = .init(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        self.emailTextField.leftViewMode = .always
        
        self.registerView.addSubview(emailTextField)
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.usernameTextField.snp.bottom).offset(10)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(56)
            make.centerX.equalTo(view.snp.centerX)
        }
        print("tt")
    }
    
    func setUpPassTextField() {
        self.registerView.addSubview(self.newPasswdTextField)
        
        self.newPasswdTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(10)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(56)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        print("tt")
        self.registerView.addSubview(self.confirmTextField)
        self.confirmTextField.snp.makeConstraints { make in
            make.top.equalTo(self.newPasswdTextField.snp.bottom).offset(10)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(56)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    
    func setUpConfirmButton() {
        let confirmButton = UIButton()
        confirmButton.setTitle("Register", for: .normal)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.titleLabel?.font = .systemFont(ofSize: 14)
        confirmButton.titleLabel?.textAlignment = .center
        confirmButton.backgroundColor = .black
        confirmButton.layer.cornerRadius = 5
        confirmButton.addTarget(
            self,
            action: #selector(registerClick),
            for: .touchUpInside
        )
        
        self.registerView.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.size.equalTo(newPasswdTextField.snp.size)
            make.top.equalTo(confirmTextField.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    func setUpOtherLoginLabel() {
        let textLabel = UILabel()
        textLabel.text = "Or Login With"
        textLabel.textColor = .darkGray
        textLabel.font = .systemFont(ofSize: 12)
        textLabel.textAlignment = .center
        
        self.registerView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(616)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        let dividingLine1 = UIView()
        dividingLine1.backgroundColor = .lightGray
        
        self.registerView.addSubview(dividingLine1)
        dividingLine1.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.right.equalTo(textLabel.snp.left).offset(-3)
            make.left.equalTo(22)
            make.centerY.equalTo(textLabel.snp.centerY)
        }
        
        let dividingLine2 = UIView()
        dividingLine2.backgroundColor = .lightGray
        
        self.registerView.addSubview(dividingLine2)
        dividingLine2.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.equalTo(textLabel.snp.right).offset(3)
            make.right.equalTo(view.snp.right).offset(-22)
            make.centerY.equalTo(textLabel.snp.centerY)
        }
    }
    
    func setUpAppleButton() {
        let appleButton = UIButton()
        let appleIcon = UIImageView()
        appleIcon.image = UIImage(named: "apple")
        
        appleButton.addSubview(appleIcon)
        appleIcon.snp.makeConstraints { make in
            make.center.equalTo(appleButton.snp.center)
            make.height.equalTo(appleButton.snp.height).multipliedBy(0.7)
            make.width.equalTo(appleButton.snp.height).multipliedBy(0.7)
        }
        appleButton.layer.borderColor = UIColor.lightGray.cgColor
        appleButton.layer.borderWidth = 1
        appleButton.layer.cornerRadius = 5
        
        self.registerView.addSubview(appleButton)
        appleButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-150)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width).multipliedBy(0.3)
            make.height.equalTo(50)
        }
        
    }
    
    func setUpBackLoginButton() {
        let backLoginButton = UIButton()
        backLoginButton.setTitle("Already have an account? Login Now", for: .normal)
        backLoginButton.setTitleColor(.black, for: .normal)
        backLoginButton.titleLabel?.font = UIFont(name: "Menlo Bold", size: 14)
        backLoginButton.titleLabel?.textAlignment = .center
        
        self.registerView.addSubview(backLoginButton)
        backLoginButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-20)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        backLoginButton.addTarget(
            self,
            action: #selector(backLoginButtonClick),
            for: .touchUpInside
        )
    }
    

    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    @objc func backClick(_ btn: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func registerClick(_ btn: UIButton) {
        let email = self.emailTextField.text!
        let username = self.usernameTextField.text!
        let pass1 = self.newPasswdTextField.text!
        let pass2 = self.confirmTextField.text!
        if username == "" {
            showAlert(title: "Invalid username", message: "Username can not be empty")
            return
        }
        if email == "" {
            showAlert(title: "Invalid email", message: "E-mail can not be empty")
            return
        }else if email.isValidateEmail() == false {
            showAlert(title: "Invalid email", message: "E-mail can not be empty, please check your email and try again")
            return
        }
        if pass1 != pass2 {
            showAlert(title: "Password does not match", message: "Make sure you enter the same password twice and try again")
            return
        }else if pass1.isValidatePasswd() {
            print("reset passwd")
            self.registerView.isHidden = true
            self.successView.isHidden = false
//            let optViewController = OPTViewController()
//            self.navigationController?.setNavigationBarHidden(true, animated: true)
//            self.navigationController?.pushViewController(optViewController, animated: true)
            
        }else {
            showAlert(title: "Invalid Password", message: "Password must contain uppercase and lowercase letters")
        }
    }
    
    @objc func backLoginButtonClick(_ btn: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}


