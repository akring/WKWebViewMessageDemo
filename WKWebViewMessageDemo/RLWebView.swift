//
//  RLWebView.swift
//  WKWebViewMessageDemo
//
//  Created by diaokediao on 2017/6/12.
//  Copyright © 2017年 lvjun. All rights reserved.
//

import UIKit
import WebKit

class RLWebView: WKWebView {

    let bridge = RLBridge.sharedInstance
    
    let eventList = ["openWindow","openPopover","openAlert"]//事件列表
    
    init(frame:CGRect) {
        
        let content = WKUserContentController()
        for event in eventList {
            content.add(bridge, name: event)
        }
        let config = WKWebViewConfiguration()
        config.userContentController = content
        
        super.init(frame: frame, configuration: config)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.configuration.userContentController.removeAllUserScripts()
    }
}
