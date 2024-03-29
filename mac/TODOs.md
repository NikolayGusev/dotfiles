## Tasks

- [ ] cmd+' should switch to main window only, not toggle between main and secondary one
- [ ] cmd+j/k should only change rotate secondary windows and not change the focus

### Sofle
- mod1 + left right move with cmd instead of control. As a result it jumps just as home/end buttons do, not word by word.

### Telescope
- ripgrep
- fzf plugin

### fzf
- let g:fzf_layout = { 'up': '~50%' }
    => You get the FZF search entry right in the center of the screen. I find it annoying to look at the bottom of my 32" screen in portrait mode when I use FZF
- Find how to use it with ripgrep fast together, so that fzf feeds its filter into rg.

### Tmux
- https://github.com/joshmedeski/dotfiles/blob/main/.config/tmux/tmux.conf


## Apps
* Amethyst
* hammerspoon                           - automation, e.g. message when some process is finished
* alfred / spotter
* karabiner                             - remap keys 

### Nvim setup
- https://dev.to/craftzdog/my-neovim-setup-for-react-typescript-tailwind-css-etc-58fb

### Lazy git
- https://github.com/so-fancy/diff-so-fancy. Diff for lazygit that shows word diffs. Is a script so should work w/o admin permissions. https://github.com/jesseduffield/lazygit/blob/master/docs/Custom_Pagers.md

### Stop quitting Alacritty with cmd+q
Open Keyboard -> Shortcuts -> App shortcuts
Add Alacritty
Find the name of the quit command in Alacritty's items bar
Add the command with the same name in shortcuts, but give it a different shortcut to override

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

```
# Do not close apps with "cmd+h". 
# Use ```osascript -e 'id of app "ApplicationName"'``` to get the app id.
defaults write org.alacritty NSUserKeyEquivalents -dict-add "Hide alacritty" -string "@~h"
defaults write com.google.Chrome NSUserKeyEquivalents -dict-add "Hide Google Chrome" -string "@~h"
```
