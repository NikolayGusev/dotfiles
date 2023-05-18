---@diagnostic disable: undefined-global

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



require('lazy').setup({
  { "nvim-lua/plenary.nvim" },

  -- Required by leap
  { "tpope/vim-repeat" },
  { "machakann/vim-sandwich" },

  -- Required by textobj-parameter
  { "kana/vim-textobj-user" },
  { "julian/vim-textobj-variable-segment" },
  { "urxvtcd/vim-indent-object" },
  { "wellle/targets.vim" },
  { "D4KU/vim-textobj-chainmember" },

  { "ggandor/leap.nvim" },
  { "rhysd/clever-f.vim" },
  -- Autoclear search (/) highlight when cursor moves.
  { "romainl/vim-cool" },

  { "svermeulen/vim-cutlass" },
  { "svermeulen/vim-yoink" },
  { "svermeulen/vim-subversive" },
  -- type error fixer, case insensitive replacer, pattern replacer, case changer
  { "tpope/vim-abolish" },
  -- highlights abolish and other commands before executing
  { "markonm/traces.vim" },

  -- Practice vim
  { "ThePrimeagen/vim-be-good" },

  -- Theme
  { "gruvbox-community/gruvbox" },
  -- Commands that only affect the selection, provides :B for visual commands and :S for visual searches.
  { "vim-scripts/vis" },

  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },

  { "chrisgrieser/nvim-spider" },
  { "abecodes/tabout.nvim" },

  { "mizlan/iswap.nvim" },
  { "AckslD/nvim-trevJ.lua" }
});

vim.g.vim_be_good_delete_me_offset = 35

-- General
vim.cmd("language en_US")
vim.g.mapleader = ","
vim.api.nvim_set_keymap("n", "<leader><leader>/", ":noh<CR>", {})
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"
vim.opt.gdefault = true -- 'g' flag by default for replaces
-- Format options come from this guy: formatoptions=jcroql Last set from /usr/local/Cellar/neovim/0.9.0/share/nvim/runtime/ftplugin/typescript.vim line 1
vim.cmd([[autocmd FileType * setlocal formatoptions-=ro]])

vim.api.nvim_set_keymap("n", "gg", "gg0", {})
vim.api.nvim_set_keymap("n", "G", "G$", {})
vim.api.nvim_set_keymap("n", "<S-L>", "<S-L>zz", {})
vim.api.nvim_set_keymap("n", "<S-H>", "<S-H>zz", {})
vim.api.nvim_set_keymap("n", "J", "<Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>", {})
vim.api.nvim_set_keymap("n", "K", "<Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>", {})
vim.api.nvim_set_keymap("v", "<", "<gv", {})
vim.api.nvim_set_keymap("v", ">", ">gv", {})
vim.api.nvim_set_keymap("n", ";", "<Cmd>call VSCodeNotify('editor.action.quickFix')<CR>", {})
vim.api.nvim_set_keymap("v", ";", "<Cmd>call VSCodeCallVisual('editor.action.quickFix', 1)<CR>", {})
vim.api.nvim_set_keymap("v", "<leader>f", "<Cmd>call VSCodeCallVisual('multiCommand.searchSelected', 1)<CR><Esc>", {})

-- duplicate row
vim.api.nvim_set_keymap("n", "<C-d>", ":.t-1<CR>", {})
vim.api.nvim_set_keymap("v", "<C-d>", "ypgv", {})

vim.api.nvim_set_keymap("n", "<silent> <leader>j", ":let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>", {})
vim.api.nvim_set_keymap("v", "<silent> <leader>j", "J", {})

vim.api.nvim_set_keymap("n", "gd", "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>", {})
vim.api.nvim_set_keymap("n", "gD", "<Cmd>call VSCodeNotify('references-view.find')<CR>", {})

vim.api.nvim_set_keymap("n", "<leader>r", ":%s/", {})
vim.api.nvim_set_keymap("n", "<Leader>R", ":%s/\\<<C-r><C-w>\\>/", {})
vim.api.nvim_set_keymap("v", "<leader>r", ":s/\\%V", {})
vim.api.nvim_set_keymap("n", "<leader><leader>r", ":%Subvert/", {})
vim.api.nvim_set_keymap("n", "<Leader><Leader>R", ":%Subvert/<C-r><C-w>/", {})
-- See https://github.com/tpope/vim-abolish/issues/56#issuecomment-457929759
vim.api.nvim_set_keymap("v", "<leader><leader>r", ":B Subvert/", {})

