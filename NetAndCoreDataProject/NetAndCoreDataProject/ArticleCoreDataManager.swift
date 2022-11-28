//
//  ArticleCoreDataManager.swift
//  NetAndCoreDataProject
//
//  Created by 於泽辰 on 2022/11/28.
//

import Foundation
import CoreData
import UIKit

class ArticleCoreDataManager {
    
    static let shared = ArticleCoreDataManager()
    private let context: NSManagedObjectContext
    
    private init() {
        context = ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext)!
    }
    
    func addArticles(articles: [ArticleModel]) {
        for article in articles {
            let entity = NSEntityDescription.insertNewObject(forEntityName: "ArticleEntity", into: context) as! ArticleEntity
            article.injectTo(articleEntity: entity)
        }
        try? context.save()
    }
    
    func getArticles(pdfID: String? = nil) -> [ ArticleModel ]? {
        let request = NSFetchRequest<ArticleEntity>(entityName: "ArticleEntity")
        var predicate: NSPredicate? = nil
        if let pdfID = pdfID {
            predicate = NSPredicate(format: "pdfID == \"\(pdfID)\"")
        }
        
        request.predicate = predicate
        let results = try? context.fetch(request)
        return results?.compactMap({ ArticleModel(from: $0) })
    }
    
    func modifyArticle(article: ArticleModel) {
        let request = NSFetchRequest<ArticleEntity>(entityName: "ArticleEntity")
        let predicate = NSPredicate(format: "pdfID == \"\(article.pdfID)\"")
        request.predicate = predicate
        guard let results = try? context.fetch(request), let result = results.first else { return }
        article.injectTo(articleEntity: result)
        try? context.save()
    }
    
    func removeArticles(articles: [ArticleModel]) {
        let request = NSFetchRequest<ArticleEntity>(entityName: "ArticleEntity")
        var predicate: NSPredicate? = nil
        for article in articles {
            predicate = NSPredicate(format: "pdfID == \"\(article.pdfID)\"")
            request.predicate = predicate
            guard let results = try? context.fetch(request) else { continue }
            results.forEach { context.delete($0) }
            try? context.save()
        }
    }
    
}

extension ArticleModel {
    func injectTo(articleEntity: ArticleEntity) {
        articleEntity.pdfID = pdfID
        articleEntity.cover = cover
        articleEntity.url = url
        articleEntity.biz = biz
        articleEntity.publishTime = publishTime
        articleEntity.title = title
    }
    
    init?(from articleEntity: ArticleEntity) {
        guard let pdfID = articleEntity.pdfID,
              let cover = articleEntity.cover,
              let url = articleEntity.url,
              let biz = articleEntity.biz,
              let publishTime = articleEntity.publishTime,
              let title = articleEntity.title
        else { return nil }
        
        self.init(biz: biz, pdfID: pdfID, title: title, url: url, cover: cover, publishTime: publishTime)
    }
}
