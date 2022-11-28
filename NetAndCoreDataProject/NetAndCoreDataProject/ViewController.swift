//
//  ViewController.swift
//  NetAndCoreDataProject
//
//  Created by 於泽辰 on 2022/11/28.
//

import UIKit

class ViewController: UIViewController {
    
    private var fileData: [ArticleModel] = [
        ArticleModel(biz: "test", pdfID: "", title: "这是一条数据", url: "", cover: "", publishTime: "2022-11-19"),
        ArticleModel(biz: "test", pdfID: "", title: "这是一条数据", url: "", cover: "", publishTime: "2022-11-19"),
        ArticleModel(biz: "test", pdfID: "", title: "这是一条数据", url: "", cover: "", publishTime: "2022-11-19"),
        ArticleModel(biz: "test", pdfID: "", title: "这是一条数据", url: "", cover: "", publishTime: "2022-11-19"),
        ArticleModel(biz: "test", pdfID: "", title: "这是一条数据", url: "", cover: "", publishTime: "2022-11-19"),
        ArticleModel(biz: "test", pdfID: "", title: "这是一条数据", url: "", cover: "", publishTime: "2022-11-19")
    ]
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
//        fetchData()
        fileData = ArticleCoreDataManager.shared.getArticles()!
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.Identifier)
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    private func fetchData() {
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: URL(string: "http://139.196.90.131:8422/api/v2/accounts/articles?biz=Mzg2OTIyMzY0Ng")!)
        request.httpMethod = "GET"
        let dataTask = session.dataTask(with: request) { [weak self] data, _, error in
            if error == nil, let data = data, let response = try? JSONDecoder().decode(ArticleResponseModel.self, from: data) {
                DispatchQueue.main.async {
                    self?.fileData = response.data.articles
                    self?.tableView.reloadData()
                    ArticleCoreDataManager.shared.addArticles(articles: response.data.articles)
                }
            } else {
                print("dataTask error.")
            }
        }
        dataTask.resume()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fileData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.Identifier, for: indexPath)
        if let fileCell = cell as? ArticleTableViewCell {
            fileCell.setupData(fileData[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let removeAction = UIContextualAction(style: .destructive, title: "Delete") { [unowned self] _, _, _ in
            let article = self.fileData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            ArticleCoreDataManager.shared.removeArticles(articles: [article])
        }
        removeAction.backgroundColor = .red
        
        let renameAction = UIContextualAction(style: .normal, title: "Rename") { [unowned self] _, _, _ in
            let article = self.fileData[indexPath.row]
            let alert = UIAlertController(title: "Rename the title of article", message: "Rename the title of article", preferredStyle: .alert)
            let renameTextField = UITextField()
            alert.addTextField { textField in
                textField.text = article.title
            }
            alert.addAction(.init(title: "Cancel", style: .cancel))
            alert.addAction(.init(title: "Rename", style: .default, handler: { [unowned self] _ in
                guard let newTitle = alert.textFields?.first?.text else { return }
                self.fileData[indexPath.row].title = newTitle
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
                ArticleCoreDataManager.shared.modifyArticle(article: self.fileData[indexPath.row])
            }))
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [removeAction, renameAction])
        
    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let removeAction = UIContextualAction(style: .destructive, title: "删除") { [unowned self] _, _, _ in
//            let article = self.fileData.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .automatic)
//            LocalArticleManager.shared.deleteArticles(articles: [article])
//        }
//        removeAction.backgroundColor = .red
//
//        let renameAction = UIContextualAction(style: .normal, title: "重命名") { [unowned self] _, _, _ in
//            let article = self.fileData[indexPath.row]
//            let alert = UIAlertController(title: "重命名", message: nil, preferredStyle: .alert)
//            alert.addTextField { textField in
//                textField.text = article.title
//            }
//            alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { [unowned self] _ in
//                guard let newTitle = alert.textFields?.first?.text else { return }
//                self.fileData[indexPath.row].title = newTitle
//                self.tableView.reloadRows(at: [indexPath], with: .automatic)
//                LocalArticleManager.shared.updateArticle(article: self.fileData[indexPath.row])
//            }))
//            alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
//            self.present(alert, animated: true)
//        }
//        renameAction.backgroundColor = .blue
//
//        return UISwipeActionsConfiguration(actions: [removeAction, renameAction])
//    }
}




// http://139.196.90.131:8422/api/v2/accounts/articles?biz=Mzg2OTIyMzY0Ng

// https://long-term.oss-cn-hongkong.aliyuncs.com/C848400C9C2EA394B6D686B7DF08AA19.jpg

