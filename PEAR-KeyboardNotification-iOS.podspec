Pod::Spec.new do |s|
   s.name     = 'PEAR-KeyboardNotification-iOS'
   s.version  = '0.0.1'
   s.platform = :'ios', '7.0'
   s.license  = 'MIT'
   s.summary  = 'keyboard notification Library for iOS'
   s.homepage = 'https://github.com/HirokiUmatani'
   s.author   = { "HirokiUmatani" => "info@pear.chat" }
   s.source   = { :git => 'https://github.com/HirokiUmatani/PEAR-KeyboardNotification-iOS.git', :tag => s.version.to_s }
   s.source_files = 'PEAR-KeyboardNotification-iOS/*.{h,m}'
   s.requires_arc = true
end
