"""""""""""
" IMPORTS "
"""""""""""

call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-lua/plenary.nvim'

""" Required by leap
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'

""" Required by textobj-parameter
Plug 'kana/vim-textobj-user'
Plug 'julian/vim-textobj-variable-segment'
Plug 'urxvtcd/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'D4KU/vim-textobj-chainmember'


Plug 'ggandor/leap.nvim'
Plug 'rhysd/clever-f.vim'
Plug 'romainl/vim-cool'                         " Autoclear search (/) highlight when cursor moves.


Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'
Plug 'tpope/vim-abolish'                        " type error fixer, case insensitive replacer, pattern replacer, case changer
Plug 'markonm/traces.vim'                       " highlights abolish and other commands before executing

"  Plug 'matze/vim-move'

Plug 'ThePrimeagen/vim-be-good'                 " Practice vim

Plug 'gruvbox-community/gruvbox'                " Theme
Plug 'vim-scripts/vis'                          " Commands that only affect the selection, provides :B for visual commands and :S for visual searches.

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'


"""""" ???
Plug 'mizlan/iswap.nvim'


""""""""""""""""""""""""""""""
"""""" Treesitter stuff """"""
""""""""""""""""""""""""""""""
""""""  Navigate through syntax tree with swap around support.
""""""  This guy is really cool but buggy for some reason when I actually do the swaps
"  Plug 'ziontee113/syntax-tree-surfer'
"""""" This generally works, but there's no fast way to switch to next arg
"  Plug 'Wansmer/sibling-swap.nvim'
""""""  Swaps between expanded and collapsed views of the same thing, useful to make editing easier.
""""""  Doesn't work for some reason (only collapses but doesn't expand)
"  Plug 'Wansmer/treesj'

call plug#end()

let g:vim_be_good_delete_me_offset = 35

"""""""""""
" General "
"""""""""""
language en_US
let mapleader = ","
nnoremap <leader><leader>/ :noh<CR>
:set cursorline
:set ignorecase smartcase
:set inccommand=nosplit
:set gdefault                               " 'g' flag by default for replaces


nnoremap gg gg0
nnoremap G G$
nnoremap <S-L> <S-L>zz
nnoremap <S-H> <S-H>zz
nnoremap J <Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>
nnoremap K <Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap ; <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
vnoremap ; <Cmd>call VSCodeCallVisual('editor.action.quickFix', 1)<CR>


" duplicate row
nmap <C-d> :.t-1<CR>
vmap <C-d> ypgv

:nnoremap <silent> <leader>j :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>
:vnoremap <silent> <leader>j J
"  TODO: how to use this? Note the "cgn_,_" which doesn't work for ;
"  nnoremap <leader>j /[,\|;]<CR>cgn,<CR><Esc>
"  TODO: This doesn't work either (replaces with [,\|;]).
"  nnoremap <leader>j /[,\|;]<CR>cgn<C-R>/<CR><Esc>
" Not that good implementation of split by comma operator
nnoremap <leader><leader>j /,<CR>cgn,<CR><Esc>

nnoremap gd <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
nnoremap gD <Cmd>call VSCodeNotify('references-view.find')<CR>

nnoremap <leader>r :%s/
nnoremap <Leader>R :%s/\<<C-r><C-w>\>/
vnoremap <leader>r :s/\%V
nnoremap <leader><leader>r :%Subvert/
nnoremap <Leader><Leader>R :%Subvert/<C-r><C-w>/
" See https://github.com/tpope/vim-abolish/issues/56#issuecomment-457929759
vnoremap <leader><leader>r :B Subvert/

" don't jump on * and g*
nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>
nnoremap <silent> g* :let @/=expand('<cword>') <bar> set hls <cr>

:nnoremap / /\V
:nnoremap <leader>/ /
:nnoremap ? ?\V
:nnoremap <leader>? ?

