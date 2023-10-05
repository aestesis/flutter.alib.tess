Pod::Spec.new do |s|
    s.name             = "flutter.alib.tess"
    s.version          = "1.0.0"
    s.summary          = "libtess cocoa pod"
    s.description      = <<-DESC
    libtess cocoa pod framework
                         DESC
    s.homepage         = "https://github.com/aestesis/flutter.alib.tess"
    s.license          = 'MIT'
    s.author           = { "aestesis" => "renan@aestesis.org" }
    s.source           = { :git => "https://github.com/aestesis/flutter.alib.tess.git", :tag => s.version.to_s }
  
    s.ios.deployment_target = "12.0"
    s.osx.deployment_target = "11.0"
    s.requires_arc = true

    s.platform = :osx, '11.0'
    s.platform = :ios, '12.0'

    s.ios.framework = "tessIOS"
    s.osx.framework = "tessOSX"
  end