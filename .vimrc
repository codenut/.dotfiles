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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'

call plug#end()

syntax on

set complete=.,w,b,u,t,i
let mapleader=","
let g:asyncrun_open = 30

lua << EOF
require('init')
EOF

nmap <Leader>e :TroubleToggle<CR>

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.cp.py 0r ~/.vim/templates/skeleton.cp.py
    autocmd BufNewFile *.cp.cpp 0r ~/.vim/templates/skeleton.cp.cpp
  augroup END
endif

colorscheme tokyonight-moon

noremap <C-\> :NvimTreeToggle<CR>
noremap <leader>nf :NvimTreeFindFile<cr>
noremap <F6> :%s#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1_\l\2#g<CR>

noremap ; :
noremap <C-c> :silent! bp<bar>sp<bar>bn<bar>bd<CR>
noremap <C-a> ggVG<CR>
noremap <Leader>c :Commits<CR>
noremap <Leader>p :Buffer
noremap <Leader>vs :vsplit<CR>
noremap <Leader>df :windo diffthis<CR>
noremap <Leader>ds :windo diffoff<CR>

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

noremap <C-j> :bprev<CR>
noremap <C-k> :bnext<CR>
noremap <leader>d oimport pdb; pdb.set_trace()<Esc>
