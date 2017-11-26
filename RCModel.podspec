Pod::Spec.new do |s|
  s.name               = 'RCModel'
  s.version            =  '1.0.0'
  s.license            =  { :type => 'Apache 2.0' }
  s.summary            =  'An iOS SDK to parse models to and from JSON'
  s.homepage           =  'https://www.rebelcreators.com'
  s.author             =  { 'Lorenzo Stanton' => 'lstanii@nmsu.edu' }
  s.source             =  { :git => 'git@github.com:RebelCreators/RCModel.git', :branch => "master" }
  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.12'
  s.requires_arc = true

  s.source_files = 'src/**/*.{h,m}'
  s.public_header_files = 'src/**/*.h'
  s.frameworks = 'Foundation'

end
