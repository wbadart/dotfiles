#!/bin/sh

rm -rf before after

alias plist='plutil -convert xml1 -o /dev/stdout'

cp -r ~/Library/Preferences before
echo 'Adjust your settings and hit return'
read
cp -r ~/Library/Preferences after

diff -qur before after
echo 'diff -u <(plist before/Preferences/com.etc.xyz) <(...)'

# Compare the two versions. Since they are binary files, you'll need to convert them to XML for comparison. I use an alias for this:

# $ diff -u <(plist before/Preferences/com.apple.loginwindow.plist) <(plist after/Preferences/com.apple.loginwindow.plist)
# --- /dev/fd/63  2013-01-23 18:20:29.000000000 +0200
# +++ /dev/fd/62  2013-01-23 18:20:29.000000000 +0200
# @@ -9,7 +9,7 @@
#     <key>RetriesUntilHint</key>
#     <integer>3</integer>
#     <key>SHOWFULLNAME</key>
# -   <false/>
# +   <true/>
#     <key>lastUser</key>
#     <string>loggedIn</string>
#     <key>lastUserName</key>

# At this point we have located the setting. Confirm we have it with defaults:

# $ defaults read /Library/Preferences/com.apple.loginwindow SHOWFULLNAME
# 1
# $ sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool false
# $ defaults read /Library/Preferences/com.apple.loginwindow SHOWFULLNAME
