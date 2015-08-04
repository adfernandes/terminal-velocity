platform :osx, '10.9'

workspace 'Terminal Velocity'
xcodeproj 'Terminal Velocity'

# --- --- ---

target :TerminalVelocity, :exclusive => true do

  pod 'Sparkle', '~> 1.0'
  pod 'PLCrashReporter', '~> 1.2'

  link_with 'Terminal Velocity'

end

# --- --- ---

target :TerminalVelocityLauncher, :exclusive => true do

  pod 'PLCrashReporter', '~> 1.2'

  link_with 'Terminal Velocity Launcher'

end

# --- --- ---
