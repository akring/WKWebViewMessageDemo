//
//  ViewController.swift
//  WKWebViewMessageDemo
//
//  Created by diaokediao on 2017/6/9.
//  Copyright © 2017年 lvjun. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    var webView = RLWebView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createWebView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadHTMLWithJS()
    }
    
    /// 创建WebView
    func createWebView() -> Void {
        webView = RLWebView(frame: self.view.bounds)
        webView.uiDelegate = self
        self.view.addSubview(webView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    
    /// 加载测试用的JS
    func loadHTMLWithJS() -> Void {
        
        let url = Bundle.main.url(forResource: "index", withExtension: "html")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
