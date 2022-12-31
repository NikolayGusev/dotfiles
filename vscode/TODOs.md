# nvim fixes

- clear nvim colors - see "not sure why do I need those"
- !! VSCodeCallVisual - send selection to vscode for magit operation or for editdiff multilineselection and stage

# Anki

## Diff editor hotkeys

- JK - next prev change (HACK: works only while in insert mode for the time being)
- sux - stage, unstage, discard
- enter - go to source

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

- Close and reopen current window command to fix desync issues

- V line selection mode doesn't highlight empty rows

# vspacecode fixes

- learn how to reorder items
- learn how to add separators
- learn how to add icons

- Cannot evoke when no files are open
- Cannot evoke when inside of explorer, etc
- double space should do something better
  - Options
    - Replace with file file by name?
    - Replace with buffer by name?
  - "space >" to call command pallete

# vscode general

- move in text menus up/down with J and K
- how to refine finder telescope window?

  e.g. I see the file that I need and do not want to scroll down, but would like to type more things to filter things out (e.g. when I cannot type it anymore because the text is infront of the text found by my query).

- How to open recently closed files list?

- Decide ctrl+alt+<left/right arrow> vs F4/Shift-F4 to go to next prev result

- How to search git history in a powerful manner?
  ** https://www.reddit.com/r/neovim/comments/zmwpcx/fzf_is_so_powerful_when_you_use_it_well/
  ** How to revert anything to anything?
- Folds - how to fold and unfold stuff - see vspacecode z. menu

- Search for todo comments to fix them

# window management

- resize window vertical/horizontal - separate commands like space-w-[]

# git stuff

- magit

  - add magit hotkeys to go to the next prev file - JK

- gitlens

  - GitLens: Open Blame Prior to Change (blame forward/backward)

- How to view changes for commit range with a keyboard?

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
