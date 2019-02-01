Pod::Spec.new do |s|
  s.name         = "QLHomeModel"
  s.version      = "0.0.1"
  s.summary      = "QLHomeModel趣浪首页"

  s.homepage     = "https://github.com/aliang124/QLHomeModel"

  s.license      = "MIT"
  s.author             = { "jienliang000" => "jienliang000@126.com" }

  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.requires_arc = true

  s.source       = { :git => "https://github.com/aliang124/QLHomeModel.git", :tag => "#{s.version}" }
  s.source_files  = "QLHomeModel/*.{h,m}"

  s.subspec 'Cell' do |ss|
  ss.source_files = 'QLHomeModel/Cell/**/*.{h,m,c,mm}'
  end

  s.subspec 'NetWorking' do |ss|
  ss.source_files = 'QLHomeModel/NetWorking/**/*.{h,m,c,mm}'
  end

  s.subspec 'View' do |ss|
  ss.source_files = 'QLHomeModel/View/**/*.{h,m,c,mm}'
  end

end
