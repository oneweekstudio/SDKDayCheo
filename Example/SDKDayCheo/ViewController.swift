//
//  ViewController.swift
//  SDKDayCheo
//
//  Created by truongtvd on 07/16/2019.
//  Copyright (c) 2019 truongtvd. All rights reserved.
//

import UIKit
import SDKDayCheo

class ViewController: UIViewController,SMInterstitialDelegate {

    var full: SMInterstitial = SMInterstitial()
    var native: SMNativeView = SMNativeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        full.rootViewController = self
        full.delegate = self
        full.load()
    }

    @IBAction func click(_ sender: Any) {
        full.show()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func callSMNativeView(_ sender: Any) {
        native.delegate = self
        native.load()
    }

    
}



extension ViewController : SMNativeViewDelegate {
    
    func nativeViewDidLoad(_ ad: SMNativeView) {
        print("Load success")
        ad.show(UIController: self)
//        print(ad.getAdsObject())
//        ad.presen
    }
    
    func nativeView(_ ad: SMNativeView, didFailWithError error: Error) {
        print(error)
    }
}
