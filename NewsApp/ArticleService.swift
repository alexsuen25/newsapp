//
//  ArticleService.swift
//  NewsApp
//
//  Created by Alexander Suen on 8/7/20.
//  Copyright © 2020 Alexander Suen. All rights reserved.
//

import Foundation
struct ArticleService: Decodable {
    var totalResults:Int?
    var articles:[Article]?
}
