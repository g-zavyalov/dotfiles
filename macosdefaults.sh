# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true