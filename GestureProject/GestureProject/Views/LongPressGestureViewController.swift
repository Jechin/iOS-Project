//
//  LongPressGestureViewController.swift
//  GestureProject
//
//  Created by 於泽辰 on 2022/11/27.
//

import UIKit

class LongPressGestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupLongPress()
    }
    
    private func setupLongPress() {
        let longPressView = UIView()
        longPressView.backgroundColor = .random
        longPressView.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        view.addSubview(longPressView)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress(gesture: )))
        
        // 设置长按时间
        longPressGesture.minimumPressDuration = 1
        // 允许的移动距离
        longPressGesture.allowableMovement = 15
        
        longPressView.addGestureRecognizer(longPressGesture)
        
    }
    
    @objc func didLongPress(gesture: UILongPressGestureRecognizer) {
        gesture.view?.backgroundColor = .random
    }
}
