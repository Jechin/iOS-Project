//
//  PasswdTextField.swift
//  LoginProject
//
//  Created by 於泽辰 on 2022/10/24.
//

import Foundation
import UIKit
import SnapKit

class PasswdTextField: UITextField {
    let visibleIcon = UIImageView(image: UIImage(named: "visible"))
    let invisibleIcon = UIImageView(image: UIImage(named: "invisible"))
    let passVisibleButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(tag: Int, placeholder: String) {
        self.init()
        self.tag = tag
        self.placeholder = "  " + placeholder
        self.layer.cornerRadius = 5
        self.font = UIFont.systemFont(ofSize: 14)
        self.textAlignment = .left
        self.isSecureTextEntry = true
        self.backgroundColor = .systemGray6
        self.keyboardType = .emailAddress
        self.rightViewMode = .always
        self.returnKeyType = .done
        self.leftView = .init(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        self.leftViewMode = .always
        self.clearsOnBeginEditing = true
        self.isSecureTextEntry = true
        
        initVisibleButton()
        print("1")
    }
    
    func initVisibleButton() {
        passVisibleButton.addSubview(visibleIcon)
        passVisibleButton.addSubview(invisibleIcon)
        visibleIcon.isHidden = true
        visibleIcon.snp.makeConstraints { make in
            make.center.equalTo(passVisibleButton.snp.center)
            make.width.equalTo(passVisibleButton.snp.width).multipliedBy(0.5)
            make.height.equalTo(passVisibleButton.snp.height).multipliedBy(0.5)
        }
        invisibleIcon.snp.makeConstraints { make in
            make.center.equalTo(passVisibleButton.snp.center)
            make.width.equalTo(passVisibleButton.snp.width).multipliedBy(0.5)
            make.height.equalTo(passVisibleButton.snp.height).multipliedBy(0.5)
        }
        passVisibleButton.addTarget(
            self,
            action: #selector(visibleClick),
            for: .touchUpInside
        )
        
        self.rightView = passVisibleButton
        passVisibleButton.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
    }
    
    @objc func visibleClick(_ btn: UIButton) {
        self.isSecureTextEntry = self.invisibleIcon.isHidden
        self.visibleIcon.isHidden = self.invisibleIcon.isHidden
        self.invisibleIcon.isHidden = self.invisibleIcon.isHidden ? false : true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
