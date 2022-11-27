//
//  PanGestureViewController.swift
//  GestureProject
//
//  Created by 於泽辰 on 2022/11/27.
//

import UIKit

class PanGestureViewController: UIViewController {
    var currentPanPosition: CGPoint = .zero

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupPan()
    }
    
    private func setupPan() {
        let panView = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        panView.backgroundColor = .random
        view.addSubview(panView)
        
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan(gesture: )))
        
        panView.addGestureRecognizer(panGesture)
    }
    
    @objc func didPan(gesture: UIPanGestureRecognizer) {
        guard let theView = gesture.view else { return }
        gesture.view?.backgroundColor = .random
        let translation = gesture.translation(in: theView)
        if gesture.state == .began {
            self.currentPanPosition = theView.center
        } else if gesture.state == .changed {
            theView.center = CGPoint(x: currentPanPosition.x + translation.x, y: currentPanPosition.y + translation.y)
        }
    }
    
}
