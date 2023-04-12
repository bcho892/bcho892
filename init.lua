local Plug = vim.fn['plug#']

vim.cmd[[set number]]
vim.cmd[[set noshowmode]]
vim.call('plug#begin','C:\\Users\\AKLbc\\AppData\\Local\\nvim\\autoload\\plugged')
Plug('https://github.com/scrooloose/nerdtree')
Plug('https://github.com/jiangmiao/auto-pairs')
Plug('https://github.com/neovim/nvim-lspconfig')
Plug('romgrk/barbar.nvim')
Plug('https://github.com/VHDL-LS/rust_hdl')
Plug('lambdalisue/fern.vim')
Plug('lambdalisue/fern-renderer-nerdfont.vim')
Plug('iamcco/markdown-preview.nvim')
Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug('lukas-reineke/indent-blankline.nvim')
Plug('neovim/nvim-lspconfig')
Plug('echasnovski/mini.nvim', { branch = 'stable' })
Plug('lambdalisue/fern.vim')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-vsnip')
Plug('ahmedkhalf/project.nvim')
Plug('hrsh7th/vim-vsnip')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.1' })
Plug('dinhhuy258/git.nvim')
Plug('williamboman/nvim-lsp-installer')
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
require("nvim-lsp-installer").setup {}
require("scrollbar").setup()
local cmp = require'cmp'
local builtin = require('telescope.builtin')
vim.g['fern#renderer'] = "nerdfont"
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
require("tokyonight").setup({
	dim_inactive = true,
	lualine_bold = true,
	use_background = false,
})
vim.cmd[[colorscheme tokyonight]]
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
cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
	vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' }, -- For vsnip users.
  -- { name = 'luasnip' }, -- For luasnip users.
  -- { name = 'ultisnips' }, -- For ultisnips users.
  -- { name = 'snippy' }, -- For snippy users.
}, {
  { name = 'buffer' },
})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}
lspconfig.eslint.setup {}
lspconfig.html.setup {}
lspconfig.marksman.setup {}
lspconfig.vhdl_ls.setup {}
lspconfig.jedi_language_server.setup{}
vim.opt.clipboard:prepend {'unnamed',  'unnamedplus'}
-- vim commands
vim.cmd[[set tabstop=4 shiftwidth=4]]

