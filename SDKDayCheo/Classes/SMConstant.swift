//
//  SMConstant.swift
//  SDKDayCheo
//
//  Created by DucTruong on 7/17/19.
//

import Foundation
public class SMConfig: NSObject {
    static var isDebug = false
    class func setDebug(_ isDebug:Bool=false)->Bool{
        self.isDebug = isDebug
        return self.isDebug
    }
}
public var smbundle = SMConfig.isDebug ? "" : Bundle.main.bundleIdentifier!
public let kUrl = "http://cpibe.appboom.net/api/v1/get_campaign"
