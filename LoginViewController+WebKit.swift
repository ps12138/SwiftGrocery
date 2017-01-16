//
//  LoginViewController+WebKit.swift
//  example
//
//  Created by PSL on 12/14/16.
//  Copyright © 2016 PSL. All rights reserved.
//

import Foundation
import WebKit

// MARK: - load/delete wkVebView
extension LoginViewController {
 
    internal func wkWebViewLoad(from url: URL) {
        let frame = self.view.bounds
        wkWebview = WKWebView(frame: frame)
        // creat web request
        let request = URLRequest(url: url)
        // load request
        if let getWebview = wkWebview {
            getWebview.load(request)
            // add wkwebview as subView
            self.view.addSubview(getWebview)
            getWebview.navigationDelegate = self
            print("LoginVC: added wkWebview")
        }
    }
    
    internal func wkWebViewRemove() {
        guard let getWebView = wkWebview else {
            return
        }
        if view.subviews.contains(getWebView) {
            view.willRemoveSubview(getWebView)
            print("LoginVC: removing wkWebview")
        }
    }
}

// MARK: - conform to WKNavigationDelegate
extension LoginViewController: WKNavigationDelegate {

    /// didfinish loading url
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("LoginVC: didFinish WKWebView")
    }
    
    /// didFail loading url
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("LoginVC: didFail WKWebView")
        print("LoginVC: error: \(error)")
    }
    
    /// decision for perform URL
    /// no matched scheme, URL will call Safari
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        let app = UIApplication.shared
        let url = navigationAction.request.url
        if let urlScheme = url?.scheme,
            urlScheme == NetworkManager.Scheme.callBackPrefix,
            let validURL = url,
            app.canOpenURL(validURL) {
            app.open(validURL, options: [:], completionHandler: nil)
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
    
 }
