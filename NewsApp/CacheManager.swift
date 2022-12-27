//
//  CacheManager.swift
//  NewsApp
//
//  Created by Alexander Suen on 8/8/20.
//  Copyright © 2020 Alexander Suen. All rights reserved.
//

import Foundation
class CacheManager {
    
    static var imageDictionary = [String:Data]()

    static func saveData(_ url:String, _ imageData:Data){
        //Save the image data along with the URL
        imageDictionary[url] = imageData
    }
    static func retrieveData(_ url:String) -> Data? {
        //Return the saved image data
        return imageDictionary[url]
        
        
    }
}
