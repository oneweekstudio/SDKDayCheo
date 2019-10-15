//
//  SMNativeDelegate.swift
//  Pods
//
//  Created by Hintoro on 10/14/19.
//

import Foundation

@objc public protocol SMNativeViewDelegate {
    
    //Khi quảng cáo đã tải xong
    @objc optional func nativeViewDidLoad(_ ad: SMNativeView)
    
    //Khi tải quảng cáo native về bị failure
    @objc optional func nativeView(_ ad: SMNativeView, didFailWithError error: Error)
    
    //Khi người dùng click vào nút "Cancel"
    @objc optional func nativeViewDidClose(_ ad: SMNativeView)
    
    //Khi người dùng click vào nút "Get it!"
    @objc optional func nativeViewDidClick(_ ad: SMNativeView)
    
    //Hiện tại chưa dùng tới
    @objc optional func nativeViewDidFinishHandlingClick(_ ad: SMNativeView)
}
