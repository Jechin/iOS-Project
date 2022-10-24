//
//  OPTViewController.swift
//  LoginProject
//
//  Created by 於泽辰 on 2022/10/23.
//

import Foundation
import SnapKit
import UIKit

class OPTViewController: UIViewController {
    let emailTextField = UITextField()
    lazy var codeView: TDWVerifyCodeView = {
        let codeView = TDWVerifyCodeView.init(inputTextNum: 4)
        self.view.addSubview(codeView)
        return codeView
    }()
    
    var code: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackButton()
        setUpTitleLabel()
        setUpCodeTextField()
        setUpConfirmButton()
        setUpRememberButton()
        
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
            action: #selector(rememberClick),
            for: .touchUpInside
        )
        
        view.addSubview(backButton)
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
        titleLabel.text = "OPT Verification"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Menlo Regular", size: 30)
        titleLabel.textAlignment = .left
        titleLabel.adjustsFontSizeToFitWidth = true
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(30)
            make.top.equalTo(view.snp.top).offset(120)
        }
        
        detailLabel.text = "Enter the verification code we just sent on your email address."
        detailLabel.textColor = .gray
        detailLabel.font = .systemFont(ofSize: 14)
        detailLabel.textAlignment = .left
        detailLabel.adjustsFontSizeToFitWidth = true
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.numberOfLines = 2
        detailLabel.lineBreakStrategy = .standard
        
        view.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
            make.left.equalTo(titleLabel.snp.left)
        }
        
    }
    
    func setUpCodeTextField() {
        codeView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(35)
        }
        // 监听验证码输入的过程
        codeView.textValueChange = { str in
            print(str)
        }
        
        // 监听验证码输入完成
        codeView.inputFinish = { str in
            print(str)
            self.code = str
        }
        
    }
    
    func setUpEmailTextField() {
        emailTextField.placeholder = "  Enter your email"
        emailTextField.layer.cornerRadius = 10
        emailTextField.clearButtonMode = .whileEditing
        emailTextField.font = UIFont.systemFont(ofSize: 14)
        emailTextField.textColor = .black
        emailTextField.textAlignment = .left
        emailTextField.backgroundColor = .systemGray6
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = .done
        emailTextField.leftView = .init(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        emailTextField.leftViewMode = .always
        emailTextField.tag = 1
        
        view.addSubview(emailTextField)
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(254)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(56)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    
    func setUpConfirmButton() {
        let confirmButton = UIButton()
        confirmButton.setTitle("Verify", for: .normal)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.titleLabel?.font = .systemFont(ofSize: 14)
        confirmButton.titleLabel?.textAlignment = .center
        confirmButton.backgroundColor = .black
        confirmButton.layer.cornerRadius = 5
        confirmButton.addTarget(
            self,
            action: #selector(VerifyClick),
            for: .touchUpInside
        )
        
        view.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(56)
            make.top.equalTo(codeView.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    func setUpRememberButton() {
        let rememberButton = UIButton()
        rememberButton.setTitle("Don't receive code? Resend", for: .normal)
        rememberButton.setTitleColor(.black, for: .normal)
        rememberButton.titleLabel?.font = UIFont(name: "Menlo Bold", size: 14)
        rememberButton.titleLabel?.textAlignment = .center
        
        rememberButton.addTarget(
            self,
            action: #selector(rememberClick),
            for: .touchUpInside
        )
        
        view.addSubview(rememberButton)
        rememberButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-20)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    func showAlert(info: String) {
        let alertController = UIAlertController(
            title: info,
            message: "Please check your email and try again.",
            preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    @objc func rememberClick(_ btn: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func VerifyClick(_ btn: UIButton) {
        if self.code == "1111" {
            let newPassViewController = NewPassViewController()
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            self.navigationController?.pushViewController(newPassViewController, animated: true)
        }else {
            showAlert(info: "Wrong verification code")
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
