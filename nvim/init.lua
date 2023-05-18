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

local merge = function(a, b)
  local c = {}
  for k, v in pairs(a) do c[k] = v end
  for k, v in pairs(b) do c[k] = v end
  return c
end


require('lazy').setup({
  { "nvim-lua/plenary.nvim" },

  {
    "folke/which-key.nvim",
    config = function() require("which-key").setup({}) end,
  },

  -- targets
  { "machakann/vim-sandwich" },
  { "julian/vim-textobj-variable-segment", dependencies = { { "kana/vim-textobj-user" }, } },
  { "urxvtcd/vim-indent-object" },
  { "wellle/targets.vim" },
  { "D4KU/vim-textobj-chainmember",        dependencies = { { "kana/vim-textobj-user" }, } },

  --nav
  { "ggandor/leap.nvim",                   dependencies = { { "tpope/vim-repeat" }, } },
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
vim.keymap.set("n", "<leader><leader>/", ":noh<CR>", {})
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"
vim.opt.gdefault = true -- 'g' flag by default for replaces
-- Format options come from this guy: formatoptions=jcroql Last set from /usr/local/Cellar/neovim/0.9.0/share/nvim/runtime/ftplugin/typescript.vim line 1
vim.cmd([[autocmd FileType * setlocal formatoptions-=ro]])

vim.keymap.set("n", "gg", "gg0", {})
vim.keymap.set("n", "G", "G$", {})
vim.keymap.set("n", "<S-L>", "<S-L>zz", {})
vim.keymap.set("n", "<S-H>", "<S-H>zz", {})
vim.keymap.set("n", "J", "<Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>", {})
vim.keymap.set("n", "K", "<Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>", {})
vim.keymap.set("v", "<", "<gv", {})
vim.keymap.set("v", ">", ">gv", {})
vim.keymap.set("n", ";", "<Cmd>call VSCodeNotify('editor.action.quickFix')<CR>", {})
vim.keymap.set("v", ";", "<Cmd>call VSCodeCallVisual('editor.action.quickFix', 1)<CR>", {})
vim.keymap.set("v", "<leader>f", "<Cmd>call VSCodeCallVisual('multiCommand.searchSelected', 1)<CR><Esc>", {})

-- duplicate row
vim.keymap.set("n", "<C-d>", ":.t-1<CR>", {})
vim.keymap.set("v", "<C-d>", "ypgv", {})

vim.keymap.set("n", "<silent> <leader>j", ":let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>", {})
vim.keymap.set("v", "<silent> <leader>j", "J", {})

vim.keymap.set("n", "gd", "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>", {})
vim.keymap.set("n", "gD", "<Cmd>call VSCodeNotify('references-view.find')<CR>", {})

vim.keymap.set("n", "<leader>r", ":%s/", {})
vim.keymap.set("n", "<Leader>R", ":%s/\\<<C-r><C-w>\\>/", {})
vim.keymap.set("v", "<leader>r", ":s/\\%V", {})
vim.keymap.set("n", "<leader><leader>r", ":%Subvert/", {})
vim.keymap.set("n", "<Leader><Leader>R", ":%Subvert/<C-r><C-w>/", {})
-- See https://github.com/tpope/vim-abolish/issues/56#issuecomment-457929759
vim.keymap.set("v", "<leader><leader>r", ":B Subvert/", {})

-- don't jump on * and g*
vim.keymap.set("n", "<silent> * ", ":let @/= '\\<' . expand('<cword>') . '\\>' <bar> set hls <cr>", {})
vim.keymap.set("n", "<silent> g* ", ":let @/=expand('<cword>') <bar> set hls <cr>", {})

vim.keymap.set("n", "/", "/\\V", {})
vim.keymap.set("n", "<leader>/ ", "/", {})
vim.keymap.set("n", "? ", "?\\V", {})
vim.keymap.set("n", "<leader>? ", "? ", {})

-- Append lines above below while in normal mode and w/o any movement
vim.keymap.set("n", "<leader>O", ":call append(line('.')-1, '')<CR>", {})
vim.keymap.set("n", "<leader>o", ":call append(line('.')+0, '')<CR>", {})

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
    header = "\\<\\%(\\h\\k*\\.\\)*\\h\\k*",
    bra = "(",
    ket = ")",
    footer = "",
  },
}

