//
//  ViewController.swift
//  GestureProject
//
//  Created by 於泽辰 on 2022/11/27.
//

import UIKit
import SnapKit
/*
 
 基类：UIGestureRecognizer
 
 一些常见的系统手势：
 点击手势：UITapGestureRecognizer
 长按手势：UILongPressGestureRecognizer
 滑动（扫动）手势：UISwipeGestureRecognizer
 拖动手势：UIPanGestureRecognizer
 捏合手势：UIPinchGestureRecognizer
 旋转手势：UIRotationGestureRecognizer
 
 */

class ViewController: UIViewController {
    
    let entryModels: [EntryModel] = [
        .init(title: "UITapGestureRecognizer", describe: "点击手势"),
        .init(title: "UILongPressGestureRecognizer", describe: "长按手势"),
        .init(title: "UISwipeGestureRecognizer", describe: "滑动（扫动）手势"),
        .init(title: "UIPanGestureRecognizer", describe: "拖动手势"),
        .init(title: "UIPanGestureRecognizer", describe: "画图demo"),
        .init(title: "UIPinchGestureRecognizer", describe: "捏合手势(nil)"),
        .init(title: "UIRotationGestureRecognizer", describe: "旋转手势(nil)")
    ]
    
    private let entryTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(EntryTableViewCell.self, forCellReuseIdentifier: EntryTableViewCell.identifier)
        
        tableView.rowHeight = 100
        tableView.showsVerticalScrollIndicator = true
        tableView.showsHorizontalScrollIndicator = false
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor =  .white
        view.addSubview(entryTableView)
        entryTableView.snp.makeConstraints { make in
            make.center.height.width.equalToSuperview()
        }
        
        entryTableView.dataSource = self
        entryTableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entryModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EntryTableViewCell.identifier) as? EntryTableViewCell {
            cell.setContent(
                title: self.entryModels[indexPath.row].title,
                describe: self.entryModels[indexPath.row].describe)
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        print(self.entryModels[indexPath.row].title)
        
        switch row {
        case 0:
            let vc = TapGestureViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = LongPressGestureViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = SwipGestureViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = PanGestureViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = DrawViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: CGFloat(arc4random() % 256) / 255,
            green: CGFloat(arc4random() % 256) / 255,
            blue: CGFloat(arc4random() % 256) / 255,
            alpha: 1
        )
    }
}
