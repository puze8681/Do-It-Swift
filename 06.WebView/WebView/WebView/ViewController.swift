//
//  ViewController.swift
//  WebView
//
//  Created by 박태준 on 2017. 8. 25..
//  Copyright © 2017년 Tae Jun Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate{
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.loadRequest(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.delegate = self
        loadWebPage("https://www.naver.com/")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
    
    func checkUrl(_ url: String)->String{
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if (strUrl == ""){
            return "https://www.naver.com"
        }else{
            if !flag{
                strUrl = "http://"+strUrl
            }
            return strUrl
        }
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
        loadWebPage(txtUrl.text!)
    }
    @IBAction func btnGotoSite1(_ sender: UIButton) {
        loadWebPage("https://www.google.com")
    }
    @IBAction func btnGotoSite2(_ sender: UIButton) {
        loadWebPage("https://www.youtube.com")
    }
    @IBAction func btnLoadHtml(_ sender: UIButton) {
        let html = "<h1> HTML String </h1><p> String 변수를 이용한 웹페이지 </p><p><a href=\"http://www.naver.com\">네이버</a>로 이동</p>"
        webView.loadHTMLString(html, baseURL: nil)
    }
    @IBAction func btnLoadFile(_ sender: UIButton) {
        let htmlBundle = Bundle.main
        let filePath = htmlBundle.path(forResource: "htmlView", ofType: "html")
        loadWebPage(filePath!)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
}