-- Source: https://github.com/machakann/vim-sandwich/blob/ffe2bae2fc70ebecf7091a140b6338a95215878c/macros/sandwich/keymap/surround.vim
vim.keymap.set("n", "s", "<Plug>(sandwich-add)", { desc = "Surround with..." })
vim.keymap.set("v", "s", "<Plug>(sandwich-add)", { desc = "Surround with..." })
vim.keymap.set("n", "ss", "^vg_<Plug>(sandwich-add)", { desc = "Surround line with..." })
vim.keymap.set("n", "S", "<Plug>(sandwich-add)$", { desc = "Surround to the end of line with..." })
vim.cmd('xunmap sr')
vim.cmd('xunmap sd')
vim.cmd('xunmap sa')
vim.cmd('nunmap sa')


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
vim.keymap.set("x", "<silent> gc", "<Cmd>call VSCodeNotifyVisual('editor.action.commentLine', 1)<CR>", {})
vim.keymap.set("n", "gc", "<Plug>VSCodeCommentary", {})
vim.keymap.set("o", "gc", "<Plug>VSCodeCommentary", {})

vim.keymap.set("x", "<silent> gC", "<Cmd>call VSCodeNotifyVisual('editor.action.blockComment', 1)<CR>", {})
vim.keymap.set("n", "<silent> gC", "<Cmd>call VSCodeNotifyVisual('editor.action.blockComment', 1)<CR>", {})
vim.keymap.set("o", "<silent> gC", "<Cmd>call VSCodeNotifyVisual('editor.action.blockComment', 1)<CR>", {})

vim.keymap.set("n", "gcc", "<Plug>VSCodeCommentaryLine", {})

vim.keymap.set("n", "<space>", ":call VSCodeNotify('vspacecode.space')<CR>", {})
vim.keymap.set("v", "<space>", "<Cmd>call VSCodeNotifyVisual('vspacecode.space', 0)<CR>", {})

-- UNSORTED
-- let g:camelcasemotion_key = '<leader>'

-- cleaver-f
vim.keymap.set("n", "<Esc>", ":<C-u>call clever_f#reset()<CR>", {})
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
vim.keymap.set("n", "m", "d", {})
vim.keymap.set("x", "<nowait> m", "d", {})

vim.keymap.set("n", "mm", "dd", {})
vim.keymap.set("n", "M", "D", {})

vim.opt.clipboard:append("unnamed") -- use the clipboards of vim and win
-- This breaks vim-cool plugin:
-- vim cool inserts "<Plug>(StopHL)" when I do "i" or "c" right after moving to the next result.
-- set paste -- Paste from a windows or from vim
-- Yoink
vim.keymap.set("n", "<Left>", "<plug>(YoinkPostPasteSwapBack)", {})
vim.keymap.set("n", "<Right>", "<plug>(YoinkPostPasteSwapForward)", {})

vim.keymap.set("n", "p", "<plug>(YoinkPaste_p)", {})
vim.keymap.set("n", "P", "<plug>(YoinkPaste_P)", {})

vim.keymap.set("n", "<leader>p", "p", {})
vim.keymap.set("n", "<leader>P", "P", {})

-- Also replace the default gp with yoink paste so we can toggle paste in this case too
vim.keymap.set("n", "gp", "<plug>(YoinkPaste_gp)", {})
vim.keymap.set("n", "gP", "<plug>(YoinkPaste_gP)", {})

vim.g.yoinkIncludeDeleteOperations = 1
vim.keymap.set("n", "y", "<plug>(YoinkYankPreserveCursorPosition)", {})
vim.keymap.set("x", "y", "<plug>(YoinkYankPreserveCursorPosition)", {})

-- Subversive
-- ie = inner entire buffer
vim.keymap.set("o", "ie", ":exec \"normal! ggVG\"<cr>", {})

-- ix = current viewable text in the buffer
vim.keymap.set("o", "ix", ":exec \"normal! HVL\"<cr>", {})

vim.keymap.set("n", "gr", "<plug>(SubversiveSubstitute)", {})
vim.keymap.set("x", "gr", "<plug>(SubversiveSubstitute)", {})
vim.keymap.set("n", "grr", "<plug>(SubversiveSubstituteLine)", {})
vim.keymap.set("n", "gR", "<plug>(SubversiveSubstituteToEndOfLine)", {})

vim.keymap.set("n", "<leader>s", "<plug>(SubversiveSubstituteRange)", {})
vim.keymap.set("x", "<leader>s", "<plug>(SubversiveSubstituteRange)", {})
vim.keymap.set("n", "<leader>ss", "<plug>(SubversiveSubstituteWordRange)", {})

vim.keymap.set("n", "<leader><leader>s", "<plug>(SubversiveSubvertRange)", {})
vim.keymap.set("x", "<leader><leader>s", "<plug>(SubversiveSubvertRange)", {})
vim.keymap.set("n", "<leader><leader>ss", "<plug>(SubversiveSubvertWordRange)", {})

-- vim-indent-object
vim.keymap.set("o", "ii", "<Plug>(indent-object_linewise-none)", {})
vim.keymap.set("v", "ii", "<Plug>(indent-object_linewise-none)", {})
vim.keymap.set("o", "Ii", "<Plug>(indent-object_blockwise-none)", {})
vim.keymap.set("v", "Ii", "<Plug>(indent-object_blockwise-none)", {})
vim.keymap.set("o", "ai", "<Plug>(indent-object_linewise-both)", {})
vim.keymap.set("v", "ai", "<Plug>(indent-object_linewise-both)", {})
vim.keymap.set("o", "Ai", "<Plug>(indent-object_blockwise-both)", {})
vim.keymap.set("v", "Ai", "<Plug>(indent-object_blockwise-both)", {})

