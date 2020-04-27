Pod::Spec.new do |s|
  s.name             = 'HandySpec'
  s.version          = '1.0.0'
  s.summary          = 'A library for applying spceification pattern.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  #s.description      = <<-DESC

  s.homepage         = 'https://github.com/AhmadFayyas/HandySpec'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ahmad Fayyas' => 'ahmadfayyas101@gmail.com' }
  s.source           = { :git => 'https://github.com/AhmadFayyas/HandySpec.git', :tag => s.version.to_s }
  s.swift_versions  = '5.0'
  # s.social_media_url = ''

  s.ios.deployment_target = '11.0'

  s.source_files = 'Source/**/*'
  
  # s.resource_bundles = {
  #   'HandySpec' => ['HandySpec/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
