Pod::Spec.new do |s|
  s.name = 'HandySpec'
  s.version = '1.0.0'
  s.summary = 'A library for applying spceification pattern.'
  s.description = <<-DESC
                  This library provides the specification design pattern main classes
                  as well as some of the helper in order to even make it more useful and more practical.
                  DESC
  s.homepage = 'https://github.com/AhmadFayyas/HandySpec'
  s.license = 'MIT'
  s.author = { 'Ahmad Fayyas' => 'ahmadfayyas101@gmail.com' }
  s.source = { :git => 'https://github.com/AhmadFayyas/HandySpec.git', :tag => s.version.to_s }
  
  s.swift_versions = ['5.1', '5.2']
  
  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'

  s.source_files = 'HandySpec/Classes/**/*'
end
