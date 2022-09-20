

Pod::Spec.new do |spec|

  spec.name         = "DRMacros"
  spec.version      = "1.0.1"
  spec.summary      = "DRMacros for OC"
  spec.description  = "DRMacros for OC tool"
  spec.homepage     = "https://github.com/shuiyue184480/DRMacros"
  spec.license      = "MIT"
  spec.author       = { "shuiyue184480" => "shuiyue184480" }
  spec.platform     = :iOS
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/shuiyue184480/DRMacros.git", :tag => "1.0.1" }
  spec.source_files  = "DRMacros/Classes/*.{h,m}"

end
