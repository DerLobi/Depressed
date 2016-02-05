platform :ios, '8.0'
use_frameworks!

target 'Depressed?' do
  pod 'ResearchKit', '~> 1.3'
end

target 'Depressed?Tests' do
  pod 'Quick', '~> 0.8'
  pod 'Nimble', '~> 3.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == "ResearchKit"
      target.build_configurations.each do |config|
          config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', 'ORK_LOG_LEVEL_NONE=1']
      end
    end
  end
end
