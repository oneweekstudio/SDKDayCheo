//
//  SMNativeController.swift
//  Alamofire
//
//  Created by Hintoro on 10/14/19.
//

import Foundation
import UIKit
import SafariServices


/*
    - Chú ý: Controller này chỉ xử lý deeplink
 
 */

class SMNativeController : UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    //Để vào trong thằng này 1 object, test thì để 1 cái string
    var dynamicLink: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.load()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}


//Function
extension SMNativeController : SFSafariViewControllerDelegate 	{
    
    func load() {
        
        if SMConfig.isDebug {
            self.dynamicLink = "https://flyingfacev2.page.link/test"
        }
        
        guard
            let link = self.dynamicLink,
            let url = URL.init(string: link)
            else { return }
        
        let urlRequest = URLRequest.init(url: url)
        self.redirectLink(URLRequest: urlRequest)
        
    }
    
    func redirectLink( URLRequest request: URLRequest) {
        self.webView.delegate = self
        self.webView.loadRequest(request)
    }
        
}

extension SMNativeController : UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("Load success")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("webView : \(error)")
    }
}