-- don't jump on * and g*
vim.api.nvim_set_keymap("n", "<silent> * ", ":let @/= '\\<' . expand('<cword>') . '\\>' <bar> set hls <cr>", {})
vim.api.nvim_set_keymap("n", "<silent> g* ", ":let @/=expand('<cword>') <bar> set hls <cr>", {})

vim.api.nvim_set_keymap("n", "/", "/\\V", {})
vim.api.nvim_set_keymap("n", "<leader>/ ", "/", {})
vim.api.nvim_set_keymap("n", "? ", "?\\V", {})
vim.api.nvim_set_keymap("n", "<leader>? ", "? ", {})

-- Append lines above below while in normal mode and w/o any movement
vim.api.nvim_set_keymap("n", "<leader>O", ":call append(line('.')-1, '')<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>o", ":call append(line('.')+0, '')<CR>", {})

-- search in visual selection with '/'
vim.keymap.set('x', '/', '<Esc>/\\%V')


-- Text object parameter
vim.g.vim_textobj_parameter_mapping = 'a'

-- clever_f
vim.g.clever_f_across_no_line = 1
vim.g.clever_f_smart_case = 1

-- nvim-spider
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

-- Sandwich
vim.g.sandwich_recipes = vim.deepcopy(vim.g.sandwich_default_recipes)
vim.cmd("runtime macros/sandwich/keymap/surround.vim")

-- match function calls like "console.log(123)"
vim.g.sandwich_magicchar_f_patterns = {
  {
    -- TODO: check if this works
    -- https://github.com/machakann/vim-sandwich/issues/115#issuecomment-940869113
    header = "\\<\\%(\\h\\k*\\.\\)*\\h\\k*",
    bra = "(",
    ket = ")",
    footer = "",
  },
}

-- Source: https://github.com/machakann/vim-sandwich/blob/ffe2bae2fc70ebecf7091a140b6338a95215878c/macros/sandwich/keymap/surround.vim
vim.api.nvim_set_keymap("n", "s", "<Plug>(sandwich-add)", {})
vim.api.nvim_set_keymap("v", "s", "<Plug>(sandwich-add)", {})
-- TODO: what's that? It also complains about <SID> usage
-- vim.api.nvim_set_keymap("o", "<SID>line", ":normal! ^vg_<CR>", {})
-- vim.api.nvim_set_keymap("n", "<silent> ss", "<Plug>(sandwich-add)<SID>line", {})
-- vim.api.nvim_set_keymap("o", "<SID>gul", "g_", {})
-- vim.api.nvim_set_keymap("n", "<silent> S", "<Plug>(sandwich-add)<SID>gul", {})


-- Targets
-- Newer syntax didn't work for me, so had to use deprecated one.
vim.g.targets_argOpening = '[({<[]'
vim.g.targets_argClosing = '[]>})]'
vim.g.targets_argSeparator = '[,;]'
vim.g.targets_jumpRanges = ''
-- Only consider targets around cursor:
-- vim.g.targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB'
-- Only consider targets fully contained in current line:
-- vim.g.targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll'
vim.cmd([[
    autocmd User targets#mappings#user call targets#mappings#extend({
        \ 'b': {'pair': [{'o':'<', 'c':'>'}, {'o':'{', 'c':'}'}, {'o':'(', 'c':')'}, {'o':'[', 'c':']'}]}
        \ })
]])

-- VSCODE RELATED
vim.api.nvim_set_keymap("x", "<silent> gc", "<Cmd>call VSCodeNotifyVisual('editor.action.commentLine', 1)<CR>", {})
vim.api.nvim_set_keymap("n", "gc", "<Plug>VSCodeCommentary", {})
vim.api.nvim_set_keymap("o", "gc", "<Plug>VSCodeCommentary", {})

