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
    
    var smAds:SMAds?
    var isViewAnimated: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let smAds = self.smAds else { return }
        print("SMAds : \(smAds.name)")
        self.imgIcon.downloaded(from: smAds.icon)
        if let asset = smAds.assets.first {
            self.imgBanner.downloaded(from: asset.url)
        } else {
            self.imgBanner.downloaded(from: "https://i.pinimg.com/474x/63/ae/13/63ae13e28fa405a40ad3e78cca622291.jpg")
        }
        self.lbTitle.text = smAds.name
        self.lbDes.text = smAds.desc
        self.callAPIViewAd()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !isViewAnimated {
            self.isViewAnimated = true
            self.contentView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                  self.contentView.transform = CGAffineTransform(scaleX: 1, y: 1)
                  
              }, completion: { success in
            })
        }
  
    }
    @IBAction func actionGet(_ sender: Any) {
        self.requestClickCampaign(self)
        self.callAPIClickAd()
    }
    
    @IBAction func actionClose(_ sender: Any) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "smads_close"), object: nil)
        
        
        UIView.animate(withDuration: 0.2, animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            
        }) { (status) in
            self.dismiss(animated: false) {
                
            }
        }
    }
    
    
    open func callAPIClickAd() {
        let network = SMNetwork()
        guard let ad = self.smAds else { return }
        var adSize = "no-banner"
        if let asset = ad.assets.first {
            adSize = "\(asset.width)x\(asset.height)"
        }
        network.callAPIClickAd(ad.campaign_id, size: adSize, success: { (json) in
            print("callAPIClickAd success: \(json)")
        }) { (error) in
            print("callAPIClickAd error : \(error)")
        }
    }
    
    open func callAPIViewAd() {
        let network = SMNetwork()
        guard let ad = self.smAds
            else { return }
        var adSize = "no-banner"
        if let asset = ad.assets.first {
            adSize = "\(asset.width)x\(asset.height)"
        }
        network.callAPIViewAd(ad.campaign_id, size: adSize, success: { (json) in
            print("callAPIViewAd success: \(json)")
        }) { (error) in
            print("callAPIViewAd error : \(error)")
        }
    }
    
    open func getCampaign() -> URL? {
        guard let ad = smAds,
            let campaign = ad.assets.first
            else { return nil }
        return URL.init(string: campaign.link)
    }
    
    
    open func requestClickCampaign(_ controller : UIViewController) {
        let network = SMNetwork()
        
        guard let url = self.getCampaign() else { return }
        
        network.getResponse(url.absoluteString, success: { (keyvalue) in
            //            print(keyvalue)
            guard let str = keyvalue["link"] as? String else { return }
            
            if self.checkDynamicLink(str: str) {
                print("Deep link: \(str)")
                self.openDeepLink(UIController: controller, link: str)
            } else {
                print("Appstore link: \(str)")
                self.openAppStore(itms: str)
            }
        }) { (error) in
            print(error)
        }
    }
    
    open func checkDynamicLink(str: String) -> Bool {
        return !str.contains("itms")
    }
    
    //Khi link nhận được từ campaign là một link dạng "dynamic link" -> Chuyển đến controller SMNativeController để xử lý deeplink
    open func openDeepLink( UIController controller: UIViewController, link: String = "https://flyingfacev2.page.link/test") {
        let nativeViewController = UIStoryboard.init(name: "SMNative", bundle: getBundlePath()).instantiateViewController(withIdentifier: "SMNativeController") as! SMNativeController
        nativeViewController.modalPresentationStyle = .overCurrentContext
        nativeViewController.dynamicLink = link
        controller.present( nativeViewController, animated: false)
    }
    
    //Khi link nhận được từ campaign là một link "itms" -> Chuyển sang appstore
    open func openAppStore(itms: String) {
        if let url = URL(string: itms),
            UIApplication.shared.canOpenURL(url){
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:]) { (opened) in
                    if(opened){
                        print("App Store Opened")
                    }
                }
            } else {
                // Fallback on earlier versions
                UIApplication.shared.openURL(url)
            }
        } else {
            print("Can't Open URL on Simulator")
        }
    }
    
    
}
