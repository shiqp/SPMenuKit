#
# Be sure to run `pod lib lint SPMenuKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SPMenuKit'
  s.version          = '0.1.0'
  s.summary          = 'SPMenuKit is a simple kit to present images for UIMenuController.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  SPMenuKit supports to present images for UIMenuController. The main class SPMenuItem inherits from UIMenuItem.
                       DESC

  s.homepage         = 'https://github.com/shiqp/SPMenuKit'
  # s.screenshots      = 'https://github.com/shiqp/SPMenuKit/blob/master/ScreenShot.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shiqp' => 'qingpu.shi@gmail.com' }
  s.source           = { :git => 'https://github.com/shiqp/SPMenuKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'

  s.source_files = 'SPMenuKit/Classes/**/*.{swift,h,m}'
  
  # s.resource_bundles = {
  #   'SPMenuKit' => ['SPMenuKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
