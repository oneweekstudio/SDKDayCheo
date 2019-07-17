//
//  SMInterstitial.swift
//  SDKDayCheo
//
//  Created by DucTruong on 7/17/19.
//

import UIKit
@objc public protocol SMInterstitialDelegate {
    @objc optional func interstitialLoaded(interstitial:SMInterstitial)
    @objc optional func interstitialError()
    @objc optional func interstitialDidClick()
    @objc optional func interstitialCloseClick()
}
public class SMInterstitial: NSObject {
    public var rootViewController:UIViewController!
    fileprivate var smAds:SMAds!
    public var isLoad:Bool = false
    public var delegate:SMInterstitialDelegate!
    let network:SMNetwork = SMNetwork()
    @objc private func adsClose(){
        if delegate != nil{
            delegate.interstitialCloseClick?()
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    @objc private func adsDidClick(){
        if self.delegate != nil{
            self.delegate.interstitialDidClick?()
            NotificationCenter.default.removeObserver(self)
        }
    }
     public func load(){
        network.getFull(type: "full", success: { (json) in
            if json["msg"] as? String == "Cross is not running." || json["error"] as? NSNumber == 1{
                print("Tắt Quảng Cáo Chéo")
                if self.delegate != nil{
                    self.delegate.interstitialError?()
                }
            }else{
                self.smAds = SMAds(json)
                self.isLoad = true
                
                if self.delegate != nil{
                    self.delegate.interstitialLoaded?(interstitial: self)
                }
                NotificationCenter.default.addObserver(self, selector: #selector(self.adsClose), name: NSNotification.Name(rawValue: "smads_close"), object: nil)
                
                NotificationCenter.default.addObserver(self, selector: #selector(self.adsDidClick), name: NSNotification.Name(rawValue: "smads_click"), object: nil)
            }
        }) { (error) in
            print(error)
            self.isLoad = false
            
            if self.delegate != nil{
                self.delegate.interstitialError?()
            }
        }
    }
    public func show() {
        if rootViewController != nil && self.smAds != nil && self.isLoad == true{
            let pathBundle = Bundle.main.path(forResource: "SMDayCheo", ofType: "bundle")
            let bundle = Bundle(path: pathBundle ?? "")
            let smFullVC = UIStoryboard.init(name: "SMFull", bundle: bundle).instantiateViewController(withIdentifier: "SMFullVC") as! SMFullVC
            smFullVC.modalPresentationStyle = .overCurrentContext
            smFullVC.smAds = self.smAds
            smFullVC.hidesBottomBarWhenPushed = true
            rootViewController.present(smFullVC, animated: false, completion: nil)
        }else{
            print("Ads cannot show")
            if self.delegate != nil{
                self.delegate.interstitialError?()
            }

        }
    }
}

