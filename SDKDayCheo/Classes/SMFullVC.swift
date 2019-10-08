//
//  SMFullVC.swift
//  SDKDayCheo
//
//  Created by DucTruong on 7/17/19.
//

import UIKit
import SafariServices
import Alamofire
class SMFullVC: UIViewController,UIWebViewDelegate {
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDes: UILabel!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var webView: UIWebView!
    
    let network:SMNetwork = SMNetwork()

    var smAds:SMAds!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.imgIcon.downloaded(from: smAds.icon)
        self.imgBanner.downloaded(from: "https://i.pinimg.com/originals/80/54/09/8054098053c9b96049c2e0c0919fd144.jpg")
        self.lbTitle.text = smAds.name
        self.lbDes.text = smAds.desc
    }
    
    override func viewDidLayoutSubviews() {
        self.contentView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        }, completion: nil)
    }
    @IBAction func actionGet(_ sender: Any) {
        print("run")
//        let sv = SFSafariViewController.init(url: URL.init(string: "https://flyingfacev2.page.link/test")!)
//        self.present(sv, animated: true, completion: nil)
    
      
        
//        network.getResponse("https://flyingfacev2.page.link/test", success: { Data
//            in
//
//        }) { (error) in
//            print(error.localizedDescription)
//        }
        self.webView.delegate = self
        self.webView.loadRequest(URLRequest.init(url: URL.init(string: "https://flyingfacev2.page.link/test")!))
    }
//    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
//        
//        print(request.url?.absoluteString)
//        print(request.url!.scheme!)
//        if request.url!.scheme! == "itms-appss"{
//         
//            return false
//        }
//        return true
//    }
    @IBAction func actionClose(_ sender: Any) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "smads_close"), object: nil)

        
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)

        }) { (status) in
            self.dismiss(animated: false) {
                
            }
        }
    }
    
}
