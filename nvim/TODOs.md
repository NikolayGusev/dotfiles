# General

- 2<leader>j doesn't work (join two lines)

- is it possible to delete surrounding function which is static. E.g. for
  "Utils.convert(a)" leave just an "a" afterwards.

 
- VimBeGood custom challenges.
- https://github.com/junegunn/vim-easy-align - do I ever need this though? 
  - For simple non-repeatatie tasks column might be easier and more versatile. Otherwise just use language formatter.

- gri" doesn't work sometimes - not clear when - to be investigated

- I don't use. How do I remember to use those?
  - folds
  - jump to member
  - swap places with gs


- Cannots switch args in [] in this example:
```
    fn split_into_row_ranges(row: &str) -> RowRanges {
        row.split([',', '-']);
    }
```
- Abolish and vim.vis fix
  - https://github.com/tpope/vim-abolish/issues/56#issuecomment-457929759
  - See what it does and decide if necessary
- see if this is what I need to do the replacements in vscode
- Nvim as default text editor in windows
- Check if I still need those <leader>o and <leader>O bindings

- Second leader? Is that what major is for btw?
  - Can write more additional keybindings this way.
  - What about WhichKey? Does it support two hierarchies?

## Vim practice
- ^ instead of 0 to jump to the start of the line (first char)
  - it is easier to press on a keyboard as well

## Russian keys mapping

- Consider to map russian letters to vim english keys. E.g. like this:
  https://t.me/kydavoiti/207?comment=2804
  ```
  vim.api.nvim_command('set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz')
  ```

# ANKI

- iv, av for camelCase intermediate-word motion
- ii to expand selection in visual mode
- sandwich surrounding function csf, ysiwf, etc
- sandwich 2ysa" to surround with two surroundings
- sandwich i, f, t objects
- cin<surrounding>, cil<surrounding> to change inside next/prev surrounding (or another op)
- cIn<surrounding> - change inside next, keep whitespaces (replace in place)
- sandwich dss, css - automatically determine which surrounding to delete or change

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
- '{' and '}' in visual mode to select entire paragraphs faster
- gs 
  => hjkl - to move args around
	=> s/S  - sort/sort desc
  => r    - reverse
  => g/G  - expand/collapse selection
- g> and g< - move current arg left and right
- gs + visual line selection - does the same for visual
- '<space><space> to jump to an empty line

- ANKI

  - find-and-replace.md

- ANKI folds:
  za :call VSCodeNotify('editor.toggleFold')<CR>
  zc :call VSCodeNotify('editor.fold')<CR>
  zC :call VSCodeNotify('editor.foldRecursively')<CR>
  zM :call VSCodeNotify('editor.foldAll')<CR>
  zo :call VSCodeNotify('editor.unfold')<CR>
  zO :call VSCodeNotify('editor.unfoldRecursively')<CR>
  zR :call VSCodeNotify('editor.unfoldAll')<CR>

# Strategic

- switch to lua and lazy.nvim - https://github.com/folke/lazy.nvim#-structuring-your-plugins

## Tree sitter stuff

- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
- Tree sitter requires c compiler https://github.com/nvim-treesitter/nvim-treesitter
- abecodes/tabout.nvim - exit context "({ etc faster
- nvim-trevJ.lua - anti-<S-J>
- tab out of arguments - https://github.com/abecodes/tabout.nvim

## "Couldn't fix" issues

// This is fixed by vim/cool. If it really proves to work fine, delete this todo.
// Not sure how to fix this. Waiting for new neovim plugin release - https://github.com/vscode-neovim/vscode-neovim/pull/1075
- ' (leap search) doesn't work in VSCode for words that have search highlight. Instead of an actual letter to jump, letter in the word itself is shown.
  - Clear highlight before jump? Not that good solution actually, since I won't be able to proceed with the search or replace.

// Couldn't fix this one by changing colors in config
- gss highlight is messy in vscode

- gr in {} doesn't work for this code:
  - ```
    initialState={}
    ^
    |------ cursor is here
    ```
    - Use ci{<Esc>p instead for now
