# General

- Abolish and vim.vis fix
  - https://github.com/tpope/vim-abolish/issues/56#issuecomment-457929759
  - See what it does and decide if necessary
- see if this is what I need to do the replacements in vscode
- Nvim as default text editor in windows
- Check if I still need those <leader>o and <leader>O bindings

# ANKI

- iv, av for camelCase intermediate-word motion
- sandwich surrounding function csf, ysiwf, etc
- sandwich 2ysa" to surround with two surroundings
- sandwich i, f, t objects
- cin<surrounding>, cil<surrounding> to change inside next/prev surrounding (or another op)
- change visual selection side - o
- entire buffer selector
- entire visible screen selector
- replace <leader>s, <leader><leader>ss, etc
- Y to yank to the end anki card
- gi to continue input at the last edit
- crs, cru commands.
- - Want to turn fooBar into foo_bar? Press crs (coerce to snake_case). MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru), dash-case (cr-), dot.case (cr.), space case (cr<space>), and Title Case (crt) are all just 3 keystrokes away.
- Abolish docs.
- Abolish - %S instead of %S for case insensitive replace.
- "vaBVd" to delete function to anki cards
- alt+kj to move lines
- ctrl+a/x - increment/decrement numbers

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
