//
//  Native.swift
//  WKWebViewMessageDemo
//
//  Created by diaokediao on 2017/6/12.
//  Copyright © 2017年 lvjun. All rights reserved.
//

import UIKit

class Native: NSObject {
    
    static let sharedInstance = Native()
    private override init() {}
    
    func openWindow(_ body:Any) -> Void {
        
        var url:String?
        var router:String?
        if let param = body as? Dictionary<String,Any> {
            url = param["url"] as? String
            router = param["router"] as? String
        }
        
        guard url != nil else {
            return
        }
        
        if url!.hasPrefix("file:///"){
            url! = Bundle.main.path(forResource: url!.substring(from: "file:///".endIndex), ofType: nil)!
        }
        print(url!)
        print(router ?? "")
    }
    
    func openPopover(_ body:Any) -> Void {
        
        var urls:[String]?
        if let param = body as? Dictionary<String,Any> {
            urls = param["urls"] as? [String]
        }
        
        guard urls != nil else {
            print("urls can't be nil!")
            return
        }
        
        print(urls!.count)
        print(urls!)
    }
    
    func openAlert(_ body:Any) -> Void {
        
        var message:String?
        var buttonTitle:String?
        if let param = body as? Dictionary<String,Any> {
            if let alert = param["alert"] as? Dictionary<String,String> {
                message = alert["message"]
                buttonTitle = alert["buttonTitle"]
            }
        }
        
        guard message != nil else {return}
        guard buttonTitle != nil else {return}
        
        let alert = UIAlertController(title: "", message: message!, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle!, style: .cancel, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}


