#
# Be sure to run `pod lib lint GitHubMoyaMoya.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GitHubMoyaMoya'
  s.version          = '0.1.0'
  s.summary          = 'A short description of GitHubMoyaMoya.'
  s.homepage         = 'https://github.com/dev-jason-hwkim/GitHubMoyaMoya'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jason' => 'dev.hwkim@gmail.com' }
  s.source           = { :git => 'https://github.com/dev-jason-hwkim/GitHubMoyaMoya.git',
                         :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
    
  s.swift_version = '5.0'
  
  s.source_files = 'Sources/**/*.{swift,h,m}'
  
  s.dependency 'MoyaSugar', '~> 1.3.3'
  s.dependency 'Moya/RxSwift', '~> 15.0.0'

end
