//
//  RLBridge.swift
//  WKWebViewMessageDemo
//
//  Created by diaokediao on 2017/6/12.
//  Copyright © 2017年 lvjun. All rights reserved.
//

import UIKit
import WebKit

class RLBridge: NSObject, WKScriptMessageHandler {
    
    static let sharedInstance = RLBridge()
    
    let native = Native.sharedInstance
    
    private override init() {}
}

extension RLBridge {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        let name = message.name+":"
        let body = message.body
        
        //根据JS传过来的Name生成Selector
        let selector = Selector(name)
        
        if native.responds(to: selector) {
            native.perform(selector, with: body)
        }else{
            print("未找到对应方法")
        }
    }
}
