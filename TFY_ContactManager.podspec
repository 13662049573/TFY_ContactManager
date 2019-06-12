

Pod::Spec.new do |spec|

  spec.name          = "TFY_ContactManager"

  spec.version       = "2.0.1"
  
  spec.summary       = "只支持ios9以上的通讯录的封装"

  spec.description   = "只支持ios9以上的通讯录的封装"

  spec.homepage      = "https://github.com/13662049573/TFY_ContactManager"
  
  spec.license       = "MIT"
  
  spec.author        = { "tianfengyou" => "420144542@qq.com" }
  
  spec.platform      = :ios, "10.0"

  spec.source        = { :git => "https://github.com/13662049573/TFY_ContactManager.git", :tag => spec.version }

  spec.source_files  = "TFY_ContactManager/TFY_ContactManager/**/*.{h,m}","TFY_ContactManager/TFY_ContactManager/TFY_ContactHeader.h"
  
  spec.frameworks    = "Foundation","UIKit"

  spec.xcconfig      = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include" }

  spec.requires_arc  = true

 
end
