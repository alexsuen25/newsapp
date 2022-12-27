//
//  ViewController.swift
//  NewsApp
//
//  Created by Alexander Suen on 8/7/20.
//  Copyright © 2020 Alexander Suen. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var model = ArticleModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the viewController as the datasource and delegate of the tableview
        tableView.delegate = self
        tableView.dataSource = self
        //let dublinshieldcolor = UIColor(red: 60, green: 72, blue: 88, alpha: 0)
        // Do any additional setup after loading the view.
        self.tableView.backgroundColor = UIColor(red: 60/255, green: 72/255, blue: 88/255, alpha: 1)
        //self.navigationController?.navigationBar.backgroundColor = UIColor(red: 60/255, green: 72/255, blue: 88/255, alpha: 1)
        view.backgroundColor = UIColor(red: 60/255, green: 72/255, blue: 88/255, alpha: 1)
        //Get the articles from the article model
        model.delegate = self
        model.getArticles()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Detect which article teh user selected
        let indexPath = tableView.indexPathForSelectedRow
        guard indexPath != nil else {
            return
        }
        //Get the article the user tapped on
        let article = articles[indexPath!.row]
        let detailVC = segue.destination as! DetailViewController
        
        //Get a reference to detail view controller
        detailVC.articleUrl = article.url!
        //Pass the article url to the detail view controller
        
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        //Get the article that the tableview is asking about
        let article = articles[indexPath.row]
            
        //TODO: customize it
        cell.backgroundColor = UIColor.clear
        cell.displayArticle(article)
        cell.textLabel?.textColor = UIColor.white
        //Return it
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
    extension ViewController: ArticleModelProtocol {
        //MARK: -Article Model Protocol Methods
        func articlesRetrieved(_ articles: [Article]) {
            print("Articles returned from model")
            
            //Set the article property of the view controoler to the articles passed back
            self.articles = articles
            
            //Reload the table view
            tableView.reloadData()
    }
   
}
