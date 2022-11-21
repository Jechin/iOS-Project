//
//  ViewController.swift
//  TableViewProject
//
//  Created by 於泽辰 on 2022/11/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var data: [MessageModel] = [
        MessageModel(imageId: 1, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 2, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 3, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 4, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 5, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 2, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 3, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 4, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 5, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 2, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 3, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 4, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 5, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 2, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 3, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 4, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21"),
        MessageModel(imageId: 5, name: "HUST iOS Club", abstract: "Hello World!", time: "Nov 21")
    ]
    
    private var messageList = {
        let tableView = UITableView()
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: MessageTableViewCell.identifier)
        tableView.rowHeight = 72
        tableView.showsVerticalScrollIndicator = true
        tableView.showsHorizontalScrollIndicator = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        self.view.addSubview(messageList)
        messageList.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        messageList.dataSource = self
        messageList.delegate = self
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.identifier) as? MessageTableViewCell {
            let model = data[indexPath.row]
            cell.portraitView.image = UIImage(named: "portrait-\(model.imageId)")
            cell.abstractLabel.text = model.abstract
            cell.nameLabel.text = model.name
            cell.timeLabel.text = model.time
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondView = SecondViewController()
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let removeAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, _ in
            self.data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        removeAction.backgroundColor = .systemRed
        let actions: [UIContextualAction] = [removeAction]
        let config = UISwipeActionsConfiguration(actions: actions)
        return config
    }
}