vim.api.nvim_set_keymap("x", "<silent> gC", "<Cmd>call VSCodeNotifyVisual('editor.action.blockComment', 1)<CR>", {})
vim.api.nvim_set_keymap("n", "<silent> gC", "<Cmd>call VSCodeNotifyVisual('editor.action.blockComment', 1)<CR>", {})
vim.api.nvim_set_keymap("o", "<silent> gC", "<Cmd>call VSCodeNotifyVisual('editor.action.blockComment', 1)<CR>", {})

vim.api.nvim_set_keymap("n", "gcc", "<Plug>VSCodeCommentaryLine", {})

vim.api.nvim_set_keymap("n", "<space>", ":call VSCodeNotify('vspacecode.space')<CR>", {})
vim.api.nvim_set_keymap("v", "<space>", "<Cmd>call VSCodeNotifyVisual('vspacecode.space', 0)<CR>", {})

-- UNSORTED
-- let g:camelcasemotion_key = '<leader>'

-- cleaver-f
vim.api.nvim_set_keymap("n", "<Esc>", ":<C-u>call clever_f#reset()<CR>", {})
vim.g.clever_f_fix_key_direction = 1

-- autocmd ColorScheme * highlight default CleverFMyOwnLabel cterm=bold,underline gui=bold,underline
-- let g:clever_f_mark_char = "CleverFMyOwnLabel"

-- traces.vim
vim.g.traces_abolish_integration = 1

-- LEAP
if vim.g.vscode then
  vim.keymap.set({ 'n', 'v', 'o', 'x' }, "'", function()
    require('leap').leap {
      opts = { highlight_unlabeled_phase_one_targets = true },
      target_windows = { vim.fn.win_getid() }
    }
  end)
else -- jump to any window with leap
  vim.keymap.set({ 'n', 'v', 'o', 'x' }, "'", function()
    require('leap').leap {
      opts = { highlight_unlabeled_phase_one_targets = true },
      target_windows = vim.tbl_filter(function(win)
        return vim.api.nvim_win_get_config(win).focusable
      end, vim.api.nvim_tabpage_list_wins(0))
    }
  end)
end

-- Cutlass.vim
vim.api.nvim_set_keymap("n", "m", "d", {})
vim.api.nvim_set_keymap("x", "<nowait> m", "d", {})

vim.api.nvim_set_keymap("n", "mm", "dd", {})
vim.api.nvim_set_keymap("n", "M", "D", {})

vim.opt.clipboard:append("unnamed") -- use the clipboards of vim and win
-- This breaks vim-cool plugin:
-- vim cool inserts "<Plug>(StopHL)" when I do "i" or "c" right after moving to the next result.
-- set paste -- Paste from a windows or from vim
-- Yoink
vim.api.nvim_set_keymap("n", "<Left>", "<plug>(YoinkPostPasteSwapBack)", {})
vim.api.nvim_set_keymap("n", "<Right>", "<plug>(YoinkPostPasteSwapForward)", {})

vim.api.nvim_set_keymap("n", "p", "<plug>(YoinkPaste_p)", {})
vim.api.nvim_set_keymap("n", "P", "<plug>(YoinkPaste_P)", {})

vim.api.nvim_set_keymap("n", "<leader>p", "p", {})
vim.api.nvim_set_keymap("n", "<leader>P", "P", {})

-- Also replace the default gp with yoink paste so we can toggle paste in this case too
vim.api.nvim_set_keymap("n", "gp", "<plug>(YoinkPaste_gp)", {})
vim.api.nvim_set_keymap("n", "gP", "<plug>(YoinkPaste_gP)", {})

vim.g.yoinkIncludeDeleteOperations = 1
vim.api.nvim_set_keymap("n", "y", "<plug>(YoinkYankPreserveCursorPosition)", {})
vim.api.nvim_set_keymap("x", "y", "<plug>(YoinkYankPreserveCursorPosition)", {})

-- Subversive
-- ie = inner entire buffer
vim.api.nvim_set_keymap("o", "ie", ":exec \"normal! ggVG\"<cr>", {})

-- ix = current viewable text in the buffer
vim.api.nvim_set_keymap("o", "ix", ":exec \"normal! HVL\"<cr>", {})

