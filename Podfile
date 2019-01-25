platform :ios, '11.0'
inhibit_all_warnings!
use_frameworks!

target 'Depressed?' do
  pod 'ResearchKit', '~> 2.0'
end

target 'Depressed?Tests' do
  pod 'Quick', '~> 1.3'
  pod 'Nimble', '~> 7.3'
  pod 'ResearchKit', '~> 2.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == "ResearchKit"
      target.build_configurations.each do |config|
          config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', 'ORK_LOG_LEVEL_NONE=1']
          config.build_settings['GCC_NO_COMMON_BLOCKS'] = 'NO'
      end
    end
  end
end
