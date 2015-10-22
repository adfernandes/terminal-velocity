platform :osx, '10.10'

workspace 'Terminal Velocity'
xcodeproj 'Terminal Velocity'

# --- --- ---

target :TerminalVelocity, :exclusive => true do

  pod 'Sparkle', '~> 1.11'
  pod 'PLCrashReporter', '~> 1.2'

  link_with 'Terminal Velocity'

end

# --- --- ---

target :TerminalVelocityLauncher, :exclusive => true do

  pod 'PLCrashReporter', '~> 1.2'

  link_with 'Terminal Velocity Launcher'

end

# --- --- ---

# http://stackoverflow.com/a/32080491

post_install do |installer|
    installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
        configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
    end
end
