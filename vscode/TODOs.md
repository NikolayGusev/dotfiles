- Do not add commentary to the new line when line breaking a last line with comments.

- When searching in a project I can open results in an editor (cmd+enter on mac by default).
  - Then I can apply changes with Search Editor: Apply Changes. cmd+down to move down to the editor from the search input.
  - Find out if there's a more convenient hotkey, ankify and make this usable overall.

- enter doesn't work in terminal tabs to focus on a terminal

- Cannot press F1/F2 to go to the prev/next search result when find in project panel is closed.
- See if it is the same for find references (gD -> F3/F4).

- cannot split window left/top with space-w-h/k
  - Those are defaults in vim:
    -<Ctrl-W>+v       # Opens a new vertical split
    -<Ctrl-W>+s       # Opens a new horizontal split

- space-e-e currently opens a navigation to go throw the error list. While
  useful this is not the most used feature I think. Better to have a "move to
  the next error and activate quickfix" combo on that hotkey.
  - Make sure it is easy to land on this error for manual fix. I.e. cursor
    should actually jump to the error. For some reason this is not always the
    case atm.
  - And then when pressed for the second time, skip this error and jump to
    fixing the next one.
  - Have two separate ways to jump through the errors:
    - errors in current file
    - errors everywhere

- Pressing space to trigger actions of vspacecode inputs a space into vim. Stop
  inputing space.
  - It is a problem when I do visual selection and then want to run some
    command in vspacecode against this selection. If I do a mistake, I have to
    shrink selection before trying once again.
    
- Consider one option instead of two. Make things consistent.
  - "space e l(ist)" and "space t p(roblems)" do the same thing.
  - "space t e(rrors)" might be an option as well.

- add "scope to this addin" to the list

- Vim has a nice feature - tabs, which work like workspaces. So when I want to get to testing my component, I can switch to testing workspace. And when I want to develop it, I can have multiple workspaces that have desired set of windows/buffers I need for each of the programming tasks.
  - Vs code has a plugin to do that (but they say it is buggy) - https://marketplace.visualstudio.com/items?itemName=agquick.workviews
  - Does it make sense to open multiple workspaces and switch between those?

- Add todo via "spc i 1/2/3" to add todo with priority 1/2/3
- Search for todo comments to fix them "spc s 1/2/3/t" to search for 1/2/3/all todos

- Discover what workspaces can offer
  - Might be a good alternative to spare checkout in git to improve perf

- Own extension:
  - What do I need: 
    - Collapse sidebar (copy code from current extension)
    - Collapse terminal
    - Notify of terminal events (started, failed, etc)
    - When switching from editor to a terminal, autoswitch to terminalTabs
  - Extension w/o writing extension - https://github.com/BetterThanTomorrow/joyride
  - And another one - https://github.com/alhassy/easy-extensibility
  
- Snippets
  - IIEF surround
  
- See total typescript extension - does it really help with cryptic error texts?

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

- Not sure how to fix: V line selection mode doesn't highlight empty rows

- Consider: blockman? Need good styles tho


# dotfiles at work

- at work I have some additional configs that do are not in the dotfiles repo.
  - open folders scripts
  - is it possible to merge json files somehow?
- Nvim has a different installation file at work. How to update with a drop in replacement instead of carefully changing the config after copy-pasting?
- eslint and prettier formatting on save

- lint settings aren't the same and lead to errors - copy settings from README.md at work

# nvim fixes

- !! VSCodeCallVisual - send selection to vscode for magit operation or for editdiff multilineselection and stage

# Debug
- https://mfcallahan.blog/2022/08/26/the-microsoft-edge-dev-tools-extension-for-vs-code-is-so-awesome-that-im-ditching-chrome-for-web-development/

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

- Consider - Inline fold extension or some other ways to fold code easier
  - https://github.com/moalamri/vscode-inline-fold
  - hide classes or some other unrelated things

- have a proper "fold all high level blocks" w/o folding their internals
  - likely would require an extension
- fold some things automatically
  - see https://github.com/zokugun/vscode-explicit-folding
  - to fold
    - class names
    - imports
    - ...?

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
- alt+j/k - move lines up/down
- alt+Enter to edit command that I run from terminalTabs with "e"

### Magit

- ctrl+n/p - next/prev diff
- shift+tab - toggle fold for all files in section - while being ontop of the section.
- gr - refresh

### Preview

- Space in timeline or explorer to preview selected file.

###

- space j i/I - got to symbol
- ctrl+enter to open to the side



### Someday
- If I don't like the way <C-i> and <C-o> work:
  - Check out what soft undo does in VSCode:
    Use the Soft Undo (‚åò/‚åÉ + U) to move the cursor back to it's previous
    location. This is particularly useful when you need to move down in a long
    file to copy a variable or function name and then go back to your original
    position.


### Couldn't or won't fix
- gD which opens definition in a window to the right, not replaces current buffer
  - Instead do this:
    - gd 
    - <space>bl (move buffer to the right)


- Allow to see problems for the current file only. E.g. "space-t-p" for current file and "space-t-P" for whole project.
  - Can be manually turned on with mouse by clicking on a filter button and picking "Show Active file only".

- space-s-F should search for the work under the cursor or for the selection
  - yank selected text, space-s-f and paste as a workaround

- Allow multiple files with the same name in the same tab.


- Scroll in current tab group only with JK in vscode
  - works on macos just fine
  

- Fix undesired unfolding
  - steps to reproduce
    - use this file:
        ```
      # A

      ## A1

        text

      ## A2

        text


          ```
        - gg
        - zz (fold)
        - G
        - o
        - result: fold unfolds, while expected result is just that I get a new line and "# A" is still folded
  - won't fix as not that crucial

