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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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

" autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ekalinin/Dockerfile.vim'

" typescript
Plug 'leafgarland/typescript-vim'

Plug 'vimwiki/vimwiki'
let g:vimwiki_url_maxsave = 0
" disable table tab completion as it's used for autocomplete
let g:vimwiki_table_mappings=0

" XXX: there's a bug with native shortcut https://github.com/vimwiki/vimwiki/issues/427
" so remap it to something else
nnoremap <leader>t :VimwikiToggleListItem<CR>

" nimlang support
Plug 'zah/nim.vim'

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

" JS plugins
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call plug#end()            " required
"
" ==== Plug settings end ====

" ==== VIM settings ====
" Set shell to bash in case bash incompatible shell is used
set shell=/bin/bash

" Show line numbers
set number

" Give more space for displaying messages. (from coc.nvim)
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience. (from coc.nvim)
set updatetime=300

" Don't pass messages to |ins-completion-menu|. (from coc.nvim)
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved. (from coc.nvim)
set signcolumn=yes

" " Show status line
set laststatus=2

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

set statusline=%f%<\ %r%h%w\ %{fugitive#statusline()}\ %{StatusDiagnostic()}\ %{coc#status()}\ %=[%3l,%3v\ %L]

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

" Highlight 100th column
set colorcolumn=100

" when splitting window split below or to the right of original window
set splitbelow
set splitright

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

" show invisible characters
set list

" turn on syntax highlighting
syntax on

" settings for coc.nvim

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" " GoTo code navigation.
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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

" move between windows
nnoremap <m-h> <c-w>h
nnoremap <m-j> <c-w>j
nnoremap <m-k> <c-w>k
nnoremap <m-l> <c-w>l
nnoremap <m-p> <c-w>p
nnoremap <m-w> <c-w>w

" for tests
nnoremap <leader>m :silent make!<cr>

" base64 decode selection
vnoremap <leader>64 c<c-r>=system('base64 --decode', @")<cr><esc>

" base64 encode selection
vnoremap <leader>64e c<c-r>=system('base64', @")<esc>

" escape terminal
tnoremap <esc> <c-\><c-n>

" move out of terminal window
tnoremap <m-h> <c-\><c-n><c-w>h
tnoremap <m-j> <c-\><c-n><c-w>j
tnoremap <m-k> <c-\><c-n><c-w>k
tnoremap <m-l> <c-\><c-n><c-w>l
tnoremap <m-p> <c-\><c-n><c-w>p
tnoremap <m-w> <c-\><c-n><c-w>w

" ====================

" NVIM specific
if has('nvim')
    let os = substitute(system('uname'), "\n", "", "")
    if os == "Darwin"
        let g:python_host_prog = '/Users/justas/.pyenv/shims/python2'
        let g:python3_host_prog = '/Users/justas/.pyenv/shims/python3'
    elseif os == "Linux"
        let g:python_host_prog = '/home/justas/.pyenv/shims/python2'
        let g:python3_host_prog = '/home/justas/.pyenv/shims/python3'
    endif

    colorscheme Tomorrow-Night-Bright
    " termguicolors do not work in terminal.app
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
