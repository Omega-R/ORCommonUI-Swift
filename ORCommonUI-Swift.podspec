#
# Be sure to run `pod lib lint ORCommonUI-Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ORCommonUI-Swift"
  s.version          = "4.2.9"
  s.summary          = "ORCommonUI-Swift - UI extensions, custom views, controllers."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "ORButton, UIViewController+ChildViewController, UIScrollView+KeyboardInsetHandler, ORKeyboardLayoutConstraint, ORDependentOnScreenScaleSeparator, UIView+HideKeyboard, UIViewController+Alert, ORGradientView/ORRadialGradientView, ORRoundRectView/ORRoundRectButton, ORTopViewController (find topmost vc), ORUserInteractionDisabler, UITableViewCell+BottomSeparator, UITableView+RegisterCell, UICollectionView+RegisterCell, ORDashedView, ORTabBar, UIView+Nib, UIView+Snapshot, UIColor+Extended, UIImage+Color, round views, etc."

  s.homepage         = "https://bitbucket.org/omegarinc/orcommonui-swift"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Maxim Soloviev" => "maxim@omega-r.com", "Alexander Kurbanov" => "kurbanov.alex@omega-r.com" }
  s.source           = { :git => "https://bitbucket.org/omegarinc/orcommonui-swift.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ORCommonUI-Swift' => ['Pod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'ORCommonCode-Swift', '>= 3.0.0'
  s.dependency 'PureLayout', '~> 3.0'
end
