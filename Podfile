# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# 添加flutter模块路径
flutter_application_path = '../my_flutter'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'LeetCodeExample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'RxSwift', '6.5.0'
  pod 'RxCocoa', '6.5.0'
  pod 'SnapKit'
  pod 'SDWebImage'

  # 安装Flutter模块
  install_all_flutter_pods(flutter_application_path)
  # Pods for LeetCodeExample

  target 'LeetCodeExampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'LeetCodeExampleUITests' do
    # Pods for testing
  end

end
