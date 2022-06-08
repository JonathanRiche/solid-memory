call plug#begin(stdpath('config') .'/plugged')

" plugins start here

Plug 'nvim-lua/popup.nvim' " An implementation of the Popup API from vim in Neovim
Plug 'nvim-lua/plenary.nvim' " Useful lua functions used in lots of plugins
Plug 'windwp/nvim-autopairs' " Autopairs, integrates with both cmp and nvim-treesitter
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'

Plug 'nvim-lualine/lualine.nvim' " Nice status line integrates with tressitter
Plug 'akinsho/toggleterm.nvim'
Plug 'ahmedkhalf/project.nvim'
Plug 'lewis6991/impatient.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'goolord/alpha-nvim'
Plug 'antoinemadec/FixCursorHold.nvim' " This is needed to fix lsp doc highlight
Plug 'folke/which-key.nvim'

Plug 'psliwka/vim-smoothie' " Helps with scrolling smooth
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" colorschemes
Plug 'navarasu/onedark.nvim'
Plug 'lunarvim/darkplus.nvim'
Plug 'morhetz/gruvbox'

" cmp plugins
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'

" snippets
Plug 'L3MON4D3/LuaSnip'

" LSP
Plug 'neovim/nvim-lspconfig' " Enable LSP
Plug 'williamboman/nvim-lsp-installer' "simple to use language server installer
Plug 'tamago324/nlsp-settings.nvim' "language server settings defined in json
Plug 'jose-elias-alvarez/null-ls.nvim' " for formatters and linters
Plug 'jose-elias-alvarez/typescript.nvim'

" Telescope
Plug 'nvim-telescope/telescope.nvim'

" Tressitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'p00f/nvim-ts-rainbow'



call plug#end()


lua require('user.colorscheme')
lua require('user.cmp')
lua require('user.lsp')
lua require('user.telescope')
lua require('user.treesitter')
lua require('user.autopairs')

lua require('user.nvim-tree')
lua require('user.bufferline')
lua require('user.lualine')
lua require('user.indentline')

"set termguicolors
set mouse+=a

set number
set relativenumber

autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
