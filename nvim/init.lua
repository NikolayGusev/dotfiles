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

-- Helper functions
local merge = function(a, b)
  local c = {}
  for k, v in pairs(a) do c[k] = v end
  for k, v in pairs(b) do c[k] = v end
  return c
end

local map = vim.keymap.set;

-- plugins
require('lazy').setup({
  { "nvim-lua/plenary.nvim" },
  { "akinsho/toggleterm.nvim" },

  {
    "folke/which-key.nvim",
    config = function() require("which-key").setup({}) end,
  },
  { 'tpope/vim-sleuth' },        -- Detect tabstop and shiftwidth automatically
  {
    'nvim-lualine/lualine.nvim', -- See `:help lualine.txt`
    opts = {
      sections = {
        lualine_a = {}, -- { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {}, -- {'encoding', 'fileformat', 'filetype'},
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    'lewis6991/gitsigns.nvim', -- See `:help gitsigns.txt`
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },
  {
    "RRethy/vim-illuminate", -- highlights words under the cursor
    config = function()
      vim.cmd("hi IlluminatedWordWrite guibg=#885252 gui=underline")
      vim.cmd("hi IlluminatedWordRead guibg=#525252 gui=none")
      vim.cmd("hi IlluminatedWordRead guibg=#525252 gui=none")
      require('illuminate').configure({ delay = 20, })
    end
  },

  -- LF vim
  {
    "lmburns/lf.nvim",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- This feature will not work if the plugin is lazy-loaded
      vim.g.lf_netrw = 1

      require("lf").setup({
        winblend = 0,
        highlights = { NormalFloat = { guibg = "NONE" } },
        border = "double", -- border kind: single double shadow curved
        height = 0.70,
        width = 0.85,
        escape_quit = true,
      })

      if not vim.g.vscode then
        map("n", "<space>ff", ":Lf<CR>", { desc = "Open LF" })
      end
    end,
    dependencies = { { "plenary.nvim" }, { "toggleterm.nvim" } }
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    config = function()
      if not vim.g.vscode then
        require('telescope').load_extension('fzf')
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<space><space>', builtin.find_files, {})
        vim.keymap.set('n', '<space>bb', builtin.buffers, {})
        vim.keymap.set('n', '<space>g', builtin.live_grep, {})
      end
    end,
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' }
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- targets
  { "machakann/vim-sandwich" },
  { "julian/vim-textobj-variable-segment",      dependencies = { { "kana/vim-textobj-user" }, } },
  { "urxvtcd/vim-indent-object" },
  { "wellle/targets.vim" },
  { "D4KU/vim-textobj-chainmember",             dependencies = { { "kana/vim-textobj-user" }, } },

  --nav
  { "ggandor/leap.nvim",                        dependencies = { { "tpope/vim-repeat" }, } },
  { "rhysd/clever-f.vim" },
  -- Autoclear search (/) highlight when cursor moves.
  { "romainl/vim-cool" },
  {
    "ThePrimeagen/harpoon",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 32,
      }
    }
  },

  -- copy/paste
  { "svermeulen/vim-cutlass" },
  { "svermeulen/vim-yoink" },
  { "svermeulen/vim-subversive" },
  -- type error fixer, case insensitive replacer, pattern replacer, case changer
  { "tpope/vim-abolish" },
  -- highlights abolish and other commands before executing
  { "markonm/traces.vim" },

  -- Comments
  { 'numToStr/Comment.nvim',    config = function() require('Comment').setup() end, },

  -- Practice vim
  { "ThePrimeagen/vim-be-good" },

  -- Theme
  { "catppuccin/nvim",          name = "catppuccin" },
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
  { "AckslD/nvim-trevJ.lua" },

  -- lsp
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  { "ray-x/lsp_signature.nvim" },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },
});

vim.g.vim_be_good_delete_me_offset = 35

-- General
vim.cmd("language en_US")
vim.g.mapleader = ","
map("n", "<leader><leader>/", ":noh<CR>", {})
vim.opt.cursorline = true
vim.opt.scrolloff = 999
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"
vim.o.undofile = true -- Save undo history


vim.opt.gdefault = true -- 'g' flag by default for replaces
-- Format options come from this guy: formatoptions=jcroql Last set from /usr/local/Cellar/neovim/0.9.0/share/nvim/runtime/ftplugin/typescript.vim line 1
vim.cmd([[autocmd FileType * setlocal formatoptions-=ro]])

map("n", "gg", "gg0", {})
map("n", "G", "G$", {})
map("n", "<S-L>", "<S-L>zz", {})
map("n", "<S-H>", "<S-H>zz", {})
map("n", "J", "<Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>", {})
map("n", "K", "<Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>", {})
map("v", "<", "<gv", {})
map("v", ">", ">gv", {})
map("n", ";", "<Cmd>call VSCodeNotify('editor.action.quickFix')<CR>", {})
map("v", ";", "<Cmd>call VSCodeCallVisual('editor.action.quickFix', 1)<CR>", {})
map("v", "<leader>f", "<Cmd>call VSCodeCallVisual('multiCommand.searchSelected', 1)<CR><Esc>", {})

map("n", "<C-d>", ":.t-1<CR>", { desc = "Duplicate row" })
map('v', '<C-d>', [[<Cmd>lua DuplicateSelection()<CR>]], { noremap = true })
function DuplicateSelection()
  if vim.fn.mode() == 'V' then
    local keys = vim.api.nvim_replace_termcodes(":'<,'>t'><CR>gv", true, false, true)
    vim.api.nvim_feedkeys(keys, 'v', false)
  else
    vim.api.nvim_feedkeys('ypgv', 'v', true)
  end
end

map("n", "<leader>j", ":let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>", { silent = true })
map("v", "<leader>j", "J", { silent = true })

map("n", "gd", "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>", {})
map("n", "gD", "<Cmd>call VSCodeNotify('references-view.find')<CR>", {})

map("n", "gj", "<cmd>lua require('harpoon.ui').nav_next()<CR>", {})
map("n", "gk", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", {})
map("n", "gl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {})
map("n", "gL", "<cmd>lua require('harpoon.mark').add_file()<CR>", {})

map("n", "<leader>r", ":%s/", {})
map("n", "<Leader>R", ":%s/\\<<C-r><C-w>\\>/", {})
map("v", "<leader>r", ":s/\\%V", {})
map("n", "<leader><leader>r", ":%Subvert/", {})
map("n", "<Leader><Leader>R", ":%Subvert/<C-r><C-w>/", {})
-- See https://github.com/tpope/vim-abolish/issues/56#issuecomment-457929759
map("v", "<leader><leader>r", ":B Subvert/", {})

-- don't jump on * and g*
map("n", "* ", ":let @/= '\\<' . expand('<cword>') . '\\>' <bar> set hls <cr>", { silent = true })
map("n", "g* ", ":let @/=expand('<cword>') <bar> set hls <cr>", { silent = true })

map("n", "/", "/\\V", {})
map("n", "<leader>/ ", "/", {})
map("n", "? ", "?\\V", {})
map("n", "<leader>? ", "? ", {})

-- Append lines above below while in normal mode and w/o any movement
map("n", "<leader>O", ":call append(line('.')-1, '')<CR>", {})
map("n", "<leader>o", ":call append(line('.')+0, '')<CR>", {})

-- search in visual selection with '/'
map('x', '/', '<Esc>/\\%V')


-- Text object parameter
vim.g.vim_textobj_parameter_mapping = 'a'

-- clever_f
vim.g.clever_f_across_no_line = 1
vim.g.clever_f_smart_case = 1

-- nvim-spider
map({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
map({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
map({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
map({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

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
map("n", "s", "<Plug>(sandwich-add)", { desc = "Surround with..." })
map("n", "sdd", "<Plug>(sandwich-delete-auto)", { desc = "Remove surrounding (auto)" })
map("n", "srr", "<Plug>(sandwich-replace-auto)", { desc = "Change surrounding (auto)" })
map("v", "s", "<Plug>(sandwich-add)", { desc = "Surround with...", nowait = true })
map("n", "ss", "^vg_<Plug>(sandwich-add)", { desc = "Surround line with..." })
map("n", "S", "<Plug>(sandwich-add)$", { desc = "Surround to the end of line with..." })


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
-- map("x", "gc", "<Cmd>call VSCodeNotifyVisual('editor.action.commentLine', 1)<CR>", { silent = true }) -- no way to do that yet and probably not necessary either
map("x", "gC", "<Cmd>call VSCodeNotifyVisual('editor.action.blockComment', 1)<CR>", { silent = true })
map("n", "gC", "<Plug>VSCodeCommentary", {})
map("n", "gCC", "<Plug>VSCodeCommentaryLine", {})

map("n", "<space>", ":call VSCodeNotify('vspacecode.space')<CR>", {})
map("v", "<space>", "<Cmd>call VSCodeNotifyVisual('vspacecode.space', 0)<CR>", {})

-- cleaver-f
map("n", "<Esc>", ":<C-u>call clever_f#reset()<CR>", {})
vim.g.clever_f_fix_key_direction = 1

-- autocmd ColorScheme * highlight default CleverFMyOwnLabel cterm=bold,underline gui=bold,underline
-- let g:clever_f_mark_char = "CleverFMyOwnLabel"

-- traces.vim
vim.g.traces_abolish_integration = 1

-- LEAP
if vim.g.vscode then
  map({ 'n', 'v', 'o', 'x' }, "'", function()
    require('leap').leap {
      opts = { highlight_unlabeled_phase_one_targets = true },
      target_windows = { vim.fn.win_getid() }
    }
  end)
else -- jump to any window with leap
  map({ 'n', 'v', 'o', 'x' }, "'", function()
    require('leap').leap {
      opts = { highlight_unlabeled_phase_one_targets = true },
      target_windows = vim.tbl_filter(function(win)
        return vim.api.nvim_win_get_config(win).focusable
      end, vim.api.nvim_tabpage_list_wins(0))
    }
  end)
end

-- Cutlass.vim
map("n", "m", "d", {})
map("x", "m", "d", { nowait = true })

map("n", "mm", "dd", {})
map("n", "M", "D", {})

vim.opt.clipboard:append("unnamed") -- use the clipboards of vim and win
-- This breaks vim-cool plugin:
-- vim cool inserts "<Plug>(StopHL)" when I do "i" or "c" right after moving to the next result.
-- set paste -- Paste from a windows or from vim
-- Yoink
map("n", "<Left>", "<plug>(YoinkPostPasteSwapBack)", {})
map("n", "<Right>", "<plug>(YoinkPostPasteSwapForward)", {})

map("n", "p", "<plug>(YoinkPaste_p)", {})
map("n", "P", "<plug>(YoinkPaste_P)", {})

map("n", "<leader>p", "p", {})
map("n", "<leader>P", "P", {})

-- Also replace the default gp with yoink paste so we can toggle paste in this case too
map("n", "gp", "<plug>(YoinkPaste_gp)", {})
map("n", "gP", "<plug>(YoinkPaste_gP)", {})

vim.g.yoinkIncludeDeleteOperations = 1
map("n", "y", "<plug>(YoinkYankPreserveCursorPosition)", {})
map("x", "y", "<plug>(YoinkYankPreserveCursorPosition)", {})

-- Subversive
-- ie = inner entire buffer
map("o", "ie", ":exec \"normal! ggVG\"<cr>", {})

-- ix = current viewable text in the buffer
map("o", "ix", ":exec \"normal! HVL\"<cr>", {})

map("n", "gr", "<plug>(SubversiveSubstitute)", {})
map("x", "gr", "<plug>(SubversiveSubstitute)", {})
map("n", "grr", "<plug>(SubversiveSubstituteLine)", {})
map("n", "gR", "<plug>(SubversiveSubstituteToEndOfLine)", {})

map("n", "<leader>s", "<plug>(SubversiveSubstituteRange)", {})
map("x", "<leader>s", "<plug>(SubversiveSubstituteRange)", {})
map("n", "<leader>ss", "<plug>(SubversiveSubstituteWordRange)", {})

map("n", "<leader><leader>s", "<plug>(SubversiveSubvertRange)", {})
map("x", "<leader><leader>s", "<plug>(SubversiveSubvertRange)", {})
map("n", "<leader><leader>ss", "<plug>(SubversiveSubvertWordRange)", {})

-- vim-indent-object
map("o", "ii", "<Plug>(indent-object_linewise-none)", {})
map("v", "ii", "<Plug>(indent-object_linewise-none)", {})
map("o", "Ii", "<Plug>(indent-object_blockwise-none)", {})
map("v", "Ii", "<Plug>(indent-object_blockwise-none)", {})
map("o", "ai", "<Plug>(indent-object_linewise-both)", {})
map("v", "ai", "<Plug>(indent-object_linewise-both)", {})
map("o", "Ai", "<Plug>(indent-object_blockwise-both)", {})
map("v", "Ai", "<Plug>(indent-object_blockwise-both)", {})

map("o", "ij", "<Plug>(indent-object_linewise-none-keep-start)", {})
map("x", "ij", "<Plug>(indent-object_linewise-none-keep-start)", {})
map("o", "Ij", "<Plug>(indent-object_blockwise-none-keep-start)", {})
map("x", "Ij", "<Plug>(indent-object_blockwise-none-keep-start)", {})
map("o", "ik", "<Plug>(indent-object_linewise-none-keep-end)", {})
map("x", "ik", "<Plug>(indent-object_linewise-none-keep-end)", {})
map("o", "Ik", "<Plug>(indent-object_blockwise-none-keep-end)", {})
map("x", "Ik", "<Plug>(indent-object_blockwise-none-keep-end)", {})

-- COLOR SCHEME

vim.opt.termguicolors = true
vim.cmd("colorscheme catppuccin")

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
  map("n", "zm", ":call VSCodeNotify('editor.foldAll')<CR>", {})
  map("n", "zM", ":call VSCodeNotify('editor.foldAll')<CR>", {})

  map("n", "zr", ":call VSCodeNotify('editor.unfoldAll')<CR>", {})
  map("n", "zR", ":call VSCodeNotify('editor.unfoldAll')<CR>", {})

  map("n", "zc", ":call VSCodeNotify('editor.fold')<CR>", {})
  map("n", "zC", ":call VSCodeNotify('editor.foldRecursively')<CR>", {})
  map("n", "zo", ":call VSCodeNotify('editor.unfold')<CR>", {})
  map("n", "zO", ":call VSCodeNotify('editor.unfoldRecursively')<CR>", {})

  map("n", "za", ":call VSCodeNotify('editor.toggleFold')<CR>", {})
  map("n", "zz", ":call VSCodeNotify('editor.toggleFold')<CR>", {})
  map("v", "zz",
    "<Esc>`>mb`<mv`vvgg<Cmd>call VSCodeNotifyVisual('editor.createFoldingRangeFromSelection', 1)<CR><Esc>`bvG<Cmd>call VSCodeNotifyVisual('editor.createFoldingRangeFromSelection', 1)<CR><Esc>",
    { silent = true })
  map("v", "zZ",
    "<Cmd>call VSCodeNotifyVisual('editor.createFoldingRangeFromSelection', 1)<CR><Esc>", { silent = true })

  map("n", "zj", ":call VSCodeNotify('editor.gotoNextFold')<CR>", {})
  map("n", "zk", ":call VSCodeNotify('editor.gotoPreviousFold')<CR>", {})

  _G.MoveCursor = function(direction)
    if vim.fn.reg_recording() == '' and vim.fn.reg_executing() == '' then
      return 'g' .. direction
    else
      return direction
    end
  end

  -- https://github.com/vscode-neovim/vscode-neovim/issues/58#issuecomment-1229279216
  local function moveCursor(direction)
    if (vim.fn.reg_recording() == '' and vim.fn.reg_executing() == '') then
      return ('g' .. direction)
    else
      return direction
    end
  end
  map('n', 'k', function() return moveCursor('k') end, { expr = true, remap = true })
  map('n', 'j', function() return moveCursor('j') end, { expr = true, remap = true })
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
-- require('tabout').setup {
--   act_as_tab = false, -- shift content if tab out is not possible
-- }
-- map('i', '<Tab>', "<Plug>(TaboutMulti)", { silent = true })
-- map('i', '<S-Tab>', "<Plug>(TaboutBackMulti)", { silent = true })


-- iswap "
require('iswap').setup {
  move_cursor = true,
  autoswap = true,
}

local opts = { noremap = true, silent = true }
map({ "n", "x" }, "gs", '<cmd>ISwapWith<cr>', merge(opts, { desc = "Swap with..." }))
map({ "n", "x" }, "g[", '<cmd>ISwapNodeWithLeft<cr><cmd>ISwapWith<cr>', opts)
map({ "n", "x" }, "g]", '<cmd>ISwapNodeWithRight<cr><cmd>ISwapWith<cr>', opts)
map({ "n", "x" }, "g,", '<cmd>ISwapWithLeft<cr>', opts)
map({ "n", "x" }, "g.", '<cmd>ISwapWithRight<cr>', opts)

-- trevj "
require("trevj").setup() -- optional call for configurating non-default filetypes etc
map('n', '<leader><leader>j', function() require('trevj').format_at_cursor() end)


-- LSP

require("lsp_signature").setup({})

if not vim.g.vscode then
  map('n', '<space>xr', vim.lsp.buf.rename, { desc = '[x]Refactoring [R]ename' })
  map('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
  map('n', 'gD', require('telescope.builtin').lsp_references, { desc = 'Goto references' })
  map('n', 'gh', vim.lsp.buf.hover, { desc = '[H]over Documentation' })
  -- map('n', 'gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  -- map('n', '<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  map('n', '<space>jj', require('telescope.builtin').lsp_document_symbols, { desc = 'Jump [J]Symbols' })
  map('n', '<space>ee', require('telescope.builtin').diagnostics, { desc = '[E]rrors [E]rrors}' })
  -- map('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
end


-- Keep signcolumn on by default, else erros that appear will make gutter jump
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'


-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  tsserver = {},
  -- TODO: use this settings to make eslint work in mono-repo
  -- https://www.reddit.com/r/neovim/comments/12fxw01/lsp_hell_with_eslint_linterformater/
  eslint = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- move to opts?
-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete {},
    ['<C-i>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Automatically reload file when reverted in Git
vim.cmd([[
  augroup AutoReload
    autocmd!
    autocmd FocusGained * checktime
  augroup END
]])

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