vim.keymap.set("o", "ij", "<Plug>(indent-object_linewise-none-keep-start)", {})
vim.keymap.set("x", "ij", "<Plug>(indent-object_linewise-none-keep-start)", {})
vim.keymap.set("o", "Ij", "<Plug>(indent-object_blockwise-none-keep-start)", {})
vim.keymap.set("x", "Ij", "<Plug>(indent-object_blockwise-none-keep-start)", {})
vim.keymap.set("o", "ik", "<Plug>(indent-object_linewise-none-keep-end)", {})
vim.keymap.set("x", "ik", "<Plug>(indent-object_linewise-none-keep-end)", {})
vim.keymap.set("o", "Ik", "<Plug>(indent-object_blockwise-none-keep-end)", {})
vim.keymap.set("x", "Ik", "<Plug>(indent-object_blockwise-none-keep-end)", {})

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
  vim.keymap.set("n", "zm", ":call VSCodeNotify('editor.foldAll')<CR>", {})
  vim.keymap.set("n", "zM", ":call VSCodeNotify('editor.foldAll')<CR>", {})

  vim.keymap.set("n", "zr", ":call VSCodeNotify('editor.unfoldAll')<CR>", {})
  vim.keymap.set("n", "zR", ":call VSCodeNotify('editor.unfoldAll')<CR>", {})

  vim.keymap.set("n", "zc", ":call VSCodeNotify('editor.fold')<CR>", {})
  vim.keymap.set("n", "zC", ":call VSCodeNotify('editor.foldRecursively')<CR>", {})
  vim.keymap.set("n", "zo", ":call VSCodeNotify('editor.unfold')<CR>", {})
  vim.keymap.set("n", "zO", ":call VSCodeNotify('editor.unfoldRecursively')<CR>", {})

  vim.keymap.set("n", "za", ":call VSCodeNotify('editor.toggleFold')<CR>", {})
  vim.keymap.set("n", "zz", ":call VSCodeNotify('editor.toggleFold')<CR>", {})
  vim.keymap.set("v", "<silent> zz",
    "<Esc>`>mb`<mv`vvgg<Cmd>call VSCodeNotifyVisual('editor.createFoldingRangeFromSelection', 1)<CR><Esc>`bvG<Cmd>call VSCodeNotifyVisual('editor.createFoldingRangeFromSelection', 1)<CR><Esc>",
    {})
  vim.keymap.set("v", "<silent> zZ",
    "<Cmd>call VSCodeNotifyVisual('editor.createFoldingRangeFromSelection', 1)<CR><Esc>", {})

  vim.keymap.set("n", "zj", ":call VSCodeNotify('editor.gotoNextFold')<CR>", {})
  vim.keymap.set("n", "zk", ":call VSCodeNotify('editor.gotoPreviousFold')<CR>", {})

  _G.MoveCursor = function(direction)
    if vim.fn.reg_recording() == '' and vim.fn.reg_executing() == '' then
      return 'g' .. direction
    else
      return direction
    end
  end

  vim.keymap.set("n", "j", "<Cmd>lua return MoveCursor('j')<CR>", { expr = true })
  vim.keymap.set("n", "k", "<Cmd>lua return MoveCursor('k')<CR>", { expr = true })
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
vim.keymap.set('i', '<Tab>', "<Plug>(TaboutMulti)", { silent = true })
vim.keymap.set('i', '<S-Tab>', "<Plug>(TaboutBackMulti)", { silent = true })


-- iswap "
require('iswap').setup {
  move_cursor = true,
  autoswap = true,
}

local opts = { noremap = true, silent = true }
vim.keymap.set({ "n", "x" }, "gs", '<cmd>ISwapWith<cr>', merge(opts, { desc = "Swap with..." }))
vim.keymap.set({ "n", "x" }, "g[", '<cmd>ISwapNodeWithLeft<cr><cmd>ISwapWith<cr>', opts)
vim.keymap.set({ "n", "x" }, "g]", '<cmd>ISwapNodeWithRight<cr><cmd>ISwapWith<cr>', opts)
vim.keymap.set({ "n", "x" }, "g,", '<cmd>ISwapWithLeft<cr>', opts)
vim.keymap.set({ "n", "x" }, "g.", '<cmd>ISwapWithRight<cr>', opts)

-- trevj "
require("trevj").setup() -- optional call for configurating non-default filetypes etc
vim.keymap.set('n', '<leader><leader>j', function() require('trevj').format_at_cursor() end)
