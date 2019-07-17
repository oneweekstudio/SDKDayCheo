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
### Code

```ruby
full = SMInterstitial()
full.rootViewController = self
full.delegate = self
full.load()
```
### Show
```ruby
full.show()
```
### Delegate
```ruby
@objc optional func interstitialLoaded(interstitial:SMInterstitial)
@objc optional func interstitialError()
@objc optional func interstitialDidClick()
@objc optional func interstitialCloseClick()
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
