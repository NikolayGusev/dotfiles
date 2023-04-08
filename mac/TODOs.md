## Tasks
### Sofle
- mod1 + left right move with cmd instead of control. As a result it jumps just as home/end buttons do, not word by word.
- vim hotkeys like "ctrl+d" to duplicate line

### Telescope
- ripgrep
- fzf plugin

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
