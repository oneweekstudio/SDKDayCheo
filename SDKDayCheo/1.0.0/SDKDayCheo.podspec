#
# Be sure to run `pod lib lint SDKDayCheo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SDKDayCheo'
  s.version          = '1.0.0'
  s.summary          = 'SDKDayCheo V2'
  s.swift_version    = '5.0'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'This description is used to generate tags and improve search results'

  s.homepage         = 'https://github.com/oneweekstudio/SDKDayCheo'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'truongtvd' => 'truong@smartmove.vn' }
  s.source           = { :git => 'https://github.com/oneweekstudio/SDKDayCheo.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'SDKDayCheo/Classes/**/*'
  
   s.resource_bundles = {
     'SDKDayCheo' => ['SDKDayCheo/Assets/*']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.static_framework = true
  #  s.public_header_files = 'Classes/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.ios.dependency 'Alamofire'
  s.ios.dependency 'MagicMapper'
end