vim.api.nvim_set_keymap("n", "gr", "<plug>(SubversiveSubstitute)", {})
vim.api.nvim_set_keymap("x", "gr", "<plug>(SubversiveSubstitute)", {})
vim.api.nvim_set_keymap("n", "grr", "<plug>(SubversiveSubstituteLine)", {})
vim.api.nvim_set_keymap("n", "gR", "<plug>(SubversiveSubstituteToEndOfLine)", {})

vim.api.nvim_set_keymap("n", "<leader>s", "<plug>(SubversiveSubstituteRange)", {})
vim.api.nvim_set_keymap("x", "<leader>s", "<plug>(SubversiveSubstituteRange)", {})
vim.api.nvim_set_keymap("n", "<leader>ss", "<plug>(SubversiveSubstituteWordRange)", {})

vim.api.nvim_set_keymap("n", "<leader><leader>s", "<plug>(SubversiveSubvertRange)", {})
vim.api.nvim_set_keymap("x", "<leader><leader>s", "<plug>(SubversiveSubvertRange)", {})
vim.api.nvim_set_keymap("n", "<leader><leader>ss", "<plug>(SubversiveSubvertWordRange)", {})

-- vim-indent-object
vim.api.nvim_set_keymap("o", "ii", "<Plug>(indent-object_linewise-none)", {})
vim.api.nvim_set_keymap("v", "ii", "<Plug>(indent-object_linewise-none)", {})
vim.api.nvim_set_keymap("o", "Ii", "<Plug>(indent-object_blockwise-none)", {})
vim.api.nvim_set_keymap("v", "Ii", "<Plug>(indent-object_blockwise-none)", {})
vim.api.nvim_set_keymap("o", "ai", "<Plug>(indent-object_linewise-both)", {})
vim.api.nvim_set_keymap("v", "ai", "<Plug>(indent-object_linewise-both)", {})
vim.api.nvim_set_keymap("o", "Ai", "<Plug>(indent-object_blockwise-both)", {})
vim.api.nvim_set_keymap("v", "Ai", "<Plug>(indent-object_blockwise-both)", {})

vim.api.nvim_set_keymap("o", "ij", "<Plug>(indent-object_linewise-none-keep-start)", {})
vim.api.nvim_set_keymap("x", "ij", "<Plug>(indent-object_linewise-none-keep-start)", {})
vim.api.nvim_set_keymap("o", "Ij", "<Plug>(indent-object_blockwise-none-keep-start)", {})
vim.api.nvim_set_keymap("x", "Ij", "<Plug>(indent-object_blockwise-none-keep-start)", {})
vim.api.nvim_set_keymap("o", "ik", "<Plug>(indent-object_linewise-none-keep-end)", {})
vim.api.nvim_set_keymap("x", "ik", "<Plug>(indent-object_linewise-none-keep-end)", {})
vim.api.nvim_set_keymap("o", "Ik", "<Plug>(indent-object_blockwise-none-keep-end)", {})
vim.api.nvim_set_keymap("x", "Ik", "<Plug>(indent-object_blockwise-none-keep-end)", {})

-- COLOR SCHEME

vim.opt.termguicolors = true
vim.cmd("colorscheme gruvbox")

vim.g.gruvbox_contrast_light = "hard" -- Light colors, values are soft/medium/hard

-- set background=light -- Setting light mode
vim.cmd("highlight Normal guibg=none") -- Transparency support

vim.cmd("highlight OperatorSandwichBuns guifg='#aa91a0' gui=underline ctermfg=172 cterm=underline")
vim.cmd("highlight OperatorSandwichChange guifg='#ff0000' gui=underline ctermfg='yellow' cterm=underline")
vim.cmd("highlight OperatorSandwichAdd guibg='#b1fa87' gui=none ctermbg='green' cterm=none")
vim.cmd("highlight OperatorSandwichDelete guibg='#ff0000' gui=none ctermbg='red' cterm=none")

-- Feedback
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank { timeout=1000 }]])

