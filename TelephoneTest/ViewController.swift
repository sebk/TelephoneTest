//
//  ViewController.swift
//  TelephoneTest
//
//  Created by Sebastian Kruschwitz on 07.04.20.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        webView.configuration.dataDetectorTypes = .phoneNumber
        webView.navigationDelegate = self
        
        webView.loadHTMLString("<font size=\"28\"><h1>Ruf! Mich! An!</h1> <p>24h erreichbar:<br><br><a href=\"tel:+49(1234)987654\">1234987654</a></p></font>", baseURL: nil)

    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.request.url?.scheme == "tel" {
            UIApplication.shared.open(navigationAction.request.url!)
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }

    @IBAction func telTestButtonAction() {
        let number = "+49(1234)987654"
        if let url = URL(string: "tel://\(number)") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func openActionSheet() {
        let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Time Travel", style: .default , handler:{ (UIAlertAction)in
            print("a")
        }))

        alert.addAction(UIAlertAction(title: "Self destruction", style: .destructive , handler:{ (UIAlertAction)in
            print("a")
        }))

        alert.addAction(UIAlertAction(title: "Nothing", style: .cancel, handler:{ (UIAlertAction)in
            print("a")
        }))

        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }

}

