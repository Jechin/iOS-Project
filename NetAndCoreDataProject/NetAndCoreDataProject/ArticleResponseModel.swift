//
//  ArticleResponseModel.swift
//  NetAndCoreDataProject
//
//  Created by 於泽辰 on 2022/11/28.
//

import Foundation

struct ArticleResponseModel: Codable {
    struct ArticlesData: Codable {
        var articles: [ArticleModel]
    }
    var data: ArticlesData
    var msg: String
    var code: Int
}
