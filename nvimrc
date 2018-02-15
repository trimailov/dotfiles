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
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '__pycache__$', '\.DS_Store']
let NERDTreeShowHidden=1

" plugin for ag - the silver searcher
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
" Better Python autoindentation
Plugin 'hynek/vim-python-pep8-indent'
" use solorized scheme
Plugin 'altercation/vim-colors-solarized'

" ctrlp plugin
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" html5 syntax highlighting
Plugin 'othree/html5.vim'
" surround plugin
Plugin 'tpope/vim-surround'
" scss support
Plugin 'cakebaker/scss-syntax.vim'
" nginx syntax
Plugin 'evanmiller/nginx-vim-syntax'

" javascript plugin
Plugin 'pangloss/vim-javascript'
" JSX syntax highlighting and indenting
Plugin 'mxw/vim-jsx'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/yajs'
" use JSX syntax highlighting on .js files as well
let g:jsx_ext_required = 0

" editorconfig plugin: http://editorconfig.org/
Plugin 'editorconfig/editorconfig-vim'

" Asynchronous Lint Engine
Plugin 'w0rp/ale'
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_echo_msg_format = '[%linter%] %s'

" autocompletion
" Plugin 'Valloric/YouCompleteMe'

" asynchronous autocompletion for neovim/vim8
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plugin 'zchee/deoplete-jedi'
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'zchee/deoplete-jedi'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plugin 'ekalinin/Dockerfile.vim'

Plugin 'jlanzarotta/bufexplorer'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" ==== Vundle settings end ====

" ==== VIM settings ====

" Set shell to bash in case bash incompatible shell is used
set shell=/bin/bash

" Show line numbers
set number

" Show status line
set laststatus=2
set statusline=%f%<\ %r%h%w\ %{fugitive#statusline()}\ %=[%3l,%3v\ %L]

" Insert spaces on tab
set expandtab

" Tab is 4 spaces
set tabstop=4

" Delete tab at once, even if it was inserted as spaces
set softtabstop=4

" Number of spaces for autoindent
set shiftwidth=4

" Enable autoindent
" set smartindent

" make backspace work like most other apps
set backspace=2

" I want fugitive to open diffs vertically all the time
set diffopt=vertical

" Delete trailing whitespaces on save, and save current cursor position
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Highlight 80th column
set colorcolumn=80

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
" set cursorline

" do recursive file find
set path+=**

" Python tracebacks (unittest + doctest output)
set errorformat=\ %#File\ \"%f\"\\,\ line\ %l\\,\ %m
set errorformat+=\@File\:\ %f

" turn on syntax highlighting
syntax on
" ====================

" ==== COLORS ====
" colorscheme solarized
" set bg=light
" let g:solarized_contrast = "high"

" ====================

" ==== KEY REMAPS ====
" alias some fugitive.vim commands
cnoreabbrev gc Gcommit -v
cnoreabbrev gca Gcommit -v -a
cnoreabbrev gd Gdiff
cnoreabbrev gst Gstatus
cnoreabbrev gw Gwrite
cnoreabbrev gr Gread
cnoreabbrev gb Gblame

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

" for tests
nnoremap <leader>m :silent make!<cr>

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ====================

" NVIM specific
if has('nvim')
    let g:python_host_prog = '/Users/justas/.pyenv/shims/python2'
    let g:python3_host_prog = '/Users/justas/.pyenv/shims/python3'
    colorscheme tomorrow-night-bright
    set termguicolors
endif

" MACVIM specific
if has('gui_running')
    set guioptions-=L
    set guioptions-=r
    set guifont=Menlo:h12

    " set color for macvim (https://stackoverflow.com/a/21114248)
    let colors_name = 'Tomorrow-Night-Bright'
    let macvim_skip_colorscheme=1
endif
