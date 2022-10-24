# PasswdTextField

带有是否隐藏按钮的密码输入框，依赖于**SnapKit**

## Sample Image

<img src="https://raw.githubusercontent.com/Jechin/PicLib/main/image/image-20221024145817296.png" alt="image-20221024145817296" style="zoom:50%;" />

## Usage

```swift
let newPasswdTextField = PasswdTextField(tag: 1, placeholder: "New Password")
let confirmTextField = PasswdTextField(tag: 2, placeholder: "Confirm Password")
self.view.addSubview(self.newPasswdTextField)
self.view.addSubview(self.confirmTextField)
self.newPasswdTextField.snp.makeConstraints { make in
    // do snp
}
self.confirmTextField.snp.makeConstraints { make in
    // do snp
}
```



