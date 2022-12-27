//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Alexander Suen on 8/7/20.
//  Copyright © 2020 Alexander Suen. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var webView: WKWebView!
    
    var articleUrl:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        //Check that there's a url
        if articleUrl != nil {
            
            
            //Create the url object
            
            let url = URL(string: articleUrl!)
            guard url != nil else {
                return
            }
            //Create the urlRequest object
            let request = URLRequest(url: url!)
            //Start spinner
            spinner.startAnimating()
            //Load it in the webview
            webView.load(request)
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DetailViewController: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
        spinner.alpha = 0
    }
    
}
