local Plug = vim.fn['plug#']

vim.call('plug#begin','C:\\Users\\AKLbc\\AppData\\Local\\nvim\\autoload\\plugged')
Plug('https://github.com/scrooloose/nerdtree')
Plug('https://github.com/jiangmiao/auto-pairs')
Plug('romgrk/barbar.nvim')
Plug('lambdalisue/fern.vim')
Plug('lambdalisue/fern-renderer-nerdfont.vim')
Plug('iamcco/markdown-preview.nvim')
Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug('lukas-reineke/indent-blankline.nvim')
Plug('echasnovski/mini.nvim', { branch = 'stable' })
Plug('lambdalisue/fern.vim')
Plug('neoclide/coc.nvim', {branch = 'release'})
Plug('ahmedkhalf/project.nvim')
Plug('hrsh7th/vim-vsnip')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.1' })
Plug('dinhhuy258/git.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('lambdalisue/nerdfont.vim')
Plug('petertriho/nvim-scrollbar')
vim.call('plug#end')
-- setup for mini
require('mini.move').setup()
--
require 'nvim-treesitter.install'.compilers = { 'zig' }
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
require("scrollbar").setup()
local builtin = require('telescope.builtin')
vim.g['fern#renderer'] = "nerdfont"
require("tokyonight").setup({
	dim_inactive = true,
	lualine_bold = true,
	use_background = false,
})
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}
vim.o.background = "light"
vim.cmd[[map <C-c> "+y]]
require("project_nvim").setup {}
require('telescope').load_extension('projects')
require('git').setup()
vim.opt.clipboard:prepend {'unnamed',  'unnamedplus'}
-- vim commands
vim.cmd[[inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]]
vim.cmd[[set wildmenu]]
vim.cmd[[set wildmode=longest:full,full]]
vim.cmd[[set tabstop=4 shiftwidth=4]]
vim.cmd[[set number]]
vim.cmd[[set noshowmode]]
vim.cmd[[colorscheme tokyonight]]
-- keybindings
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
