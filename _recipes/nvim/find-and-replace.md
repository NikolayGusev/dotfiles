## Replace in file

### After seaching with "/," "\_" or "g\*"

- can use last search result in replace pattern like so :%s//replace_value/g

- cgn - replace currently searched word under the cursor.
  - To skip use n/N.

### Search for partial words with \*

- use g\* to do so

### Amend the word 
- Use &. e.g. "s/foo/&bar/g" to replace "foo" with "foobar". Or "s/foo/bar&/g" to replace "foo" with "barfoo".

### Match case

- <leader>r word\C/replacement/

### Keep case

- <leader><leader>r

### Replace in selection

- select and the <leader>r

### Replace with patterns

<leader><leader>r => facilit{y,ies}/building{,s}/

## Replace in solution

- TODO

# Scopes, types and other

## Scopes

- Selection
- File
- Files with filter
- Solution

## Type

- Search
  - What
- Replace
  - What
  - With

## What/With types

- What
  - Case sensitive
  - Case insensitive
- With
  - Simple
  - Keep case
  - Abolish Pattern

## What can be

- input
- last search result
- default yank register
- word under the cursor
- visual selection
