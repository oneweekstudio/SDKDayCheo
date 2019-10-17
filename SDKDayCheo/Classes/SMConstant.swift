//
//  SMConstant.swift
//  SDKDayCheo
//
//  Created by DucTruong on 7/17/19.
//

import Foundation
public class SMConfig: NSObject {
    static var isDebug = false
    public class func setDebug(_ isDebug:Bool = true){
        self.isDebug = isDebug
        print("Debug mode: \(isDebug)")
    }
}
//public var smbundle = SMConfig.isDebug ? "com.cloudmusic.mymp3" : Bundle.main.bundleIdentifier!
public let kUrl = "http://cpibe.appboom.net/api/v2/get_campaign"
public let kUrlClickAd = "http://cpibe.appboom.net/api/v2/click_ad"
public let kUrlViewAd = "http://cpibe.appboom.net/api/v2/view_ad"

public func getBundlePath() -> Bundle {
    let pathBundle = Bundle.main.path(forResource: "SDKDayCheo", ofType: "bundle")
    let bundle = Bundle(path: pathBundle ?? "")!
    return bundle
}
