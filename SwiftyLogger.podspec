Pod::Spec.new do |s|

  s.name         = "SwiftyLogger"
  s.version      = "1.0.0"
  s.summary      = "SwiftyLogger is flexible logging abstraction written in Swift."

  s.homepage     = "https://github.com/mtynior/SwiftyLogger"
  s.license      = "MIT"
  
  s.author             = { "Michał Tynior" => "mtynior@gmail.com" }
  s.social_media_url   = "http://twitter.com/cadious_"

  s.platform     = :ios
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/mtynior/SwiftyLogger.git", :tag =>  s.version }
  s.source_files  = "SwiftyLogger/**/*.swift"
 
  s.requires_arc = true

end
