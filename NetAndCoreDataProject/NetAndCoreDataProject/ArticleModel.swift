//
//  ArticalModel.swift
//  NetAndCoreDataProject
//
//  Created by 於泽辰 on 2022/11/28.
//

import Foundation

struct ArticleModel: Codable {
    var biz: String
    var pdfID: String
    var title: String
    var url: String
    var cover: String
    var publishTime: String
}
