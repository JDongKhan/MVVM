Pod::Spec.new do |s|
    s.name             = 'MVVM'
    s.version          = '0.0.1'
    s.summary          = 'A short description of MVVM.'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://github.com/JDongKhan/MVVM.git'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'JD' => '419591321@qq.com' }
    s.source           = { :git => 'https://github.com/JDongKhan/MVVM.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://github.com/JDKhang/MVVM'
    
    s.ios.deployment_target = '9.0'
    s.requires_arc = true
    s.source_files = 'Sources/**/*.{h,m}'   #指定源码位置
    s.public_header_files = 'Sources/**/*.h'
    
end
