- Same hotkeys for lazygit and LF in nvim and in terminal.


# navigation between vim and tmux

- learn awesome tmux resource

- christoomey/vim-tmux-navigator
- https://github.com/joshmedeski/dotfiles/blob/a0e6a8d14e4946bb1df707a7522bcd05ba0b5364/.config/nvim/lua/plugins/tmux-navigator.lua#L3

- use "Q" OR "<Cmd-Q>" everywhere to close tab?
  - vimium
  - nvim

- Navigation hierarchy:
  - 💡 nvim within file
    - use regular marks?
    - get a plugin that mimics bookmarks?
  - 💡 nvim between files
    - harpoon
      - gj/gk - next prev bookmark
      - gl - show bookmarks
      - gL - add bookmark
  - 💡 nvim splits
    - ? use tmux instead?
      - Not sure if this is possible because for example DAP is using windows inside of nvim. Same for quicklist.
  - 💡 tmux panes
    - jump around - left/right/up/down
  - 💡 tmux tabs
    - next/prev
      - cmd+shift+[, cmd+shift+]
    - switch to specific
  - 💡 tmux sessions
    - next/prev
    - show menu to pick one
  - 💡 amethyst windows
    - next/prev
  - 💡 amethyst layouts
    - next/prev
  - 💡 desktops
    - move
    - next/prev
    - switch to specific

- cmd-q doesn't work in lazygit (only q works)

- some kind of whichkey for the terminal


# LF
- allow to quit with :q
- show available hotkeys with ? (something similar to which key?)

# Fish
- add to git this one 
  - .config/fish/functions/lfcd.fish

# Lazygit
- Open file for edit from lazygit with neovim when doing "e" on a file.