"  Append lines above below while in normal mode and w/o any movement
:nnoremap <leader>O :call append(line('.')-1, '')<CR>
:nnoremap <leader>o :call append(line('.')+0, '')<CR>

"  search in visual selection with '/'
:lua vim.keymap.set('x', '/', '<Esc>/\\%V')         



"""""""""""""""""""""""""
" Text object parameter "
"""""""""""""""""""""""""
let g:vim_textobj_parameter_mapping = 'a'

""""""""""""
" clever_f "
""""""""""""
let g:clever_f_across_no_line = 1
let g:clever_f_smart_case = 1

""""""""""""
" Sandwich "
""""""""""""
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
runtime macros/sandwich/keymap/surround.vim

"  match function calls like "console.log(123)"
let g:sandwich#magicchar#f#patterns = [
	\   {
	\     'header' : '\<\%(\h\k*\.\)*\h\k*',
	\     'bra'    : '(',
	\     'ket'    : ')',
	\     'footer' : '',
	\   },
	\ ]

"" Source: https://github.com/machakann/vim-sandwich/blob/ffe2bae2fc70ebecf7091a140b6338a95215878c/macros/sandwich/keymap/surround.vim
nmap s <Plug>(sandwich-add)
vmap s <Plug>(sandwich-add)
onoremap <SID>line :normal! ^vg_<CR>
nmap <silent> ss <Plug>(sandwich-add)<SID>line
onoremap <SID>gul g_
nmap <silent> S <Plug>(sandwich-add)<SID>gul


"""""""""""
" Targets "
"""""""""""
" Newer syntax didn't work for me, so had to use deprecated one.
let g:targets_argOpening = '[({<[]'
let g:targets_argClosing = '[]>})]'
let g:targets_argSeparator = '[,;]'
let g:targets_jumpRanges = ''
"  "  Only consider targets around cursor:
"  let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB'
"  " Only consider targets fully contained in current line:
"  let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll'
autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'b': {'pair': [{'o':'<', 'c':'>'}, {'o':'{', 'c':'}'}, {'o':'(', 'c':')'}, {'o':'[', 'c':']'}]}
    \ })

""""""""""""""""""
" VSCODE RELATED "
""""""""""""""""""

xmap <silent> gc <Cmd>call VSCodeNotifyVisual('editor.action.commentLine', 1)<CR>
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary

xnoremap <silent> gC <Cmd>call VSCodeNotifyVisual('editor.action.blockComment', 1)<CR>
nnoremap <silent> gC <Cmd>call VSCodeNotifyVisual('editor.action.blockComment', 1)<CR>
onoremap <silent> gC <Cmd>call VSCodeNotifyVisual('editor.action.blockComment', 1)<CR>

nmap gcc <Plug>VSCodeCommentaryLine


nnoremap <space> :call VSCodeNotify('vspacecode.space')<CR>
vnoremap <space> <Cmd>call VSCodeNotifyVisual('vspacecode.space', 0)<CR>

""""""""""""
" UNSORTED "
""""""""""""

"let g:camelcasemotion_key = '<leader>'

"""""""""""""
" cleaver-f "
"""""""""""""
nnoremap <Esc> :<C-u>call clever_f#reset()<CR>
let g:clever_f_fix_key_direction = 1

"  autocmd ColorScheme * highlight default CleverFMyOwnLabel cterm=bold,underline gui=bold,underline
"  let g:clever_f_mark_char = "CleverFMyOwnLabel"

""""""""""""""
" traces.vim "
""""""""""""""
let g:traces_abolish_integration = 1

""""""""
" LEAP "
""""""""

if exists('g:vscode')
    :lua vim.keymap.set({'n', 'v', 'o', 'x'}, "'", function () require('leap').leap { opts={highlight_unlabeled_phase_one_targets = true}, target_windows = { vim.fn.win_getid() } } end)
