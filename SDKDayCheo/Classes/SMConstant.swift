//
//  SMConstant.swift
//  SDKDayCheo
//
//  Created by DucTruong on 7/17/19.
//

import Foundation
public class SMConfig: NSObject {
    static var isDebug = false
    public class func setDebug(_ isDebug:Bool=true){
        self.isDebug = isDebug
    }
}
public var smbundle = SMConfig.isDebug ? "com.harry.MusicMuoiLam" : Bundle.main.bundleIdentifier!
public let kUrl = "http://cpibe.appboom.net/api/v1/get_campaign"
public func getBundlePath()->Bundle{
    let pathBundle = Bundle.main.path(forResource: "SDKDayCheo", ofType: "bundle")
    let bundle = Bundle(path: pathBundle ?? "")!
    return bundle
}
