## Tasks
### Sofle
- mod1 + left right move with cmd instead of control. As a result it jumps just as home/end buttons do, not word by word.


## Apps
* Amethyst
* hammerspoon                           - automation, e.g. message when some process is finished
* alfred / spotter
* karabiner                             - remap keys 


### defaults example dotfile
- https://github.com/mathiasbynens/dotfiles/blob/main/.macos
- https://github.com/janka102/dotfiles/blob/master/defaults.sh

```
# Set faster key repeat
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
defaults write -g ApplePressAndHoldEnabled -bool false
```

Alternative version
```
# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
```
