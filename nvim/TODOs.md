# bookmarks
- cmd+1-0, cmd+shift+1-0
  - tmux bookmarks instead?
    - I don't care about nvim, probably I want to bind to both nvim files and to tmux

# DAP
- How to input stop condition for the breakpoint?
- Save breakpoints between nvim restarts.
- when debugger breaks due to some error (like assignment to const) it should tell me something, ideally stop and show an error
- inline virtual text for values 
- https://github.com/rcarriga/nvim-dap-ui#floating-elements
- debug ts files that import other files

# stop moving my cursor!
Many commands move cursor as a side effect.
- yank
- change/add/remove surrounding


# Migrate my stuff to nvim kickstater config
This is a minimalist config with nothing but crucial things and lazy loading.

# General

- yis - yank inside sentence - doesn't work

- Stop jumping forward to another string when doing things like "va(" or "da("
- Spider - see if it is possible now not to move along the words-in-words, only skip non letter symbols while jumping around

- TBD: When doing change with Leap scope leap to the current row as this is what I do usually.

- make sure that same controls are used to scroll up down preview in
  - lazygit
  - oil
  - LF
  - telescope

- I still need shift-cmd-[1-0] to create a mark and cmd-[1-0] to recall it

- remove packages from lazynvim which are not used on thier own but rather are only the dependencies for other packages (leave them in dependencies though ofc)
- consider https://github.com/anuvyklack/hydra.nvim
  - window utils
  - git mode
  - ?

- cmp doesn't show help for when typing in function arguments
- spider doesn't work with umlauts - it stops on them
  - Is it maybe possible to have a custom alphabet?

- how to rename stuff while using option+arrows and other convinient ways of renaming?
- highlight selected word (other instances of this word elsewhere)

- lsp refactoring button

# oil and lf
  - make LF, telescope or oil default on startup
  - LF doesn't open from oil

- learn undo tree

- see if I need session management plugin that restores context when I reopen
  the dir, or tmux is enough

- sa" doesn't work?? but ysa" does
  - "hello world"

- Cannot insert into empty () with rg
- comment plugin creates a new line with comment on it

- learn to use "gi" to insert in the last place
  - e.g. edit something and then I need to check the type
    - exit edit mode, go check and then "gi"
 
- VimBeGood custom challenges.
- https://github.com/junegunn/vim-easy-align - do I ever need this though? 
  - For simple non-repeatatie tasks column might be easier and more versatile. Otherwise just use language formatter.

- I don't use. How do I remember to use those?
  - folds
  - jump to member
  - swap places with gs

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
- yam, dam, cam - copy chain member, e.g. "map" in the following - "vec.iter().map(...)"

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
  
  zz - fold everything but selection
  zZ - fold selection

- Vimium
  - shift+w - open tab in a new window

# Keep autocentered after jump
For future reference - https://github.com/nvim-telescope/telescope.nvim/issues/182#issuecomment-1160555013

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

## Someday maybe
- embed plugins into configs
  - Why?
    - Can monkey patch things (but getting updates gets harder, unless some patching utility is used)
    - Can have a whole "download-and-plug" config for work, since it is no longer possible to download nvim plugins.
  - Resources
    - https://www.reddit.com/r/neovim/comments/10x8ffa/comment/j7u7yl4/?utm_source=share&utm_medium=web2x&context=3
