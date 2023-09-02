# Cheatsh in tmux with fzf
- https://www.youtube.com/watch?v=hJzqEAf2U4I&t=530s
- pipe into bat
- show in tmux popup
- map to cmd+h? That means that I have to unmap cmd+h from hide first.

# navigation between vim and tmux

- learn awesome tmux resource

- christoomey/vim-tmux-navigator
- https://github.com/joshmedeski/dotfiles/blob/a0e6a8d14e4946bb1df707a7522bcd05ba0b5364/.config/nvim/lua/plugins/tmux-navigator.lua#L3

- use "Q" OR "<Cmd-Q>" everywhere to close tab?
  - vimium
  - nvim
  - lf
  - lazygit
  - browser?

- ❗ See how other apps are using navigation and copy
- Decide if everything should be within max two keys pressed at once, not 3 or 4
- Navigation hierarchy:
  - 💡 nvim within file - hardlinks
    - use regular marks?
    - get a plugin that mimics bookmarks?
  - nvim relative
    - cmd + [, cmd + ] - prev, next
  - 💡 nvim between files
    - harpoon
      - gj/gk - next prev bookmark
      - gl - show bookmarks
      - gL - add bookmark
  - ✅ nvim splits
    - ctrl-hjkl to navigation
    - alt-hjkl to resize
  - ✅ tmux panes
    - Same as above
  - ✅ tmux tabs
    - next/prev
      - cmd+shift+[, cmd+shift+]
    - reorder 
      - "ctrl+b ,", "ctrl+b ."
    - switch to specific
      - cmd+[0-9]
  - 💡 tmux sessions
    - 💡 next/prev
    - show menu to pick one - cmd+o
    - 💡 fuzzy find/open sessions - https://github.com/joshmedeski/t-smart-tmux-session-manager
    - detach from session
  - 💡 amethyst windows
    - next/prev
  - 💡 amethyst layouts
    - next/prev
    - cmd+enter was removed for "swap current window with main window" because it breaks logseq's cycle todo statuses hotkey
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

