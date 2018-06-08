//
//  HybridCiewController.swift
//  AceTM
//
//  Created by MoonJongRak on 2016. 11. 24..
//  Copyright © 2016년 CocoaPods. All rights reserved.
//


import UIKit
import AceTM

class HybridViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var mWebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        AceTM.viewDidLoad(responder: self, autoPv: false)


        let request = URLRequest(url: URL(string: "http://www.amazingsoft.com/webview/index.html")!)
        mWebView.loadRequest(request)
        mWebView.delegate = self

    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        AceTM.webViewDidFinishLoad(webView: webView)
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        AceTM.webViewDidStartLoad(webView: webView)
    }

    func platform() -> String {
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return NSString(bytes: &sysinfo.machine, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)! as String
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

