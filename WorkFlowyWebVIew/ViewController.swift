//
//  ViewController.swift
//  WorkFlowyWebVIew
//
//  Created by David Yoon on 2021/07/03.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicatorView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        getHTMLFileAction()
        
    }
    
    func getHTMLFileAction() {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicatorView.startAnimating()
        myActivityIndicatorView.isHidden = false
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicatorView.stopAnimating()
        myActivityIndicatorView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicatorView.stopAnimating()
        myActivityIndicatorView.isHidden = true
    }

    
}

