//
//  HybridViewController.swift
//  Swift_AceSDK
//
//  Created by jinsang yoo on 2018. 6. 22..
//  Copyright © 2018년 NHN Ace. All rights reserved.
//

import UIKit
import AceTM

class HybridViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet var classNameLabel: UILabel!
    @IBOutlet weak var mWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AceTM.viewDidLoad(responder: self, autoPv: false)
        
        classNameLabel.text = String(describing: HybridViewController.self)
        print("AceCommon.getIsDebug(): \(AceCommon.getIsDebug())")
        let request = URLRequest(url: URL(string: "http://www.acecounter.com/www2/main.amz")!)
        mWebView.loadRequest(request)
        mWebView.delegate = self
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("called \(#function)")
        AceTM.webViewDidFinishLoad(webView: webView)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("called \(#function)")
        AceTM.webViewDidStartLoad(webView: webView)
    }
    
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("called \(#function)")
        AceTM.uiWebView(webView: webView, shouldStartLoadWith: request, navigationType: navigationType)
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
