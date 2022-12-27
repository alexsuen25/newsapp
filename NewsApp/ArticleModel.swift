//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Alexander Suen on 8/7/20.
//  Copyright © 2020 Alexander Suen. All rights reserved.
//

import Foundation
protocol ArticleModelProtocol {
    
    func articlesRetrieved(_ articles:[Article])
}
class ArticleModel {
    
    var delegate:ArticleModelProtocol?
    
    func getArticles() {
        //Fire off the request to the API
        
        //Create a string URL
        let stringUrl = "http://104.128.66.77/json"
        //let stringUrl ="https://newsapi.org/v2/everything?domains=thedublinshield.com&apiKey=91ad2339fd3b4db5abc6dbab3cad6f9e"
        //Create a URL Object
        let url = URL(string: stringUrl)
        //Chekc that it isn't nil
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        //Get the URL Session
        let session = URLSession.shared
        
        //Create the data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            //Check that there are no erros and that there is data
            if error == nil && data != nil {
                
                //Attempt to parse the JSOn
                let decoder = JSONDecoder()
                do {
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    let articles = articleService.articles!
                    
                    DispatchQueue.main.async {
                    self.delegate?.articlesRetrieved(articles)

                    }
                }
                catch {
                    print("Couldn't parse JSON")
                    
                }// End do - catch
            }//End if
        }//Data task End
        //Start the data task
        dataTask.resume()
        //Parse the returned JSON into article instances and passs it back to the view controller with the protocol and delegate pattern
        
        delegate?.articlesRetrieved([Article]())
    }
    
}
