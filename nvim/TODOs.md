# General

- there's no need to have "space j m" to navigate between members because this is already possible with "space j i" + "ctrl n/p"
- make it easier to jump around lists - add "ctrl +j/k" to move to the next prev item

- I'm still not confortable with jumping to a single occurance with leap. Thus coz it doesn't show me the expected landing place after the first symbol I get really confused.
- fFtT don't allow me to jump back and this is messy
- As a solution might set a mark before doing a messy movement operation, and the later there's an accessible key to jump back

- I don't use. How do I remember to use those?
  - folds
  - jump to member

- How to surround in visual mode? "s" doesn't work.
- Cannots switch args in [] in this example:
```
    fn split_into_row_ranges(row: &str) -> RowRanges {
        row.split([',', '-']);
    }
```
- Consider - https://github.com/andymass/vim-matchup
- Consider - https://github.com/godlygeek/tabular
- since s is not used, might bind it to something else
- Abolish and vim.vis fix
  - https://github.com/tpope/vim-abolish/issues/56#issuecomment-457929759
  - See what it does and decide if necessary
- see if this is what I need to do the replacements in vscode
- Nvim as default text editor in windows
- Check if I still need those <leader>o and <leader>O bindings
- Consider if "f" should be case insensitive. As currently it ignores the capital letter "A" when "fa" is used.
- How to surround visual selection? It seems there's a conflict with leap. Surround should work like "Vsa(", but 's' is already taken by the leap.

## Russian keys mapping

- Consider to map russian letters to vim english keys. E.g. like this:
  https://t.me/kydavoiti/207?comment=2804
  ```
  vim.api.nvim_command('set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz')
  ```

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
- '{' and '}' in visual mode to select entire paragraphs faster
- gs 
  => hjkl - to move args around
	=> s/S  - sort/sort desc
  => r    - reverse
  => g/G  - expand/collapse selection
- g> and g< - move current arg left and right
- gs + visual line selection - does the same for visual

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
- fzf
  \*\* https://github.com/yuki-yano/fzf-preview.vim#demo

## Tree sitter stuff

- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
- Tree sitter requires c compiler https://github.com/nvim-treesitter/nvim-treesitter
- abecodes/tabout.nvim - exit context "({ etc faster
- nvim-trevJ.lua - anti-<S-J>
- tab out of arguments - https://github.com/abecodes/tabout.nvim
