defaults write -g NSWindowShouldDragOnGesture -bool true
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
