//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Alexander Suen on 8/8/20.
//  Copyright © 2020 Alexander Suen. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var headlineLabel: UILabel!
    
    @IBOutlet weak var articleImageView: UIImageView!
    
    var articleToDisplay:Article?
    
    func displayArticle(_ article:Article) {
        //Clean up the cell before displaying the next artciel
        articleImageView.image = nil
        articleImageView.alpha = 0
        headlineLabel.alpha = 0
        headlineLabel.text = ""
        //Keep reference
        articleToDisplay = article
        
        //Set the headling
        headlineLabel.text = articleToDisplay!.title
        //Animate the label into view
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.headlineLabel.alpha = 1
            
        }, completion: nil)
        //Download the image
        
        //Display the image
        guard articleToDisplay?.urlToImage != nil else {
            return
        }
        
        let urlString = articleToDisplay!.urlToImage!
        //Check the cahcemanager before downloading any image data
        if let imageData = CacheManager.retrieveData(urlString) {
            //There is image data, set the imageview and treturn
            articleImageView.image = UIImage(data: imageData)
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                       self.articleImageView.alpha = 1
                       
                   }, completion: nil)
            return
        }
        guard urlString != nil else {
            return
        }
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            //Check that there were no errors
            if error == nil && data != nil {
                //Save data
                CacheManager.saveData(urlString, data!)
                //Display the image data in the image view
                
                if self.articleToDisplay!.urlToImage == urlString {
                    DispatchQueue.main.async {
                    self.articleImageView.image = UIImage(data: data!)
                        
                        
                    UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                               self.articleImageView.alpha = 1
                               
                           }, completion: nil)
                }
                
             
                }
            }
        }
        dataTask.resume()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
