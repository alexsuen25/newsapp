//
//  Article.swift
//  NewsApp
//
//  Created by Alexander Suen on 8/7/20.
//  Copyright © 2020 Alexander Suen. All rights reserved.
//

import Foundation
struct Article : Decodable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    
    
}
