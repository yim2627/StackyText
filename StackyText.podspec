#
# Be sure to run `pod lib lint StackyText.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StackyText'
  s.version          = '0.1.3'
  s.summary          = 'StackyText supports textBlock like LEGO'
  s.homepage         = 'https://github.com/yim2627/StackyText'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jiseong' => 'yim2627@gmail.com' }
  s.source           = { :git => 'https://github.com/yim2627/StackyText.git', :tag => s.version.to_s }
  s.source_files = 'Sources/StackyText/Classes/**/*'
  s.frameworks = 'UIKit'
  s.ios.deployment_target = '13.0'
  s.swift_versions = '5.0'
end
