//
//  TapGestureViewController.swift
//  GestureProject
//
//  Created by 於泽辰 on 2022/11/27.
//

import UIKit

class TapGestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupTap()
    }
    
    private func setupTap() {
        let tapView = UIView()
        view.addSubview(tapView)
        tapView.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        tapView.backgroundColor = .blue
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap(gesture: )))
        
        // 设置触发手势需要的点击次数
        tapGesture.numberOfTapsRequired = 1
        
        tapView.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTap(gesture: UITapGestureRecognizer) {
        gesture.view?.backgroundColor = UIColor.random
    }
}
