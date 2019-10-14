//
//  SMNativeDelegate.swift
//  Pods
//
//  Created by Hintoro on 10/14/19.
//

import Foundation

@objc protocol SMNativeViewDelegate {
    
    @objc optional func nativeViewDidLoad(_ ad: SMNativeView)
    @objc optional func nativeView(_ ad: SMNativeView, didFailWithError error: Error)
    
    @objc optional func nativeViewDidClose(_ ad: SMNativeView)
    @objc optional func nativeViewDidClick(_ ad: SMNativeView)
    @objc optional func nativeViewDidFinishHandlingClick(_ ad: SMNativeView)
}
