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
" Nim for Vim
Plugin 'zah/nimrod.vim'
" NerdTree
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$']

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

" Number of spaces for autoindent
set shiftwidth=4

" Enable autoindent
set cindent

" make backspace work like most other apps
set backspace=2

" enable mouse scroll in terminal vim
set mouse=a

" Delete trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" run Neomake for syntax checking
autocmd BufWrite * :Neomake

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

" turn on syntax highlighting
syntax on

" ==== KEY REMAPS ====
" change leader key to ,
let mapleader = ","

" map Explore to a shortcut
nnoremap <leader>n :Explore<cr>
" show Explore as a tree
let g:netrw_liststyle=3
" Do not show .pyc files in Explore
let g:netrw_list_hide = '\.pyc$'

" map CtrlP to a shortcut
nnoremap <leader>p :CtrlP<cr>

" Autocomplete to TAB
inoremap <Tab> <C-P>

" Autocomplete remap to ESC, to avoid accidents
inoremap <C-P> <C-[>

" Better moving between splits
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" No need of shift for :
nnoremap ; :

" Do not delete whitespace when inserting #
inoremap # X<C-H>#

" Syntax highlighting for ARM assembly
autocmd BufNewFile,BufRead *.s   set syntax=arm
" ====================

" ==== COLORS ====
let g:molokai_original = 1

colorscheme molokai
" ====================

" ==== NIM LANG ====
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i
