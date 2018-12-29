//
//  ClassDetailFromWebViewController.swift
//  VPlayGameCommunity
//
//  Created by 506 on 2018/12/29.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit
import WebKit

class ClassDetailFromWebViewController: UIViewController, WKNavigationDelegate {

    lazy var webView: WKWebView = {
        let web = WKWebView( frame: CGRect(x:0, y:64,width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        /// 设置访问的URL
        let url = NSURL(string: "https://www.taptap.com/top/download")
        /// 根据URL创建请求
        let requst = NSURLRequest(url: url! as URL)
        /// 设置代理
        //        web.uiDelegate = self
        web.navigationDelegate = self
        /// WKWebView加载请求
        web.load(requst as URLRequest)
        
        return web
    }()
    
    // 进度条
    lazy var progressView:UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = UIColor.red
        progress.trackTintColor = .clear
        return progress
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(webView)
        self.view.addSubview(progressView)
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
