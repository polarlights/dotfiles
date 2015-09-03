### Howto import iterm2 color themes
* Type CMD+i
* Navigate to Colors tab
* Click on Load Presets
* Click on Import
* Select the .itermcolors file(s) of the scheme(s) you'd like to use
* Click on Load Presets and choose a color scheme


### Howto import iterm2 configration file
* Open iTerm2, so a default com.googlecode.iterm2.plist file is created.
* Quit iTerm2
* Deleted all cached preferences for iterm2 by issuing defaults delete com.googlecode.iterm2
* Copied the file to the new Mac in the correct location inside Preferences folder, so I had my old profiles and settings back
* Read in the prefs file with defaults read -app iTerm
* Open iTerm2 and was happy to have profiles and window arrangements on my new Mac
