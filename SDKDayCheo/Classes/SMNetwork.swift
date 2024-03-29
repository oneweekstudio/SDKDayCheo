//
//  SMNetwork.swift
//  SDKDayCheo
//
//  Created by DucTruong on 7/17/19.
//

import UIKit
import Alamofire
import MagicMapper
import AdSupport



class SMNetwork: NSObject {
    private var orientation = ""
    private var device_type = "iphone"
    var baseParam:[String:Any]!
    
    
    public override init() {
        if UIDevice.current.orientation.isLandscape {
            orientation = "landscape"
        }else{
            orientation = "portrait"
        }
        if UIDevice.current.userInterfaceIdiom == .pad{
            device_type = "ipad"
        }else{
            device_type = "iphone"
        }
        
        let sm_bundle = SMConfig.isDebug ? "alex.test.packagename" : Bundle.main.bundleIdentifier!
        
        baseParam = ["package_name":sm_bundle,
                     "lang":NSLocale.preferredLanguages[0],
                     "location":(Locale.current as NSLocale).object(forKey: .countryCode) as? String ?? "",
                     "orientation":orientation,
                     "device_type":device_type,
                     "ios_version":"\(UIDevice.current.systemVersion)",
            "ifa":"\(ASIdentifierManager.shared().advertisingIdentifier.uuidString)",
            "uuid":"\((UIDevice.current.identifierForVendor?.uuidString)!)",
            "system":"ios",
            "sdk_version":"1.0"]
    }
    
    public func getResponse(_ url:String ,success:@escaping (KeyValue) -> Void,failure:@escaping (Error) -> Void){
        Alamofire.request(url)
            .responseJSON {response in
                switch (response.result){
                case.success(let data):
                    success(data as! KeyValue)
                    break
                case .failure(let error):
                    failure(error)
                    break
                }
        }
    }
    
    public func getBanner(success:@escaping (KeyValue) -> Void,failure:@escaping (Error) -> Void){
        var params:[String:Any] = baseParam
        params.updateValue("banner", forKey: "ad_format")
        //        print(params)
        Alamofire.request(kUrl,method: .get, parameters: params)
            .responseJSON {response in
                
                switch (response.result){
                case.success(let data):
                    success(data as! KeyValue)
                    
                    break
                    
                case .failure(let error):
                    failure(error)
                    break
                }
                
        }
    }
    public func getFull(success:@escaping (KeyValue) -> Void,failure:@escaping (Error) -> Void){
        var params:[String:Any] = baseParam
        params.updateValue("1", forKey: "number")
        params.updateValue("random", forKey: "option")
        Alamofire.request(kUrl,method: .get, parameters: params)
            .responseJSON {response in
                print(response.request?.url!)
                switch (response.result){
                case.success(let data):
                    success(data as! KeyValue)
                    break
                case .failure(let error):
                    failure(error)
                    break
                }
        }
    }
    
    public func getNative(success:@escaping (KeyValue) -> Void,failure:@escaping (Error) -> Void){
        var params:[String:Any] = baseParam
        params.updateValue("native", forKey: "ad_format")
        params.updateValue("random", forKey: "option")
        Alamofire.request(kUrl,method: .get, parameters: params)
            .responseJSON {response in
                print(response.error)
                print(response.request)
                switch (response.result){
                case.success(let data):
                    success(data as! KeyValue)
                    break
                case .failure(let error):
                    failure(error)
                    break
                }
        }
    }
    
    public func getNativeList(success:@escaping (KeyValue) -> Void,failure:@escaping (Error) -> Void){
        var params:[String:Any] = baseParam
        params.updateValue("native_list", forKey: "ad_format")
        Alamofire.request(kUrl,method: .get, parameters: params)
            .responseJSON {response in
                switch (response.result){
                case.success(let data):
                    success(data as! KeyValue)
                    
                    break
                    
                case .failure(let error):
                    failure(error)
                    break
                }
                
        }
    }
    public func openLink(url:String,success:@escaping (KeyValue) -> Void,failure:@escaping (Error) -> Void){
        
        Alamofire.request(url,method: .get, parameters: nil)
            .responseJSON {response in
                switch (response.result){
                case.success(let data):
                    success(data as! KeyValue)
                    
                    break
                    
                case .failure(let error):
                    failure(error)
                    break
                }
                
        }
    }
}

//MARK:- Report
extension SMNetwork {
    
    public func callAPIClickAd(_ campaign_id :Int, size: String ,success:@escaping (KeyValue) -> Void,failure:@escaping (Error) -> Void){
        var params:[String:Any] = baseParam
        params.updateValue(campaign_id, forKey: "campaign")
        params.updateValue(size, forKey: "size")

        Alamofire.request(kUrlClickAd,method: .get, parameters: params)
            .responseJSON {response in
                switch (response.result){
                case.success(let data):
                    success(data as! KeyValue)
                    break
                case .failure(let error):
                    failure(error)
                    break
                }
        }
    }
    
    public func callAPIViewAd(_ campaign_id :Int, size: String ,success:@escaping (KeyValue) -> Void,failure:@escaping (Error) -> Void){
           var params:[String:Any] = baseParam
           params.updateValue(campaign_id, forKey: "campaign")
           params.updateValue(size, forKey: "size")

           Alamofire.request(kUrlViewAd,method: .get, parameters: params)
               .responseJSON {response in
                   switch (response.result){
                   case.success(let data):
                       success(data as! KeyValue)
                       break
                   case .failure(let error):
                       failure(error)
                       break
                   }
           }
       }
}
