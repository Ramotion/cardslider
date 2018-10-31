Pod::Spec.new do |s|
    s.name             = 'CardSlider'
    s.version          = '0.0.1'
    s.summary          = 'UI control from Ramotion'
    s.description      = 'Custom UICollectionView with transition'
    s.homepage         = 'https://github.com/ramotion/cardslider'
    s.license          = 'MIT'
    s.author           = 'J. Vasilenko'
    s.social_media_url = 'https://twitter.com/Ramotion'
    s.source           = { :git => 'https://github.com/Ramotion/cardslider.git', :tag => s.version.to_s }

    s.ios.deployment_target = '11.0'

    s.source_files  = 'CardSlider/**/*.{swift}'
    s.resource_bundles = {
    'CardSlider' => ['CardSlider/**/*.{storyboard,.xcassets}']
  }
end
