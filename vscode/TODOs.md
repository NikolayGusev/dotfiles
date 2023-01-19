- scroll up/down in terminal
- consider some other button other than space as a vspacecode leader, so that I can use the same button in terminal and other menus (e.g. alt)
- see if https://vspacecode.github.io/docs/whichkey/reference/#delay would help with unresponsive space at work
- for transients allow/override jk (not only nNp)
- close right panel on editor movements (just like the left one)
  - to do so, have to write own vscode extension it seems (copy code from autoclose left panel extension)
- transparency for the window - is it useful?
  - AHK script https://stackoverflow.com/a/45246326
  - glassIt extension
- Multiple cursors
  - alt/opt click to set new one
  - cmd+shift+l to select all the same words under the cursor
- make it easier to jump around lists - add "ctrl +j/k" to move to the next prev item
- How to reoder tabs? E.g. move tab to the left or to the right.
- "space t H" - to pin/unpin help shown with "space t h"


# dotfiles at work

- at work I have some additional configs that do are not in the dotfiles repo.
  - open folders scripts
  - is it possible to merge json files somehow?
- Nvim has a different installation file at work. How to update with a drop in replacement instead of carefully changing the config after copy-pasting?
- eslint and prettier formatting on save

- lint settings aren't the same and lead to errors - copy settings from README.md at work

# nvim fixes

- !! VSCodeCallVisual - send selection to vscode for magit operation or for editdiff multilineselection and stage

## snippets

- space i s (do I really need this?)

- make it possible to use hjkl and r/d/a/A in file explorer (not possible currently at work's vscode, possible locally)
- Get extensions list from the work pc
  ** partial diff
  ** peacock
  ** scope to this
  ** todo highlight
  ** vscode-styled-components
  ** error lens
  \*\* command runner

- V line selection mode doesn't highlight empty rows

# vspacecode fixes

- remove search next/prev from "spc.s.F" as it doesn't work properly and it is easier to use F1/F2 anyway.
- shift+space - disable this in nvim edit mode and produce space instead
- Ctrl+n/p breaks sometimes for unknown reasons. Can try to clean keyboard hotkeys to see if this will help?
- learn how to reorder items
- learn how to add separators
- learn how to add icons

# vscode general

- extensions - install specific versions, not just the latest ones
- how to switch FAST between branches w/o rebuilding them all the time?
  - E.g. work on multiple branches which have own build folders, etc
  - Git workspaces to the resque?
  - How does that work with VSCode?
- go to next/prev reference (F3/F4) doesn't work in the same manner as go to next/prev find result
  - the cursor stays inside of the search panel instead of jumping to the editor like in search
- find and replace quicker
  - bind to "spc s r/R" for file/project replace?
  - how to replace word under the cursor then? It might be a better idea to have capital letters to replace with word under the cursor.
    - then it makes sense to bind to "spc r" - space "replace"
- how to refine finder telescope window?

  e.g. I see the file that I need and do not want to scroll down, but would like to type more things to filter things out (e.g. when I cannot type it anymore because the text is infront of the text found by my query).

- How to open recently closed files list?

- Decide ctrl+alt+<left/right arrow> vs F4/Shift-F4 to go to next prev result

- How to search git history in a powerful manner?
  ** https://www.reddit.com/r/neovim/comments/zmwpcx/fzf_is_so_powerful_when_you_use_it_well/
  ** How to revert anything to anything?

## TODOs

- Add todo via "spc i 1/2/3" to add todo with priority 1/2/3
- Search for todo comments to fix them "spc s 1/2/3/t" to search for 1/2/3/all todos
- check todotree ext? probably shouldn't do that

# Search and replace

- https://docs.google.com/spreadsheets/d/1VxzBHZskj6m2_07N202LfhwXPGQ-AzVTbcAAGxMsr_w/edit#gid=1119996906
- (try to) use this to generate md table afterwards to be commited under this repo - https://www.tablesgenerator.com/markdown_tables

# git stuff

- it is hard to navigate and edit git diff at the same time (native vscode diff)
  - e.g. cannot input and the u(ndo)
  - cannot move up/down with j and k
- gitlens
  - GitLens: Open Blame Prior to Change (blame forward/backward)

## Diff

- How to view changes for commit range with a keyboard?
  - Consider "ll" in magit to view the log
- How to revert changes from one particular commit or revert a patch?

## Misc

- gitlens code lens and line blame turns on on its own after restarting vscode

## While viewing diff

- revert file/hunk
- checkout file

# file explorer

- consider which actions should I be able to do in file explorer
- some ideas
  - stage
  - unstage
  - view diff

# next/prev global hotkeys

Currently I use n and p to do that.
Consider

- n and m
- n and N (like in vim / search)
- j and k
  - broken for quick picker (eg. spc f f)

Where:

- git diff
- quick picker (eg.. spc f f)
- s(earch) n(ext), search p(revious)
- ???
- next/prev buffer

# Folds

consider remaping zM to zm

- for vim folds
- for close all other buffers

# Known hacks/problems

- non-instant commands close whichkey popup. E.g. search next with "spc s n" is closed when new file is opened. See:
  - https://github.com/VSpaceCode/vscode-which-key/issues/72

## VS code ANKI

### Magit

- ctrl+n/p - next/prev diff
- shift+tab - toggle fold for all files in section - while being ontop of the section.
- gr - refresh

### Preview

- Space in timeline or explorer to preview selected file.

###

- space j i/I - got to symbol
- ctrl+enter to open to the side
