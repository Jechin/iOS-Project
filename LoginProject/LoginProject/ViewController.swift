//
//  ViewController.swift
//  LoginProject
//
//  Created by 於泽辰 on 2022/10/22.
//

import SnapKit
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let loginView = UIView()
    let successView = UIView()
    let emailTextField = UITextField()
    let passwdTextField = PasswdTextField(tag: 1, placeholder: "Enter your password")

    override func viewDidLoad() {
        super.viewDidLoad()
        showLoginWinsow()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.view.backgroundColor = .white
    }
    
    func showLoginWinsow() {
        setUpSuccessView()
        setUpLoginView()
        switchLoginView()
    }
    
    func setUpLoginView() {
        loginView.backgroundColor = .white
        view.addSubview(loginView)
        
        loginView.snp.makeConstraints { make in
            make.size.equalTo(view.snp.size)
            make.center.equalTo(view.snp.center)
        }
        
        setUpBackButton()
        setUpWelcomeTextLabel()
        setUpInputTextField()
        setUpForgetButton()
        setUpLoginButton()
        setUpRegisterButton()
        setUpOtherLoginLabel()
        setUpAppleButton()

    }
    
    func setUpSuccessView() {
        successView.backgroundColor = .white
        view.addSubview(successView)
        
        successView.snp.makeConstraints { make in
            make.size.equalTo(view.snp.size)
            make.center.equalTo(view.snp.center)
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
        successTitle.text = "Login Successfully!"
        successTitle.textColor = .black
        successTitle.font = UIFont(name: "Menlo Bold", size: 28)
        successTitle.textAlignment = .center
        successView.addSubview(successTitle)
        successTitle.snp.makeConstraints { make in
            make.top.equalTo(successImage.snp.bottom).offset(30)
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
            make.top.equalTo(508)
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
        
        loginView.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.height.equalTo(41)
            make.width.equalTo(41)
            make.top.equalTo(56)
            make.left.equalTo(22)
            
        }
        
    }
    
    func setUpWelcomeTextLabel() {
        let welcomeTextLabel = UILabel()
        welcomeTextLabel.text = "Welcome back! Glad to see you, Again!"
        welcomeTextLabel.textColor = .black
        welcomeTextLabel.font = UIFont(name: "Menlo Bold", size: 30)
        welcomeTextLabel.textAlignment = .left
        welcomeTextLabel.adjustsFontSizeToFitWidth = true
        welcomeTextLabel.lineBreakMode = .byWordWrapping
        welcomeTextLabel.numberOfLines = 2
        welcomeTextLabel.lineBreakStrategy = .standard
        
        loginView.addSubview(welcomeTextLabel)
        welcomeTextLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(125)
            make.width.equalTo(view.snp.width).multipliedBy(0.85)
        }
        
    }
    
    func setUpInputTextField() {
        
//        let passIsVisible = UIButton()
        
        emailTextField.placeholder = "  Enter your email"
        emailTextField.layer.cornerRadius = 10
        emailTextField.clearButtonMode = .whileEditing
        emailTextField.font = UIFont.systemFont(ofSize: 14)
        emailTextField.textColor = .black
        emailTextField.textAlignment = .left
        emailTextField.backgroundColor = .systemGray6
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = .next
        emailTextField.leftView = .init(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        emailTextField.leftViewMode = .always
        
        loginView.addSubview(emailTextField)
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(235)
            make.width.equalTo(331)
            make.height.equalTo(56)
            make.centerX.equalTo(view.snp.centerX)
        }
        

//        passwdTextField.placeholder = "  Enter your password"
//        passwdTextField.layer.cornerRadius = 5
//        passwdTextField.font = UIFont.systemFont(ofSize: 14)
//        passwdTextField.textAlignment = .left
//        passwdTextField.isSecureTextEntry = true
//        passwdTextField.backgroundColor = .systemGray6
//        passwdTextField.keyboardType = .emailAddress
//        passwdTextField.rightViewMode = .always
//        passwdTextField.returnKeyType = .done
//        passwdTextField.leftView = .init(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
//        passwdTextField.leftViewMode = .always
//        passwdTextField.clearsOnBeginEditing = true
        
        
//        let visibleIcon = UIImageView(image: UIImage(named: "visible"))
//        let invisibleIcon = UIImageView(image: UIImage(named: "invisible"))
//
//        passIsVisible.addSubview(visibleIcon)
//        passIsVisible.addSubview(invisibleIcon)
//        visibleIcon.isHidden = true
//
//        visibleIcon.snp.makeConstraints { make in
//            make.center.equalTo(passIsVisible.snp.center)
//            make.width.equalTo(passIsVisible.snp.width).multipliedBy(0.5)
//            make.height.equalTo(passIsVisible.snp.height).multipliedBy(0.5)
//        }
//        invisibleIcon.snp.makeConstraints { make in
//            make.center.equalTo(passIsVisible.snp.center)
//            make.width.equalTo(passIsVisible.snp.width).multipliedBy(0.5)
//            make.height.equalTo(passIsVisible.snp.height).multipliedBy(0.5)
//        }
//        passwdTextField.rightView = passIsVisible
//
//        passIsVisible.snp.makeConstraints { make in
//            make.width.equalTo(56)
//            make.height.equalTo(56)
//        }
        loginView.addSubview(passwdTextField)

        passwdTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.width.equalTo(331)
            make.height.equalTo(56)
            make.centerX.equalTo(view.snp.centerX)
        }
        
