//
//  SMAds.swift
//  Alamofire
//
//  Created by DucTruong on 7/17/19.
//

import UIKit

import MagicMapper

@objcMembers
open class SMAds: NSObject,Mappable {
    
    public var icon = ""
    public var campaign_id: Int = 0
    public var name = ""
    public var desc = ""
    public var screenshots:[String] = []
    public var link = ""
    public var assets:[SMAssets] = []
}
