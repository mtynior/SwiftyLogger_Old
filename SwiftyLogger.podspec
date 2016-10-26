Pod::Spec.new do |s|

  s.name         = "SwiftyLogger"
  s.version      = "2.0.0"
  s.summary      = "SwiftyLogger is flexible logging abstraction written in Swift."

  s.homepage     = "https://github.com/mtynior/SwiftyLogger"
  s.license      = "MIT"
  
  s.author             = { "Michał Tynior" => "mtynior@gmail.com" }
  s.social_media_url   = "http://twitter.com/mtynior"

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source       = { :git => "https://github.com/mtynior/SwiftyLogger.git", :tag =>  s.version }
  s.source_files  = "Source/**/*.swift"
 
  s.requires_arc = true

end
