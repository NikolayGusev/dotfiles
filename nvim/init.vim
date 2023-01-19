"""""""""""
" IMPORTS "
"""""""""""

call plug#begin(stdpath('data') . '/plugged')

Plug 'machakann/vim-swap'

Plug 'nvim-lua/plenary.nvim'

""" Required by leap
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'

""" Required by textobj-parameter
Plug 'kana/vim-textobj-user'
Plug 'julian/vim-textobj-variable-segment'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'


Plug 'ggandor/leap.nvim'
Plug 'rhysd/clever-f.vim'

Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'
Plug 'tpope/vim-abolish'                        " type error fixer, case insensitive replacer, pattern replacer, case changer
Plug 'markonm/traces.vim'                       " highlights abolish and other commands before executing

Plug 'matze/vim-move'

Plug 'ThePrimeagen/vim-be-good'                 " Practice vim

Plug 'gruvbox-community/gruvbox'                " Theme
Plug 'vim-scripts/vis'                          " Commands that only affect the selection, provides :B for visual commands and :S for visual searches.

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
nnoremap <tab> <Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>
nnoremap <S-tab> <Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>
nnoremap <S-L> <S-L>zz
nnoremap <S-H> <S-H>zz
vnoremap < <gv
vnoremap > >gv
:nnoremap <silent> J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>

"  TODO: how to use this? Note the "cgn_,_" which doesn't work for ;
"  nnoremap <leader>j /[,\|;]<CR>cgn,<CR><Esc>
"  TODO: This doesn't work either (replaces with [,\|;]).
"  nnoremap <leader>j /[,\|;]<CR>cgn<C-R>/<CR><Esc>
" Not that good implementation of split by comma operator
nnoremap <leader>j /,<CR>cgn,<CR><Esc>

nnoremap gd <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
nnoremap gD <Cmd>call VSCodeNotify('references-view.find')<CR>

nnoremap <leader>r :%s/
nnoremap <Leader>R :%s/\<<C-r><C-w>\>/
vnoremap <leader>r :s/\%V
nnoremap <leader><leader>r :%Subvert/
nnoremap <Leader>R :%Subvert/<C-r><C-w>/
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
let g:targets_argOpening = '[({[]'
let g:targets_argClosing = '[]})]'
let g:targets_argSeparator = '[,;]'

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
vnoremap <silent> <space> <Cmd>call VSCodeNotifyVisual('vspacecode.space', 1)<CR>

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

:lua vim.keymap.set({'n', 'v', 'o', 'x'}, "'", function () require('leap').leap { target_windows = { vim.fn.win_getid() } } end)

"""""""""""""""
" Cutlass.vim "
"""""""""""""""
nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

set clipboard+=unnamed  " use the clipboards of vim and win
set paste               " Paste from a windows or from vim

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


""""""""""""
" vim-swap "
""""""""""""
let g:swap#rules = deepcopy(g:swap#default_rules)
" for templates see - https://github.com/machakann/vim-swap/blob/master/autoload/swap.vim
let g:swap#rules += [
\   {
\     'description': 'Reorder the semicolon-separated items in [].',
\     'mode': 'n',
\     'surrounds': ['\[', '\]', 1],
\     'delimiter': ['\s*;\s*'],
\     'braket': [['(', ')'], ['[', ']'], ['{', '}']],
\     'quotes': [['"', '"'], ["'", "'"]],
\     'immutable': ['\%(^\_s\|\n\)\s*', '\s\+$']
\   },
\   {
\     'description': 'Reorder the semicolon-separated items in {} with trailing ; support.',
\     'mode': 'n',
\     'surrounds': ['{', ';[ \n]*}', 1],
\     'delimiter': ['\s*;\s*'],
\     'braket': [['(', ')'], ['[', ']'], ['{', '}']],
\     'quotes': [['"', '"'], ["'", "'"]],
\     'immutable': ['\%(^\_s\|\n\)\s*', '\s\+$']
\   },
\   {
\     'description': 'Reorder the comma-separated items in {} with <> and trailing , support.',
\     'mode': 'n',
\     'surrounds': ['{', '.[ \n]*}', 1],
\     'delimiter': ['\s*,\s*'],
\     'braket': [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']],
\     'quotes': [['"', '"'], ["'", "'"]],
\     'immutable': ['\%(^\_s\|\n\)\s*', '\s\+$']
\   } ]

" Problem: 'surrounds': ['{', ';\+[ \n]*}', 1], (note \+) allows make ; optional, but it breaks for nested curly braces



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

""""""""""""""""
" COLOR SCHEME "
""""""""""""""""


:set termguicolors 
colorscheme gruvbox

let g:gruvbox_contrast_light="hard"             " Light colors, values are soft/medium/hard
set background=light                            " Setting light mode

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
""" TODO
