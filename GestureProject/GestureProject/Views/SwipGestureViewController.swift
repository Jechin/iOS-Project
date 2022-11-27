//
//  SwipGestureViewController.swift
//  GestureProject
//
//  Created by 於泽辰 on 2022/11/27.
//

import UIKit

class SwipGestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupSwip()
    }
    
    private func setupSwip() {
        let swipView = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        swipView.backgroundColor = .random
        view.addSubview(swipView)
        
        let swipGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwip(gesture: )))
        // 设置轻扫方向 
        swipGesture.direction = .down
        swipView.addGestureRecognizer(swipGesture)
    }
    
    @objc func didSwip(gesture: UISwipeGestureRecognizer) {
        gesture.view?.backgroundColor = .random
    }

}
