//
//  SMNativeController.swift
//  Alamofire
//
//  Created by Hintoro on 10/14/19.
//

import Foundation
import UIKit
import WebKit

class SMNativeController : UIViewController {
    
    var webView: WKWebView!

    //Để vào trong thằng này 1 object, test thì để 1 cái string
    var dynamicLink: String?
    
    
    
    override func viewDidLoad() {
        self.load()
    }
    
}


//Function
extension SMNativeController {
    
    func load() {
        //Kiểm tra xem có gắn dynamic link không ?
        if SMConfig.isDebug {
            self.dynamicLink = "https://flyingfacev2.page.link/test"
        }
        
        guard
            let link = self.dynamicLink,
            let url = URL.init(string: link)
        else { return }
        
        webView = WKWebView()
        let urlRequest = URLRequest.init(url: url)
        self.webView.load(urlRequest)
        print("Request: \(urlRequest)")
    }
    
    func redirectLink() {
        
    }
    
}
