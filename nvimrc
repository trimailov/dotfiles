" ==== Vundle settings ====

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Git gutter
Plugin 'airblade/vim-gitgutter'
" Fugitive - git for vim
Plugin 'tpope/vim-fugitive'
" NerdTree
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let NERDTreeShowHidden=1

" add neomake
Plugin 'benekastah/neomake'
let g:neomake_error_sign = {
            \ 'text': '>>',
            \ 'texthl': 'ErrorMsg',
            \ }
hi MyWarningMsg ctermbg=3 ctermfg=0
let g:neomake_warning_sign = {
            \ 'text': '>>',
            \ 'texthl': 'MyWarningMsg',
            \ }
let g:neomake_python_pep8_maker = {'args': ['--ignore', 'E501']}

" add TagBar
Plugin 'majutsushi/tagbar'
" plugin for ag - the silver searcher
Plugin 'rking/ag.vim'
" Better Python autoindentation
Plugin 'hynek/vim-python-pep8-indent'
" RST Plugin
Plugin 'Rykka/riv.vim'
let g:riv_fold_auto_update = 0
" screw it - use solorized scheme
Plugin 'altercation/vim-colors-solarized'
" if different mood use gruvbox
Plugin 'morhetz/gruvbox'

" ctrlp plugin
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" rust syntax highlighting and file detection
Plugin 'rust-lang/rust.vim'
" toml filetype support
Plugin 'cespare/vim-toml'
" html5 syntax highlighting
Plugin 'othree/html5.vim'
" surround plugin
Plugin 'tpope/vim-surround'
" swift support
Plugin 'toyamarinyon/vim-swift'
" scss support
Plugin 'cakebaker/scss-syntax.vim'
" nginx syntax
Plugin 'evanmiller/nginx-vim-syntax'
" javascript plugin
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ==== Vundle settings end ====

" Set shell to bash in case bash incompatible shell is used
set shell=/bin/bash

" Show line numbers
set number

" Show status line
set laststatus=2
set statusline=%t%<\ %r%h%w\ %y\ %{fugitive#statusline()}\ %=[%3l,%3v\ %L(%P%M)]

" Hide right hand scroll bar
set guioptions-=r

" Hide left hand scroll bar on vertical split
set guioptions-=L

" Set font to Menlo 12pt
set guifont=Menlo:h12

" Insert spaces on tab
set expandtab

" Tab is 4 spaces
set tabstop=4

" Delete tab at once, even if it was inserted as spaces
set softtabstop=4

" Number of spaces for autoindent
set shiftwidth=4

" Enable autoindent
set smartindent

" make backspace work like most other apps
set backspace=2

" enable mouse scroll in terminal vim
set mouse=a

" I want fugitive to open diffs vertically all the time
set diffopt=vertical

" Delete trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" run Neomake for syntax checking
autocmd BufWrite * :Neomake

" with certain file types use 2 spaces for tab
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType sass setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" Highlight 80th column
set colorcolumn=80

" Increase space between the lines
set linespace=2

" ignore case
set ignorecase

" when splitting window split below or to the right of original window
set splitbelow
set splitright

" do not save swap files
set noswapfile

" copy to OS clipboard
set clipboard=unnamed

" detect file changes
set autoread

" show search result while writing search query
set incsearch

" highlight searches
set hlsearch

" highlight cureent line
set cursorline

" do recursive file find
set path+=**

" turn on syntax highlighting
syntax on

" ==== KEY REMAPS ====
" change leader key to ,
let mapleader = ","

" use `contextual` arrow keys
" i.e. always go up and down by visible line, and not by new-line breaks
" e.g. when line is longer than the width of a window
nnoremap k gk
nnoremap j gj

" shortcut to turn off search highlighting
nnoremap <leader>s :nohls<cr>

" map Explore to a shortcut
nnoremap <leader>n :NERDTreeToggle<cr>
" map File reveal in tree to a shortcut
nnoremap <leader>r :NERDTreeFind<cr>
" show Explore as a tree
let g:netrw_liststyle=3
" Do not show .pyc files in Explore
let g:netrw_list_hide = '\.pyc$'

" map TagbarToggle to a shortcut
nnoremap <leader>t :TagbarToggle<cr>

" Autocomplete to TAB
inoremap <Tab> <C-P>

" Autocomplete remap to ESC, to avoid accidents
inoremap <C-P> <C-[>

" Better moving between splits
nnoremap <m-h> <C-W>h
nnoremap <m-j> <C-W>j
nnoremap <m-k> <C-W>k
nnoremap <m-l> <C-W>l

" No need of shift for :
nnoremap ; :

" Do not delete whitespace when inserting #
inoremap # X<C-H>#

" search results are in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

" exit terminal in a more natural way
tnoremap <Esc> <C-\><C-n>
tnoremap <C-]> <C-\><C-n>

" Syntax highlighting for ARM assembly
autocmd BufNewFile,BufRead *.s   set syntax=arm

" Syntax highlighting for yaml
autocmd BufNewFile,BufRead *.sls   set syntax=yaml

" Syntax highlighting for less
autocmd BufNewFile,BufRead *.less   set syntax=css

" open html files with htmldjango syntax highlight
au BufNewFile,BufRead *.html set filetype=htmldjango

set omnifunc+=javascriptcomplete#CompleteJS

" alias some fugitive.vim commands
cnoreabbrev gc Gcommit -v
cnoreabbrev gca Gcommit -v -a
cnoreabbrev gd Gdiff
cnoreabbrev gst Gstatus
cnoreabbrev gw Gwrite
cnoreabbrev gr Gread
cnoreabbrev gb Gblame
" ====================

" ==== COLORS ====
colorscheme solarized
set bg=light
" ====================