-- Folding
-- Fix source: https://github.com/vscode-neovim/vscode-neovim/issues/58#issuecomment-989481648
if vim.g.vscode then
  vim.api.nvim_set_keymap("n", "zm", ":call VSCodeNotify('editor.foldAll')<CR>", {})
  vim.api.nvim_set_keymap("n", "zM", ":call VSCodeNotify('editor.foldAll')<CR>", {})

  vim.api.nvim_set_keymap("n", "zr", ":call VSCodeNotify('editor.unfoldAll')<CR>", {})
  vim.api.nvim_set_keymap("n", "zR", ":call VSCodeNotify('editor.unfoldAll')<CR>", {})

  vim.api.nvim_set_keymap("n", "zc", ":call VSCodeNotify('editor.fold')<CR>", {})
  vim.api.nvim_set_keymap("n", "zC", ":call VSCodeNotify('editor.foldRecursively')<CR>", {})
  vim.api.nvim_set_keymap("n", "zo", ":call VSCodeNotify('editor.unfold')<CR>", {})
  vim.api.nvim_set_keymap("n", "zO", ":call VSCodeNotify('editor.unfoldRecursively')<CR>", {})

  vim.api.nvim_set_keymap("n", "za", ":call VSCodeNotify('editor.toggleFold')<CR>", {})
  vim.api.nvim_set_keymap("n", "zz", ":call VSCodeNotify('editor.toggleFold')<CR>", {})
  vim.api.nvim_set_keymap("v", "<silent> zz",
    "<Esc>`>mb`<mv`vvgg<Cmd>call VSCodeNotifyVisual('editor.createFoldingRangeFromSelection', 1)<CR><Esc>`bvG<Cmd>call VSCodeNotifyVisual('editor.createFoldingRangeFromSelection', 1)<CR><Esc>",
    {})
  vim.api.nvim_set_keymap("v", "<silent> zZ",
    "<Cmd>call VSCodeNotifyVisual('editor.createFoldingRangeFromSelection', 1)<CR><Esc>", {})

  vim.api.nvim_set_keymap("n", "zj", ":call VSCodeNotify('editor.gotoNextFold')<CR>", {})
  vim.api.nvim_set_keymap("n", "zk", ":call VSCodeNotify('editor.gotoPreviousFold')<CR>", {})

  _G.MoveCursor = function(direction)
    if vim.fn.reg_recording() == '' and vim.fn.reg_executing() == '' then
      return 'g' .. direction
    else
      return direction
    end
  end

  vim.api.nvim_set_keymap("n", "j", "<Cmd>lua return MoveCursor('j')<CR>", { expr = true })
  vim.api.nvim_set_keymap("n", "k", "<Cmd>lua return MoveCursor('k')<CR>", { expr = true })
end

-- Tree sitter text objects "
require("nvim-treesitter.install").prefer_git = true

require 'nvim-treesitter.configs'.setup {
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
        ['@function.outer'] = 'V',  -- linewise
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


-- tabout
require('tabout').setup {
  act_as_tab = false, -- shift content if tab out is not possible
}
vim.api.nvim_set_keymap('i', '<Tab>', "<Plug>(TaboutMulti)", { silent = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', "<Plug>(TaboutBackMulti)", { silent = true })


-- iswap "
require('iswap').setup {
  move_cursor = true,
  autoswap = true,
}

local opts = { noremap = true, silent = true }
vim.keymap.set({ "n", "x" }, "gs", '<cmd>ISwapWith<cr>', opts)
vim.keymap.set({ "n", "x" }, "g[", '<cmd>ISwapNodeWithLeft<cr><cmd>ISwapWith<cr>', opts)
vim.keymap.set({ "n", "x" }, "g]", '<cmd>ISwapNodeWithRight<cr><cmd>ISwapWith<cr>', opts)
vim.keymap.set({ "n", "x" }, "g,", '<cmd>ISwapWithLeft<cr>', opts)
vim.keymap.set({ "n", "x" }, "g.", '<cmd>ISwapWithRight<cr>', opts)

-- trevj "
require("trevj").setup() -- optional call for configurating non-default filetypes etc
vim.keymap.set('n', '<leader><leader>j', function() require('trevj').format_at_cursor() end)
