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

    var full:SMInterstitial!
    override func viewDidLoad() {
        super.viewDidLoad()
        SMConfig.setDebug(true)
        full = SMInterstitial()
       
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

}

