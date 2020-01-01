#
#  Be sure to run `pod spec lint LRadioButton.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "LRadioButton"
  spec.version      = "0.1.1"
  spec.summary      = "create RadioButton"

  spec.description  = "You can make a RadioButton"

  spec.homepage     = "https://github.com/wrench0318/LRadioButton"

  spec.author       = "Masaharu Dobashi"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.platform     = :ios
  spec.platform     = :ios, "10.0"
  spec.swift_version = '5.0'
  spec.ios.deployment_target = "10.0"


  spec.source       = { :git => "https://github.com/wrench0318/LRadioButton.git", :tag => "v#{spec.version}" }
  spec.source_files  = "LRadioButton/**/*.{swift,h,m}"


end
