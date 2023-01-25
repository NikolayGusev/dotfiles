
- Add todo via "spc i 1/2/3" to add todo with priority 1/2/3
- Search for todo comments to fix them "spc s 1/2/3/t" to search for 1/2/3/all todos

- Own extension to:
  - Collapse sidebar (copy code from current extension)
  - Collapse terminal
  - Notify of terminal events (started, failed, etc)
  - When switching from editor to a terminal, autoswitch to terminalTabs

- Check that ,sF actually presses enter after search.
  - And remove next/prev menu which is useless since I can just F1/F2 through anyway.

- Move mutliple lines of code with alt+up/down.

- Spellchecker? But must be fast.

- TBD: See if it is possible to throw away vscode terminal stuff and just use tmux next to it or directly inside of it.
  - tmux - have a single terminal and open tmux in it:
    - https://medium.com/@joaomoreno/persistent-terminal-sessions-in-vs-code-8fc469ed6b41
- TBD: currently it is not possible to run new command from terminaltabs (it is possible to run pervious though with an "e"). 
  - It is actually possible to run, but not convenient:
    - e
    - alt+CR
    - edit the command in terminal (bad point #1 - have to edit some command and not just type a new one)
    - CR
    - command executes
    - go back to tabspanel with C-L (bad point #2 - have to jump back to terminal tabs)
  - make it possible to run other commands
  - see if it is possible to avoid focusing on the terminals because they are not really necessary anymore - all work can be done in terminaltabs
- TBD: Not sure how recent commands list is populated - running commands doesn't seem to amend the list.
- TBD: run last command hotkey for terminal tabs
  - see https://stackoverflow.com/questions/62302065/vscode-hotkey-for-execute-last-terminal-command-while-editing-and-return-focus
- Clear terminal hotkey.


- TBD: consider some other button other than space as a vspacecode leader, so that I can use the same button in terminal and other menus (e.g. alt)
- TBD: for transients allow/override jk (not only nNp)
- TBD: make it easier to jump around lists - add "ctrl +j/k" to move to the next prev item
- Later: transparency for the window - is it useful?
  - AHK script https://stackoverflow.com/a/45246326
  - glassIt extension
- Later: if separate threads for VSCode extensions won't help: 
  - see if https://vspacecode.github.io/docs/whichkey/reference/#delay would help with unresponsive space at work
- Not sure how to fix: V line selection mode doesn't highlight empty rows


# dotfiles at work

- at work I have some additional configs that do are not in the dotfiles repo.
  - open folders scripts
  - is it possible to merge json files somehow?
- Nvim has a different installation file at work. How to update with a drop in replacement instead of carefully changing the config after copy-pasting?
- eslint and prettier formatting on save

- lint settings aren't the same and lead to errors - copy settings from README.md at work

# nvim fixes

- !! VSCodeCallVisual - send selection to vscode for magit operation or for editdiff multilineselection and stage

## misc

- Get extensions list from the work pc
  ** partial diff
  ** peacock
  ** scope to this
  ** todo highlight
  ** vscode-styled-components
  ** error lens
  \*\* command runner


# vspacecode fixes

- remove search next/prev from "spc.s.F" as it doesn't work properly and it is easier to use F1/F2 anyway.
- shift+space - disable this in nvim edit mode and produce space instead
- Ctrl+n/p breaks sometimes for unknown reasons. Can try to clean keyboard hotkeys to see if this will help?
- learn how to reorder items
- learn how to add separators
- learn how to add icons

# vscode general

- extensions - install specific versions, not just the latest ones
- go to next/prev reference (F3/F4) doesn't work in the same manner as go to next/prev find result
  - the cursor stays inside of the search panel instead of jumping to the editor like in search
- find and replace quicker
  - bind to "spc s r/R" for file/project replace?
  - how to replace word under the cursor then? It might be a better idea to have capital letters to replace with word under the cursor.
    - then it makes sense to bind to "spc r" - space "replace"

- How to open recently closed files list?

- How to search git history in a powerful manner?
  ** https://www.reddit.com/r/neovim/comments/zmwpcx/fzf_is_so_powerful_when_you_use_it_well/
  ** How to revert anything to anything?
  

## TODOs

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

- multiple cursors for word under the cursor - ctrl+shift+L
  - alt/opt click to set new one
- terminalTabsFocus commands from keybindings.json

### Magit

- ctrl+n/p - next/prev diff
- shift+tab - toggle fold for all files in section - while being ontop of the section.
- gr - refresh

### Preview

- Space in timeline or explorer to preview selected file.

###

- space j i/I - got to symbol
- ctrl+enter to open to the side
