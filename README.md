# SDKDayCheo

[![CI Status](https://img.shields.io/travis/truongtvd/SDKDayCheo.svg?style=flat)](https://travis-ci.org/truongtvd/SDKDayCheo)
[![Version](https://img.shields.io/cocoapods/v/SDKDayCheo.svg?style=flat)](https://cocoapods.org/pods/SDKDayCheo)
[![License](https://img.shields.io/cocoapods/l/SDKDayCheo.svg?style=flat)](https://cocoapods.org/pods/SDKDayCheo)
[![Platform](https://img.shields.io/cocoapods/p/SDKDayCheo.svg?style=flat)](https://cocoapods.org/pods/SDKDayCheo)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
### Debug
```ruby
SMConfig.setDebug(true)
```
### Interstitial
Khởi tạo quảng cáo full
```ruby
full = SMInterstitial()
full.rootViewController = self
full.delegate = self
full.load()
```
Hiển thị quảng cáo full
```ruby
full.show()
```
Delegate
```ruby
@objc optional func interstitialLoaded(interstitial:SMInterstitial)
@objc optional func interstitialError()
@objc optional func interstitialDidClick()
@objc optional func interstitialCloseClick()
```


### Quảng cáo Native ( dạng hiển thị Dialog )
Khởi tạo quảng cáo dạng Native
```ruby
var native: SMNativeView = SMNativeView()
```

Tải quảng cáo Native
```ruby
       native.delegate = self
       native.load()
```

Delegate
```ruby
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
```

Ví dụ
```ruby
    //Khi adNative load thành công. Gọi hiển thị dialog bằng cách :
    func nativeViewDidLoad(_ ad: SMNativeView) {
        ad.showDialog(UIController: self) // Gọi hiển thị quảng cáo Dialog
    }
```

### Quảng cáo Native tùy chỉnh
Class SMNativeView  : Hỗ trợ lấy  Ad Unit, Redirect link, Call API report
```ruby
   //Hàm trả về Ad Unit
   func getAdsObject() -> SMAds?
   
   //Khi người dùng ấn vào nút "download, hay get it!"
   //Việc này sẽ kiểm tra link từ server trả về là deeplink hay store link để điều hướng cho phù hợp
   func requestClickCampaign()
   
   //Kiểm tra store link hay deeplink
   func checkDynamicLink() -> Bool 
   
   //Hàm này chuyển sang 1 controller  trong SMNative.storyboard để xử lý deeplink
   func openDeepLink()
   
   //Hàm này chuyển sang store
   func openAppStore()
   
   //Hàm này được gọi khi người dùng ấn "get it"
   func callAPIClickAd()
   
   //Hàm này được gọi khi native custom show
   func callAPIClickAd()
```

## Requirements
- iOS 9.0
- Xcode 10.2+
- Swift 4.2+
## Installation

SDKDayCheo is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SDKDayCheo', :git => 'https://github.com/oneweekstudio/SDKDayCheo.git', :branch => 'master'
```


## Author

truongtvd, truong@smartmove.vn

## License

SDKDayCheo is available under the MIT license. See the LICENSE file for more info.
