//
//  DrawViewController.swift
//  GestureProject
//
//  Created by 於泽辰 on 2022/11/27.
//

import UIKit

class DrawViewController: UIViewController {
    
    private var startPanPosition: CGPoint = .zero
    private var allPoints: [CGPoint] = []
    
    private let lineLayer = CAShapeLayer()
    private let roundLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupGesture()
        setupLayer()
    }
    
    private func setupGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan(gesture: )))
        
        view.addGestureRecognizer(panGesture)
        
    }
    
    private func setupLayer() {
        view.layer.addSublayer(roundLayer)
        roundLayer.lineWidth = 2
        roundLayer.fillColor = UIColor.systemGray3.cgColor
        roundLayer.strokeColor = UIColor.systemGray5.cgColor
        
        view.layer.addSublayer(lineLayer)
        lineLayer.fillColor = nil
        lineLayer.lineWidth = 5
        lineLayer.strokeColor = UIColor.red.cgColor
    }
    
    private func updateLineLayer() {
        if allPoints.isEmpty {
            lineLayer.path = nil
            lineLayer.setNeedsLayout()
        } else {
            let path = UIBezierPath()
            path.move(to: allPoints[0])
            
            for i in 1..<allPoints.count {
                path.addLine(to: allPoints[i])
            }
            lineLayer.path = path.cgPath
            lineLayer.setNeedsLayout()
        }
    }
    
    private func updateRoundLayer(point: CGPoint) {
        let path = CGMutablePath()
        let radius: CGFloat = 20
        path.addEllipse(in: .init(x: point.x-radius, y: point.y-radius, width: 2 * radius, height: 2 * radius))
        roundLayer.path = path
    }
    
    
    @objc func didPan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            allPoints.removeAll()
            startPanPosition = gesture.location(ofTouch: 0, in: view)
            allPoints.append(startPanPosition)
            updateRoundLayer(point: allPoints[0])
        case .changed:
            allPoints.append(gesture.location(ofTouch: 0, in: view))
            updateRoundLayer(point: allPoints[allPoints.count - 1])
        case .ended:
            roundLayer.path = nil
        default:
            break
        }
//        print(allPoints)
        updateLineLayer()
        
    }


}
