//
//  SMNative.swift
//  Pods
//
//  Created by Hintoro on 10/14/19.
//

import Foundation
import UIKit
import MagicMapper

open class SMNativeView : NSObject {
    
    open var delegate: SMNativeViewDelegate?
    var ad: SMAds?
    
    
    open func load() {
        let network = SMNetwork()
        network.getNative(success: { (json) in
            if let data = json["data"] as? [KeyValue] {
                if data.count > 0 {
                    self.ad = SMAds.init(data[0])
                    self.delegate?.nativeViewDidLoad?(self)
                }
            }
        }) { (error) in
            self.delegate?.nativeView?(self, didFailWithError: error)
        }
    }
    
    open func showDialog(UIController controller: UIViewController, cancelTitle: String = "Cancel", submitTitle: String = "Get it!") {
        
        guard let ad = ad else { return }
        let alert = UIAlertController(title: ad.name , message: ad.desc, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: cancelTitle, style: UIAlertAction.Style.cancel, handler: {action in
            self.delegate?.nativeViewDidClose?(self)
        }))
        alert.addAction(UIAlertAction(title: submitTitle, style: UIAlertAction.Style.default, handler: { action in
            self.delegate?.nativeViewDidClick?(self)
            self.requestClickCampaign(controller)
            self.callAPIClickAd()
        }))
        controller.present(alert, animated: true, completion: {
            self.callAPIViewAd()
        })
    }
    
    //Thêm tùy chọn asset
    open func getAdsObject() -> SMAds? {
        return self.ad
    }
    
    open func getCampaign(asset: SMAssets? = nil) -> URL? {
        if let asset = asset {
            return URL.init(string: asset.link)
        } else {
            guard let ad = ad,
                let campaign = ad.assets.first
                else { return nil }
            return URL.init(string: campaign.link)
        }
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
    
    open func callAPIClickAd() {
        let network = SMNetwork()
        guard let ad = self.ad,
            let asset = ad.assets.first
            else { return }
        let adSize = "\(asset.width)x\(asset.height)"
        network.callAPIClickAd(ad.campaign_id, size: adSize, success: { (json) in
            print("callAPIClickAd success: \(json)")
        }) { (error) in
            print("callAPIClickAd error : \(error)")
        }
    }
    
    open func callAPIViewAd() {
        let network = SMNetwork()
        guard let ad = self.ad,
            let asset = ad.assets.first
            else { return }
        let adSize = "\(asset.width)x\(asset.height)"
        network.callAPIViewAd(ad.campaign_id, size: adSize, success: { (json) in
            print("callAPIViewAd success: \(json)")
        }) { (error) in
            print("callAPIViewAd error : \(error)")
        }
    }
    
}
