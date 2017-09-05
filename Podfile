use_frameworks!

platform :ios, '9.0'
swift_version = '3.1'

def import_pods

# Crash Reporter
pod 'Fabric', '~> 1.6.11'
pod 'Crashlytics', '~> 3.8.4'

# Circle Indicator
pod 'PKHUD', '~> 4.2.2'

# Web Client
pod 'WebStruct',        :git => 'https://github.com/iq3addLi/WebStruct.git', :tag => '0.6.2'

# Markdown Renderer
pod 'MarkdownView', '~> 1.0.3'

# Injector
pod 'Swinject', '~> 2.1.1'

# Toaster
pod 'Toaster', '~> 2.0.4'

end

target 'motorhomes' do
import_pods
end

target 'motorhomesTests' do
import_pods
end
