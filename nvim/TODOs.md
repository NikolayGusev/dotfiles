# General

- Why can't I use "z" for leap in visual mode, just like in replace mode? Or even better use ' in both modes like in normal mode?
- Abolish and vim.vis fix
  - https://github.com/tpope/vim-abolish/issues/56#issuecomment-457929759
  - See what it does and decide if necessary
- see if this is what I need to do the replacements in vscode
- Nvim as default text editor in windows
- nomagic mode for s replace and / search

# Better hotkeys

- swap "iw" with "w" and so on?

# ANKI

- ANKI iv, av for camelCase intermediate-word motion
- ANKI sandwich surrounding function csf, ysiwf, etc
- ANKI sandwich 2ysa" to surround with two surroundings
- ANKI sandwich i, f, t objects
- ANKI cin<surrounding>, cil<surrounding> to change inside next/prev surrounding (or another op)
- ANKI change visual selection side - o
- ANKI entire buffer selector
- ANKI entire visible screen selector
- ANKI replace <leader>s, <leader><leader>ss, etc
- ANKI Y to yank to the end anki card
- ANKI crs, cru commands.
- - Want to turn fooBar into foo_bar? Press crs (coerce to snake_case). MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru), dash-case (cr-), dot.case (cr.), space case (cr<space>), and Title Case (crt) are all just 3 keystrokes away.
- ANKI Abolish docs.
- ANKI Abolish - %S instead of %S for case insensitive replace.
- ANKI "vaBVd" to delete function to anki cards
- ANKI alt+kj to move lines
- ANKI ctrl+a/x - increment/decrement numbers

- ANKI

  - find-and-replace.md

- ANKI folds:
  zM :call VSCodeNotify('editor.foldAll')<CR>
  zR :call VSCodeNotify('editor.unfoldAll')<CR>
  zc :call VSCodeNotify('editor.fold')<CR>
  zC :call VSCodeNotify('editor.foldRecursively')<CR>
  zo :call VSCodeNotify('editor.unfold')<CR>
  zO :call VSCodeNotify('editor.unfoldRecursively')<CR>
  za :call VSCodeNotify('editor.toggleFold')<CR>

# Strategic

- switch to lua and lazy.nvim - https://github.com/folke/lazy.nvim#-structuring-your-plugins
- fzf
  \*\* https://github.com/yuki-yano/fzf-preview.vim#demo

## Tree sitter stuff

- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
- Tree sitter requires c compiler https://github.com/nvim-treesitter/nvim-treesitter
- abecodes/tabout.nvim - exit context "({ etc faster
- nvim-trevJ.lua - anti-<S-J>
- tab out of arguments - https://github.com/abecodes/tabout.nvim
