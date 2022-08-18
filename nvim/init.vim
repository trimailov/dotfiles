" ==== Plug settings ====

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged')

" Git gutter
Plug 'airblade/vim-gitgutter'
" Fugitive - git for vim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
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
let g:fzf_layout = { 'down': '40%' }

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
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

Plug 'ekalinin/Dockerfile.vim'

" typescript
Plug 'leafgarland/typescript-vim'

" nimlang support
Plug 'zah/nim.vim'

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

" JS plugins
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'chriskempson/base16-vim'

Plug 'elixir-editors/vim-elixir'

Plug 'neovim/nvim-lspconfig'

Plug 'github/copilot.vim'

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

" case insensitive search
" set ignorecase

" no swapfile
set noswapfile

" " show invisible characters
" set list
" set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" turn on syntax highlighting
syntax on

" " settings for coc.nvim
"
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
"
" " " GoTo code navigation.
" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
"
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" ====================

" ==== KEY REMAPS ====
" alias some fugitive.vim commands
cnoreabbrev gc Git commit -v
cnoreabbrev gca Git commit -v -a
cnoreabbrev gd Gdiff
" git status
cnoreabbrev gst Git
cnoreabbrev gw Gwrite
cnoreabbrev gr Gread
cnoreabbrev gb Git blame

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
    set guifont=Menlo:h13

    " set color for macvim (https://stackoverflow.com/a/21114248)
    let colors_name = 'Tomorrow-Night-Bright'
    let macvim_skip_colorscheme=1
    colorscheme Tomorrow-Night-Bright
endif

lua << EOF
-- read logs with `:lua vim.cmd('e'..vim.lsp.get_log_path())`
-- vim.lsp.set_log_level("debug")
local nvim_lsp = require('lspconfig')

-- Automatically start coq
vim.g.coq_settings = { auto_start = 'shut-up' }
local coq = require('coq')

require("coq_3p") {
  { src = "nvimlua", short_name = "nLUA" },
  { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
