Pod::Spec.new do |spec|
  spec.name             = 'HSCryptoX11'
  spec.version          = '1.0.0'
  spec.summary          = 'X11 hash functions Swift adapter.'

  spec.homepage         = 'https://github.com/horizontalsystems/crypto-x11-ios'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }

  spec.author = { 'Horizontal Systems' => 'hsdao@protonmail.ch' }
  spec.social_media_url = 'http://horizontalsystems.io/'

  spec.requires_arc = true
  spec.source = { git: 'https://github.com/horizontalsystems/crypto-x11-ios.git', tag: "#{spec.version}" }
  spec.source_files = 'HSCryptoX11/**/*.{h,m,swift}'
  spec.ios.deployment_target = '10.0'
  spec.swift_version = '4.1'

  s.framework = 'Foundation', 'SystemConfiguration'
end
