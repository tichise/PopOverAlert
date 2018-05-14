Pod::Spec.new do |s|
  s.name = 'PopOverAlert'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'PopOverAlert is a PopOver style alert view.'
  s.homepage = 'https://github.com/tichise/PopOverAlert'
  s.social_media_url = 'http://twitter.com/tichise'
  s.author = "Takuya Ichise"
  s.source = { :git => 'https://github.com/tichise/PopOverAlert.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Sources/*.swift'
  s.requires_arc = true

  s.resource_bundles = {
    'Storyboards' => [
        'Storyboards/*.storyboard'
    ]
  }
end
