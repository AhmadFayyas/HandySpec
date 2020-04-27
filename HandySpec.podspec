Pod::Spec.new do |s|
  s.name             = 'HandySpec'
  s.version          = '1.0.0'
  s.summary          = 'A library for applying spceification pattern.'
  s.description      = 'This library provides the specification design pattern main classes as well as some of the helper in order to even make the pattern to be more useful and more practical.'

  s.homepage         = 'https://github.com/AhmadFayyas/HandySpec'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ahmad Fayyas' => 'ahmadfayyas101@gmail.com' }
  s.source           = { :git => 'https://github.com/AhmadFayyas/HandySpec.git', :tag => s.version.to_s }
  s.swift_versions  = '5.0'
  # s.social_media_url = ''
  
  s.osx.deployment_target = '10.14'
  s.ios.deployment_target = '12.0'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'HandySpec/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HandySpec' => ['HandySpec/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
