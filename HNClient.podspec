Pod::Spec.new do |s|

  s.name = 'HNClient'
  s.version = '0.1'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = "a Client for Hacker News API"
  s.homepage = "https://github.com/omaralbeik/HNClient"
  s.author = { "Omar Albeik" => 'omaralbeik@gmail.com' }
  s.social_media_url = "http://twitter.com/omaralbeik"

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.requires_arc = 'true'
  s.source = { git: "https://github.com/omaralbeik/HNClient.git", tag: "#{s.version}" }
  s.source_files = 'Source/**/*.swift'
  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '3.0',
  }
  s.dependency 'AlamofireObjectMapper', '~> 4.1'
end
