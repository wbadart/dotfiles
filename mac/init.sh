#!/bin/sh

# Initialize dev tools to access git, gcc, ...
git --version > /dev/null || xcode-select --install &

# Set login shell to zsh
if ! echo $SHELL | grep -q 'zsh' && which -s zsh; then
    chsh -s `which zsh`
fi

# Download sexy color scheme
THEME_PATH="$HOME/Downloads/Molokai.terminal"
THEME_URL='https://rawgit.com/lysyi3m/osx-terminal-themes/master/schemes/Molokai.terminal'

if [ ! -f "$THEME_PATH" ]; then
    curl -sL "$THEME_URL" > "$THEME_PATH"
    open "$THEME_PATH"
fi

defaults write com.apple.Terminal "Default Window Settings" 'Molokai'
defaults write com.apple.Terminal "Startup Window Settings" 'Molokai'

defaults write ~/Library/Preferences/.GlobalPreferences AppleInterfaceStyle Dark

exit 0

# Set system preferences
cd defaults
for plist in `ls`; do
    arg=\'`cat $plist`\'
    echo $arg
    defaults write $plist $arg
done
cd ..
