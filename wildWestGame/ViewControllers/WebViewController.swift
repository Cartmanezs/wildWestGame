//
//  WebViewController.swift
//  wildWestGame
//
//  Created by Ingvar on 29.04.2021.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func backButtonMenuPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: true, completion: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    private let webLinkString = "http://html5test.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: webLinkString) else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
}
