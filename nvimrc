" ==== Plug settings ====

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged')

" Git gutter
Plug 'airblade/vim-gitgutter'
" Fugitive - git for vim
Plug 'tpope/vim-fugitive'
" NerdTree
Plug 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '__pycache__$', '\.DS_Store']
let NERDTreeShowHidden=1

" plugin for ag - the silver searcher
Plug 'mileszs/ack.vim'
let g:ackprg = 'rg --vimgrep'
cnoreabbrev rg Ack
cnoreabbrev rG Ack
cnoreabbrev Rg Ack
cnoreabbrev RG Ack
" Better Python autoindentation
Plug 'hynek/vim-python-pep8-indent'

" fzf plugin
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" html5 syntax highlighting
Plug 'othree/html5.vim'
" surround plugin
Plug 'tpope/vim-surround'

" javascript plugin
Plug 'pangloss/vim-javascript'
" JSX syntax highlighting and indenting
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/yajs'
" use JSX syntax highlighting on .js files as well
let g:jsx_ext_required = 0

" editorconfig plugin: http://editorconfig.org/
Plug 'editorconfig/editorconfig-vim'

" Asynchronous Lint Engine
Plug 'w0rp/ale'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}
let g:ale_echo_msg_format = '[%linter%] %code%: %s'

" autocompletion
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

Plug 'ekalinin/Dockerfile.vim'

" typescript
Plug 'leafgarland/typescript-vim'

Plug 'vimwiki/vimwiki'
let g:vimwiki_url_maxsave = 0

" auto comments
Plug 'tpope/vim-commentary'

" XXX: there's a bug with native shortcut https://github.com/vimwiki/vimwiki/issues/427
" so remap it to something else
nnoremap <leader>t :VimwikiToggleListItem<CR>

" nimlang support
Plug 'zah/nim.vim'

" JS plugins
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" All of your Plugins must be added before the following line
call plug#end()            " required
"
" ==== Plug settings end ====

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

" do recursive file find
set path+=**

" Python tracebacks (unittest + doctest output)
set errorformat=\ %#File\ \"%f\"\\,\ line\ %l\\,\ %m
set errorformat+=\@File\:\ %f

" the screen will not be redrawn while executing macros
set lazyredraw

" turn on syntax highlighting
syntax on
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

" shortcut for fzf
nnoremap <c-p> :FZF<cr>

" shortcut to turn off search highlighting
nnoremap <leader>s :nohls<cr>

" map Explore to a shortcut
nnoremap <leader>n :NERDTreeToggle<cr>
" map File reveal in tree to a shortcut
nnoremap <leader>r :NERDTreeFind<cr>

" for tests
nnoremap <leader>m :silent make!<cr>

" tab autocomplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" base64 decode selection
vnoremap <leader>64 c<c-r>=system('base64 --decode', @")<cr><esc>

" base64 encode selection
vnoremap <leader>64e c<c-r>=system('base64', @")<esc>

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
    let colors_name = 'Tomorrow-Night'
    let macvim_skip_colorscheme=1
    colorscheme Tomorrow-Night-Bright
endif
