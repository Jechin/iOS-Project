//
//  ViewController.swift
//  CollectionViewProject
//
//  Created by 於泽辰 on 2022/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let entryModels: [EntryModel] = [
        .init(title: "例：单Section流式布局", description: "使用UICollectionViewFlowLayout实现的单小节的布局"),
        .init(title: "例：多Section组合布局", description: "使用UICollectionViewCompositionalLayout实现的多小节布局，其中每个小节布局方式不同"),
        .init(title: "TODO: 单Section流式布局", description: "上课实现：使用UICollectionViewFlowLayout实现的单小节的布局"),
        .init(title: "TODO：多Section组合布局", description: "上课实现：使用UICollectionViewCompositionalLayout实现的多小节布局，其中每个小节布局方式不同"),
    ]
    
    private let entryTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(EntryTableViewCell.self, forCellReuseIdentifier: EntryTableViewCell.identifier)
        tableView.rowHeight = 130
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        tableView.showsVerticalScrollIndicator = true
        tableView.showsHorizontalScrollIndicator = false
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        self.view.addSubview(entryTableView)
        entryTableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        entryTableView.dataSource = self
        entryTableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entryModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EntryTableViewCell.identifier) as? EntryTableViewCell {
            
            cell.setContext(model: self.entryModels[indexPath.row])
            return cell
        }else{
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0, 2:
            let vc = FlowViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1, 3:
            let vc = CompositionViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
