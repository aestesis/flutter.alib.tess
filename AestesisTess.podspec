
# https://stackoverflow.com/questions/31445691/making-a-cocoapod-from-an-existing-xcode-project
# https://github.com/CocoaPods/Xcodeproj


require 'xcodeproj'

project = Xcodeproj::Project.open('LibTess.xcodeproj')
targetIOS = project.targets.select { |target| target.name == 'tessIOS' }.first
targetOSX = project.targets.select { |target| target.name == 'tessOSX' }.first

def self.relative_file_paths(build_phase)
  folder_path_length = __dir__.length + 1  # add '/' to the end
  paths = build_phase.files_references.map{ |f| f.real_path.to_s[folder_path_length..-1] }
  puts build_phase, paths
  return paths
end

Pod::Spec.new do |s|
  s.name             = "AestesisTess"
  s.version          = "1.0.15"
  s.summary          = "libtess cocoa pod"
  s.description      = <<-DESC
  libtess cocoa pod framework
                       DESC
  s.homepage         = "https://github.com/aestesis/flutter.alib.tess"
  s.license          = "MIT"
  s.author           = { "aestesis" => "renan@aestesis.org" }
  s.source           = { :git => "https://github.com/aestesis/flutter.alib.tess.git", :tag => "v" + s.version.to_s }

  s.ios.deployment_target = "12.0"
  s.osx.deployment_target = "11.0"
  s.requires_arc = true

  s.platform = :osx, '11.0'
  s.platform = :ios, '12.0'

  headers = ['glu/include/GL/glext.h', 'glu/src/libtess.exclude/priorityq-heap.c.h']
  headersIOS = (self.relative_file_paths targetIOS.headers_build_phase) 
  headersOSX = (self.relative_file_paths targetOSX.headers_build_phase) 
  s.ios.source_files = (self.relative_file_paths targetIOS.source_build_phase) + headersIOS + headers
  s.osx.source_files = (self.relative_file_paths targetOSX.source_build_phase) + headersOSX + headers
  s.public_header_files = ['shared/export.h']
end
