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

Plug 'matze/vim-move'

Plug 'ThePrimeagen/vim-be-good'                 " Practice vim

Plug 'gruvbox-community/gruvbox'                " Theme
Plug 'vim-scripts/vis'                          " Commands that only affect the selection, provides :B for visual commands and :S for visual searches.

Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }


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

:lua vim.keymap.set({'n', 'v', 'o', 'x'}, "'", function () require('leap').leap { opts={highlight_unlabeled_phase_one_targets = true}, target_windows = { vim.fn.win_getid() } } end)

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

"""""""
" LSP "
"""""""
:lua require('lspconfig').tsserver.setup {}

"  :lua require('lspsaga').init_lsp_saga { server_filetype_map = { typescript = 'typescript' } }
:lua require('lspsaga').setup {}

:lua local opts = { noremap = true, silent = true, nowait = true}
:lua vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
:lua vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
"  :lua vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
:lua vim.keymap.set('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', opts)
:lua vim.keymap.set('n', 'gD', '<Cmd>Lspsaga lsp_finder<CR>', opts)
:lua vim.keymap.set('n', ';', '<Cmd>Lspsaga Lightbulb<CR>', opts)
:lua vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
:lua vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
"  :lua vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', { nowait = true })
:lua vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename ++project<CR>', { nowait = true })


" Global mappings.
" See `:help vim.diagnostic.*` for documentation on any of the below functions

"  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
"  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
"  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
"  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

" Use LspAttach autocommand to only map the following keys
" after the language server attaches to the current buffer

"  vim.api.nvim_create_autocmd('LspAttach', {
"    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
"    callback = function(ev)
"      -- Enable completion triggered by <c-x><c-o>
"      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

"      -- Buffer local mappings.
"      -- See `:help vim.lsp.*` for documentation on any of the below functions
"      local opts = { buffer = ev.buf }
"      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
"      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
"      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
"      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
"      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
"      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
"      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
"      vim.keymap.set('n', '<space>wl', function()
"        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
"      end, opts)
"      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
"      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
"      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
"      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
"      vim.keymap.set('n', '<space>f', function()
"        vim.lsp.buf.format { async = true }
"      end, opts)
"    end,
"  })
  
"
""""""""""""""""""""""""""""
" Tree sitter text objects "
""""""""""""""""""""""""""""
""" TODO



"""""""""""""
" Telescope "
"""""""""""""

" You dont need to set any of these options. These are the default ones. Only
" the loading is important
:lua require('telescope').setup {}
"  require('telescope').setup { extensions = {
"      fzf = {
"        fuzzy = true,                    -- false will only do exact matching
"        override_generic_sorter = true,  -- override the generic sorter
"        override_file_sorter = true,     -- override the file sorter
"        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
"                                         -- the default case_mode is "smart_case"
"      }
"    }
"  }
" To get fzf loaded and working with telescope, you need to call
" load_extension, somewhere after setup function:
:lua require('telescope').load_extension('fzf')

" Find files using Telescope command-line sugar.
nnoremap <space><space> <cmd>Telescope find_files<cr>
nnoremap <space>ss <cmd>Telescope live_grep<cr>
nnoremap <space>bb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>