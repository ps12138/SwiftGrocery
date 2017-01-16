//
//  LoginViewController+webView.swift
//  Example
//
//  Created by PSL on 12/14/16.
//  Copyright © 2016 PSL. All rights reserved.
//

import Foundation
import UIKit

// MARK: - add/delete webView
extension LoginViewController {
    /// init webView
    internal func webViewLoad(from url: URL) {
        let frame = self.view.bounds
        webview = UIWebView(frame: frame)
        // creat web request
        let request = URLRequest(url: url)
        // load request
        if let getWebview = webview {
            getWebview.loadRequest(request)
            // add wkwebview as subView
            self.view.addSubview(getWebview)
            getWebview.delegate = self
            print("loginVC: added webView")
        }
        
    }
    
    /// remove webView
    internal func webViewRemove() {
        guard let getWebView = webview else {
            return
        }
        if view.subviews.contains(getWebView) {
            view.willRemoveSubview(getWebView)
            print("LoginVC: removing webView")
        }
    }
    /// clear cookie
    internal func clearCookie() {
        print("LoginVC: clearCookie webView")
        let storage = HTTPCookieStorage.shared
        if let cookies = storage.cookies {
            for cookie in cookies {
                storage.deleteCookie(cookie)
            }
        }
    }
}
    
// MARK: - conform to UIWebViewDelegate
extension LoginViewController: UIWebViewDelegate {
    // MARK: - UIWebViewDelegate
    /// finish loading url
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("LoginVC: didFinish webview")
    }
    
    /// fail to load url
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("LoginVC: didFail webview")
        print("LoginVC: error: \(error)")
    }
    
    /// handle callback
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let app = UIApplication.shared
        let url = request.url
        
        if let urlScheme = request.url?.scheme,
            urlScheme == NetworkManager.Scheme.callBackPrefix,
            let validURL = url,
            app.canOpenURL(validURL) {
            app.open(validURL, options: [:], completionHandler: nil)
            //webViewRemove()
            return false
        }
        return true
    }
}
