# VerifyCode

验证码输入框，依赖于**SnapKit**

forked from https://github.com/zhongjianfeipqy/VerificationCode

## Sample Image

<img src="https://raw.githubusercontent.com/Jechin/PicLib/main/image/image-20221024151505348.png" alt="image-20221024151505348" style="zoom:50%;" />

## Usage

```swift
      // 初始化验证码输入框数量
    let codeView = TDWVerifyCodeView.init(inputTextNum: 6)

     // 监听验证码输入的过程
    codeView.textValueChange = { [weak self] str in
        // 要做的事情
    }
    
    // 监听验证码输入完成
    codeView.inputFinish = { [weak self] str in
        // 要做的事情
    }
```

