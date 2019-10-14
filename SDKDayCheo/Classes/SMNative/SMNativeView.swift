//
//  SMNative.swift
//  Pods
//
//  Created by Hintoro on 10/14/19.
//

import Foundation
import UIKit

open class SMNativeView : NSObject {
    
    var delegate: SMNativeViewDelegate?
    
        
    func present(_ controller: UIViewController) {
        let nativeViewController = UIStoryboard.init(name: "SMNative", bundle: getBundlePath()).instantiateViewController(withIdentifier: "SMNativeController") as! SMNativeController
        controller.present( nativeViewController, animated: true)
        
    }
    
    
}