//        passIsVisible.addTarget(
//            self,
//            action: #selector(passwdVisibleClick),
//            for: .touchUpInside
//        )
    }
    

    
    func setUpForgetButton() {
        let forgetButton = UIButton()
        forgetButton.setTitle("Forgot Password?", for: .normal)
        forgetButton.setTitleColor(.gray, for: .normal)
        forgetButton.titleLabel?.font = .systemFont(ofSize: 14)
        forgetButton.titleLabel?.textAlignment = .right
        
        forgetButton.addTarget(
            self,
            action: #selector(forgotButtonClick),
            for: .touchUpInside
        )
        
        loginView.addSubview(forgetButton)
        forgetButton.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(-35)
            make.top.equalTo(380)
            make.height.equalTo(25)
        }
    }
    

    func setUpLoginButton() {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 14)
        loginButton.titleLabel?.textAlignment = .center
        loginButton.backgroundColor = .black
        loginButton.layer.cornerRadius = 5

        loginButton.addTarget(
            self,
            action: #selector(loginButtonClick),
            for: .touchUpInside
        )
        
        loginView.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(331)
            make.height.equalTo(56)
            make.top.equalTo(424)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    func setUpOtherLoginLabel() {
        let textLabel = UILabel()
        textLabel.text = "Or Login With"
        textLabel.textColor = .darkGray
        textLabel.font = .systemFont(ofSize: 12)
        textLabel.textAlignment = .center
        
        loginView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(521)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        let dividingLine1 = UIView()
        dividingLine1.backgroundColor = .lightGray
        
        loginView.addSubview(dividingLine1)
        dividingLine1.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.right.equalTo(textLabel.snp.left).offset(-3)
            make.left.equalTo(22)
            make.centerY.equalTo(textLabel.snp.centerY)
        }
        
        let dividingLine2 = UIView()
        dividingLine2.backgroundColor = .lightGray
        
        loginView.addSubview(dividingLine2)
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
        
        loginView.addSubview(appleButton)
        appleButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-250)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width).multipliedBy(0.3)
            make.height.equalTo(50)
        }
        
    }
    
    func setUpRegisterButton() {
        let registerButton = UIButton()
        registerButton.setTitle("Don't have an account? Register Now", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.titleLabel?.font = UIFont(name: "Menlo Bold", size: 14)
        registerButton.titleLabel?.textAlignment = .center
        
        loginView.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-20)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        registerButton.addTarget(
            self,
            action: #selector(registerClick),
            for: .touchUpInside
        )
    }
    
    func switchSuccessView() {
        loginView.isHidden = true
        successView.isHidden = false

    }
    
    func switchLoginView() {
        loginView.isHidden = false
        successView.isHidden = true
    }
    
    func checkUpLoginInfo(email: String, passwd: String) -> Int {
        if email.isValidateEmail() {
            if passwd.isValidatePasswd() {
                return 0
            }else{
                return 2
            }
        }else{
            return 1
        }
    }
    
    func showAlert(info: String) {
        let alertController = UIAlertController(
            title: info,
            message: info == "Invalid Password" ? "Password must contain uppercase and lowercase letters" : info,
            preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
//    @objc func passwdVisibleClick(_ btn: UIButton) {
//        if passwdTextField.isSecureTextEntry {
//            passwdTextField.isSecureTextEntry = false
//            for subIcon in btn.subviews {
//                subIcon.isHidden = subIcon.isHidden ? false : true
//            }
//        }else {
//            passwdTextField.isSecureTextEntry = true
////            btn.setImage(UIImage(named: "invisible"), for: .normal)
////            btn.imageView?.contentMode = .scaleAspectFit
//            for subIcon in btn.subviews {
//                subIcon.isHidden = subIcon.isHidden ? false : true
//            }
//        }
//    }
    
    @objc func forgotButtonClick(_ btn: UIButton) {
        let forgotViewController = ForgotViewController()
        self.navigationController?.pushViewController(forgotViewController, animated: true)
    }
    
    @objc func backLoginButtonClick(_ btn: UIButton) {
        switchLoginView()
    }
    
    @objc func loginButtonClick(_ btn: UIButton) {
        let email = emailTextField.text!
        let passwd = passwdTextField.text!
        switch checkUpLoginInfo(email: email, passwd: passwd) {
        case 0: switchSuccessView()
        case 1: showAlert(info: "Invalid Email")
        case 2: showAlert(info: "Invalid Password")
        default:
            break
        }
    }
    
    @objc func registerClick(_ btn: UIButton) {
        let registerViewController = RegisterViewController()
        
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
}

extension String{
    func isValidateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with:self)
    }
    
    func isValidatePasswd() -> Bool {
        if self.count < 4 {
            return false
        }
        var upper = false
        var lower = false
        for char in self {
            if char >= "a" && char <= "z" {
                lower = true
                if upper && lower {
                    return true
                }
            }else if char >= "A" && char <= "Z"{
                upper = true
                if upper && lower {
                    return true
                }
            }
        }
        return false
    }
}
