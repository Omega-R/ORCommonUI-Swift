#
# Be sure to run `pod lib lint ORCommonUI-Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ORCommonUI-Swift'
  s.version          = '1.0.0'
  s.summary          = 'ORCommonUI-Swift - UI extensions, custom views, controllers.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'ORButton, UIViewController+ChildViewController, UIScrollView+KeyboardInsetHandler, ORKeyboardLayoutConstraint, ORDependentOnScreenScaleSeparator, UIView+HideKeyboard, UIViewController+Alert, ORGradientView/ORRadialGradientView, ORRoundRectView/ORRoundRectButton, ORTopViewController (find topmost vc), ORUserInteractionDisabler, UITableViewCell+BottomSeparator, UITableView+RegisterCell, UICollectionView+RegisterCell, ORDashedView, ORTabBar, UIView+Nib, UIView+Snapshot, UIColor+Extended, UIImage+Color, round views, etc.'
                       DESC

  s.homepage         = 'https://github.com/Omega-R/ORCommonUI-Swift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Nikita Egoshin" => "nikita.egoshin@omega-r.com", "Sergey Aleksandrov" => "sergey.aleksandrov@omega-r.com", "Alexey Vedushev" => "alexey.vedushev@omega-r.com",  "Dmitriy Mamatov" => "dmitriy.mamatov@omega-r.com", 'Egor Lindberg' => 'egor.lindberg@omega-r.com' }
  s.source           = { :git => 'https://github.com/Omega-R/ORCommonUI-Swift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.requires_arc = true

  s.source_files = 'Sources/ORCommonUI-Swift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ORCommonUI-Swift' => ['ORCommonUI-Swift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'PureLayout', '~> 3.1.6'
end