else " jumo to any window with leap
   :lua vim.keymap.set({'n', 'v', 'o', 'x'}, "'", function () require('leap').leap { opts={highlight_unlabeled_phase_one_targets = true}, target_windows =  vim.tbl_filter( function (win) return vim.api.nvim_win_get_config(win).focusable end, vim.api.nvim_tabpage_list_wins(0))  } end)
endif

"""""""""""""""
" Cutlass.vim "
"""""""""""""""
nnoremap m d
xnoremap <nowait> m d

nnoremap mm dd
nnoremap M D

set clipboard+=unnamed  " use the clipboards of vim and win
"  This breaks vim-cool plugin:
"  vim cool inserts "<Plug>(StopHL)" when I do "i" or "c" right after moving to the next result.
"  set paste               " Paste from a windows or from vim

"""""""""
" Yoink "
"""""""""
nmap <Left> <plug>(YoinkPostPasteSwapBack)
nmap <Right> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

""" " Also replace the default gp with yoink paste so we can toggle paste in this case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)

let g:yoinkIncludeDeleteOperations = 1
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

""""""""""""""
" Subversive "
""""""""""""""
" ie = inner entire buffer
onoremap ie :exec "normal! ggVG"<cr>

" iv = current viewable text in the buffer
onoremap ix :exec "normal! HVL"<cr>

nmap gr <plug>(SubversiveSubstitute)
xmap gr <plug>(SubversiveSubstitute)
nmap grr <plug>(SubversiveSubstituteLine)
nmap gR <plug>(SubversiveSubstituteToEndOfLine)

nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

nmap <leader><leader>s <plug>(SubversiveSubvertRange)
xmap <leader><leader>s <plug>(SubversiveSubvertRange)
nmap <leader><leader>ss <plug>(SubversiveSubvertWordRange)

"""""""""""""""""""""
" vim-indent-object "
"""""""""""""""""""""

omap ii <Plug>(indent-object_linewise-none)
vmap ii <Plug>(indent-object_linewise-none)
omap Ii <Plug>(indent-object_blockwise-none)
vmap Ii <Plug>(indent-object_blockwise-none)
omap ai <Plug>(indent-object_linewise-both)
vmap ai <Plug>(indent-object_linewise-both)
omap Ai <Plug>(indent-object_blockwise-both)
vmap Ai <Plug>(indent-object_blockwise-both)

omap ij <Plug>(indent-object_linewise-none-keep-start)
xmap ij <Plug>(indent-object_linewise-none-keep-start)
omap Ij <Plug>(indent-object_blockwise-none-keep-start)
xmap Ij <Plug>(indent-object_blockwise-none-keep-start)
omap ik <Plug>(indent-object_linewise-none-keep-end)
xmap ik <Plug>(indent-object_linewise-none-keep-end)
omap Ik <Plug>(indent-object_blockwise-none-keep-end)
xmap Ik <Plug>(indent-object_blockwise-none-keep-end)

""""""""""""""""
" COLOR SCHEME "
""""""""""""""""


:set termguicolors 
colorscheme gruvbox

let g:gruvbox_contrast_light="hard"             " Light colors, values are soft/medium/hard

"  set background=light                         " Setting light mode
highlight Normal guibg=none                     " Transparency support

highlight OperatorSandwichBuns guifg='#aa91a0' gui=underline ctermfg=172 cterm=underline
highlight OperatorSandwichChange guifg='#ff0000' gui=underline ctermfg='yellow' cterm=underline
highlight OperatorSandwichAdd guibg='#b1fa87' gui=none ctermbg='green' cterm=none
highlight OperatorSandwichDelete guibg='#ff0000' gui=none ctermbg='red' cterm=none

""""""""""""
" Feedback "
""""""""""""
au TextYankPost * silent! lua vim.highlight.on_yank { timeout=1000 }


"""""""""""
" Folding "
"""""""""""
" Fix source: https://github.com/vscode-neovim/vscode-neovim/issues/58#issuecomment-989481648
if(exists("g:vscode"))
    nnoremap zm :call VSCodeNotify('editor.foldAll')<CR>
    nnoremap zM :call VSCodeNotify('editor.foldAll')<CR>

    nnoremap zr :call VSCodeNotify('editor.unfoldAll')<CR>
    nnoremap zR :call VSCodeNotify('editor.unfoldAll')<CR>

    nnoremap zc :call VSCodeNotify('editor.fold')<CR>
    nnoremap zC :call VSCodeNotify('editor.foldRecursively')<CR>
    nnoremap zo :call VSCodeNotify('editor.unfold')<CR>
    nnoremap zO :call VSCodeNotify('editor.unfoldRecursively')<CR>

    nnoremap za :call VSCodeNotify('editor.toggleFold')<CR>
    nnoremap zz :call VSCodeNotify('editor.toggleFold')<CR>
    vnoremap <silent> zz <Esc>`>mb`<mv`vvgg<Cmd>call VSCodeNotifyVisual('editor.createFoldingRangeFromSelection', 1)<CR><Esc>`bvG<Cmd>call VSCodeNotifyVisual('editor.createFoldingRangeFromSelection', 1)<CR><Esc>
    vnoremap <silent> zZ <Cmd>call VSCodeNotifyVisual('editor.createFoldingRangeFromSelection', 1)<CR><Esc>

    nnoremap zj :call VSCodeNotify('editor.gotoNextFold')<CR>
    nnoremap zk :call VSCodeNotify('editor.gotoPreviousFold')<CR>
    
    function! MoveCursor(direction) abort
        if(reg_recording() == '' && reg_executing() == '')
            return 'g'.a:direction
        else
            return a:direction
        endif
    endfunction
    
    nmap <expr> j MoveCursor('j')
    nmap <expr> k MoveCursor('k')
endif

""""""""""""""""""""""""""""
" Tree sitter text objects "
""""""""""""""""""""""""""""
lua <<EOF

require("nvim-treesitter.install").prefer_git = true 
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },
  },
}
EOF

lua <<EOF
require('iswap').setup{
  -- The keys that will be used as a selection, in order
  -- ('asdfghjklqwertyuiopzxcvbnm' by default)
  keys = 'qwertyuiop',

  -- Grey out the rest of the text when making a selection
  -- (enabled by default)
  grey = 'disable',

  -- Highlight group for the sniping value (asdf etc.)
  -- default 'Search'
  hl_snipe = 'ErrorMsg',

  -- Highlight group for the visual selection of terms
  -- default 'Visual'
  hl_selection = 'WarningMsg',

  -- Highlight group for the greyed background
  -- default 'Comment'
  hl_grey = 'LineNr',

  -- Post-operation flashing highlight style,
  -- either 'simultaneous' or 'sequential', or false to disable
  -- default 'sequential'
  flash_style = false,

  -- Highlight group for flashing highlight afterward
  -- default 'IncSearch'
  hl_flash = 'ModeMsg',

  -- Move cursor to the other element in ISwap*With commands
  -- default false
  move_cursor = true,

  -- Automatically swap with only two arguments
  -- default nil
  autoswap = true,

  -- Other default options you probably should not change:
  debug = nil,
  hl_grey_priority = '1000',
}

local opts = {noremap = true, silent = true}
vim.keymap.set({"n", "x"}, "gs", '<cmd>ISwapWith<cr>', opts)
vim.keymap.set({"n", "x"}, "g[", '<cmd>ISwapNodeWithLeft<cr>', opts)
vim.keymap.set({"n", "x"}, "g]", '<cmd>ISwapNodeWithRight<cr>', opts)
vim.keymap.set({"n", "x"}, "g<", '<cmd>ISwapWithLeft<cr>', opts)
vim.keymap.set({"n", "x"}, "g>", '<cmd>ISwapWithRight<cr>', opts)
EOF