//
//  NewPassViewController.swift
//  LoginProject
//
//  Created by 於泽辰 on 2022/10/24.
//

import Foundation
import SnapKit
import UIKit

class NewPassViewController: UIViewController {
    let newPasswdTextField = PasswdTextField(tag: 1, placeholder: "New Password")
    let confirmTextField = PasswdTextField(tag: 2, placeholder: "Confirm Password")
    
    let resetView = UIView()
    let successView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpResetView()
        setUpSuccessView()
        self.successView.isHidden = true
    }
    
    func setUpResetView() {
        self.view.addSubview(resetView)
        self.resetView.snp.makeConstraints { make in
            make.size.equalTo(self.view.snp.size)
            make.center.equalTo(self.view.snp.center)
        }
        setUpBackButton()
        setUpTitleLabel()
        setUpPassTextField()
        setUpConfirmButton()
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
        successTitle.text = "Password Changed!"
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
        detailLabel.text = "Your password has been changed successfully."
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
        
        self.resetView.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(35)
            make.top.equalTo(view.snp.top).offset(60)
            make.left.equalTo(20)
        }
    }
    
    func setUpTitleLabel() {
        let titleLabel = UILabel()
        let detailLabel = UILabel()
        titleLabel.text = "Create New Password"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Menlo Regular", size: 30)
        titleLabel.textAlignment = .left
        titleLabel.adjustsFontSizeToFitWidth = true
        
        self.resetView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(30)
            make.top.equalTo(view.snp.top).offset(120)
        }
        
        detailLabel.text = "Your new password must be unique from those previous used."
        detailLabel.textColor = .gray
        detailLabel.font = .systemFont(ofSize: 14)
        detailLabel.textAlignment = .left
        detailLabel.adjustsFontSizeToFitWidth = true
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.numberOfLines = 2
        detailLabel.lineBreakStrategy = .standard
        
        self.resetView.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
            make.left.equalTo(titleLabel.snp.left)
        }
        
    }
    
    func setUpPassTextField() {
        self.resetView.addSubview(self.newPasswdTextField)
        
        self.newPasswdTextField.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(254)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(56)
            make.centerX.equalTo(view.snp.centerX)
        }
        

        self.resetView.addSubview(self.confirmTextField)
        self.confirmTextField.snp.makeConstraints { make in
            make.top.equalTo(self.newPasswdTextField.snp.bottom).offset(10)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(56)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    
    func setUpConfirmButton() {
        let confirmButton = UIButton()
        confirmButton.setTitle("Reset Password", for: .normal)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.titleLabel?.font = .systemFont(ofSize: 14)
        confirmButton.titleLabel?.textAlignment = .center
        confirmButton.backgroundColor = .black
        confirmButton.layer.cornerRadius = 5
        confirmButton.addTarget(
            self,
            action: #selector(resetPasswdClick),
            for: .touchUpInside
        )
        
        self.resetView.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.size.equalTo(newPasswdTextField.snp.size)
            make.top.equalTo(confirmTextField.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    

    
    func showAlert(info: String) {
        let alertController = UIAlertController(
            title: info,
            message: info == "Invalid Password" ? "Password must contain uppercase and lowercase letters" : "Make sure you enter the same password twice and try again。",
            preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    @objc func backClick(_ btn: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func resetPasswdClick(_ btn: UIButton) {
        
        let pass1 = self.newPasswdTextField.text!
        let pass2 = self.confirmTextField.text!
        if pass1 != pass2 {
            showAlert(info: "Password does not match")
        }else if pass1.isValidatePasswd() {
            print("reset passwd")
            self.resetView.isHidden = true
            self.successView.isHidden = false
//            let optViewController = OPTViewController()
//            self.navigationController?.setNavigationBarHidden(true, animated: true)
//            self.navigationController?.pushViewController(optViewController, animated: true)
            
        }else {
            showAlert(info: "Invalid Password")
        }
    }
    
    @objc func backLoginButtonClick(_ btn: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

