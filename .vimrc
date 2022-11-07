set nocompatible
filetype off
filetype plugin indent on

set nonumber
set guicursor=
set signcolumn=yes
set completeopt=menu,menuone,preview,noselect,noinsert
set completeopt-=preview
set ttimeoutlen=50
set laststatus=2
set encoding=utf8
set bs=2
set t_Co=256
set ai sw=4 sts=4 et
set clipboard^=unnamed,unnamedplus
set background=dark
set showtabline=2
set mouse=a
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.class,*.pyc,*.bin
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=l
set guioptions-=L
set pastetoggle=<F3>
set statusline+=%#warningmsg#
set statusline+=%*
set termguicolors

set autoindent
set ruler
set autowrite
set number
set hidden
set incsearch
set smartcase
set ignorecase
set hlsearch
set noswapfile
set splitright
set nofoldenable
set noshowmode
set autoread
set spell spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'ghifarit53/tokyonight-vim'

Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'erb'] }

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'

Plug 'junegunn/vim-easy-align'
Plug 'jparise/vim-graphql'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim'
Plug 'lukas-reineke/lsp-format.nvim'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'sheerun/vim-polyglot'

Plug 'folke/trouble.nvim'
call plug#end()

runtime! macros/matchit.vim

syntax on
colorscheme tokyonight

set complete=.,w,b,u,t,i
let mapleader=","
let vim_markdown_preview_hotkey='<C-m>'
let g:asyncrun_open = 30

noremap <C-\> :NvimTreeToggle<CR>
noremap <leader>nf :NvimTreeFindFile<cr>
noremap <F6> :%s#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1_\l\2#g<CR>

noremap ; :
noremap <C-h> :bprev<CR>
noremap <C-l> :bnext<CR>
noremap <C-c> :silent! bp<bar>sp<bar>bn<bar>bd<CR>
noremap <C-a> ggVG<CR>
noremap <Leader>c :Commits<CR>
noremap <Leader>p :Buffer
noremap <Leader>vs :vsplit<CR>
noremap <Leader>df :windo diffthis<CR>
noremap <Leader>ds :windo diffoff<CR>

noremap <F7> :TagbarToggle<CR>
noremap <F8> :Scratch<CR>
noremap <Leader>pi :w<CR> :so %<CR>:PlugInstall<CR>
noremap <Leader>s :w<CR>
noremap <Leader>q :q! <CR>
noremap <CR> :noh<CR><CR>
noremap <C-s> :%s/
noremap <Leader>w <C-w>
noremap <Leader>vr :Qargs<CR> :argdo %s/
noremap <Leader>vu :argdo update<CR>
noremap <Leader>gs :belowright :vertical Git <CR>
noremap <Leader>gc :Git commit <CR>
noremap <Leader>d :edit<CR>
noremap <Leader>sc :setlocal spell<CR>

noremap <Leader>q :q! <CR>
noremap <Leader>sq :wq! <CR>
noremap ga <Plug>(EasyAlign)

lua << EOF

require('telescope').setup()
require'nvim-tree'.setup()
require'lualine'.setup {
  options = {
    theme = 'gruvbox',
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''}
  }
}
require("bufferline").setup{}

require("mason").setup()
require("mason-lspconfig").setup()

require("trouble").setup()

local lsp = require "lspconfig"

vim.g.coq_settings = {
  keymap = {
    pre_select = true,
  },
  auto_start = true,
}

local coq = require "coq" -- add this

lsp.pyright.setup(coq.lsp_ensure_capabilities{})
lsp.tsserver.setup(coq.lsp_ensure_capabilities{})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.api.nvim_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })

EOF

noremap <C-p> :Telescope find_files<cr>
noremap <Leader>ff :Telescope live_grep<cr>
noremap <Leader>fc :lua require('telescope.builtin').git_commits()<cr>
noremap <Leader>ft :lua require('telescope.builtin').git_stash()<cr>
noremap <Leader>fs :lua require('telescope.builtin').lsp_workspace_symbols()<cr>

noremap <Leader>bb :lua require('telescope.builtin').buffers()<cr>
noremap <Leader>bc :lua require('telescope.builtin').git_bcommits()<cr>
noremap <Leader>bs :lua require('telescope.builtin').lsp_document_symbols()<cr>

noremap <Leader>dr :lua require('telescope.builtin').lsp_references()<cr>
noremap <Leader>di :lua require('telescope.builtin').lsp_implementations()<cr>
noremap <Leader>dd :lua require('telescope.builtin').lsp_definitions()<cr>
noremap <Leader>dt :lua require('telescope.builtin').lsp_type_definitions()<cr>

nmap <Leader>e :TroubleToggle<CR>

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.cp.py 0r ~/.vim/templates/skeleton.cp.py
    autocmd BufNewFile *.cp.cpp 0r ~/.vim/templates/skeleton.cp.cpp
  augroup END
endif

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction

let g:format_debug = v:true
