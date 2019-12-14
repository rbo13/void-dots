" Neovim scripts by rbo13
"========================

" Load vim-plug automatically if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | nested source $MYVIMRC
endif

" Load runtime path
set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=/usr/local/opt/fzf
let &packpath = &runtimepath

" Load `vim-plug`
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-buftabline'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ggreer/the_silver_searcher'
Plug 'zivyangll/git-blame.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'rust-lang/rust.vim'
Plug 'sebdah/vim-delve'

" Themes
" Plug 'cormacrelf/vim-colors-github'
Plug 'altercation/vim-colors-solarized'
" End installation of plugins

" Initialize plugin system
call plug#end()
" End Plugin Manager

" ==============================================================================
"    ______                           __   _____      __  __  _                 
"   / ____/__  ____  ___  _________ _/ /  / ___/___  / /_/ /_(_)___  ____ ______
"  / / __/ _ \/ __ \/ _ \/ ___/ __ `/ /   \__ \/ _ \/ __/ __/ / __ \/ __ `/ ___/
" / /_/ /  __/ / / /  __/ /  / /_/ / /   ___/ /  __/ /_/ /_/ / / / / /_/ (__  ) 
" \____/\___/_/ /_/\___/_/   \__,_/_/   /____/\___/\__/\__/_/_/ /_/\__, /____/  
"                                                                /____/        
" ==============================================================================

" Optimal terminal color
set termguicolors
set t_Co=256

" Load Theme
set background=dark
colorscheme solarized

" Enable syntax
syntax on

if has("autocmd")
    filetype plugin indent on
    "           │     │    └──── Enable file type detection.
    "           │     └───────── Enable loading of indent file.
    "           └─────────────── Enable loading of plugin files.
endif

filetype on

" Make Vim more useful
set nocompatible

set tabstop=2                  " ┐
set softtabstop=2              " │ Set global <TAB> settings.
set shiftwidth=2							 " │
set expandtab                  " ┘
set smartindent
set autoindent

set visualbell                 " ┐
set noerrorbells               " │ Disable beeping and window flashing
set t_vb=                      " ┘ https://vim.wikia.com/wiki/Disable_beeping

set smartcase                  " Override `ignorecase` option
                               " if the search pattern contains
                               " uppercase characters.

set report=0                   " Report the number of lines changed.
set ruler                      " Show cursor position<Paste>

set nostartofline              " Kept the cursor on the same column.

set hlsearch                   " Enable search highlighting.
set ignorecase                 " Ignore case in search patterns.

set incsearch                  " Highlight search pattern
                               " as it is being typed.

set listchars=tab:»·             " ┐
set listchars+=trail:·           " │ Use custom symbols to
set listchars+=eol:↴             " │ represent invisible characters.
set listchars+=nbsp:_            " ┘

" disable showmode, since we are using lightline
set noshowmode

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
set completeopt-=preview

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
" set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Use <Space> to search
map <space> /

" Add the g flag to search/replace by default
set gdefault

" tabline enable
set hidden

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Set wildmode
set wildmode=list:longest,full

" Don’t add empty newlines at the end of files
set binary
set noeol

" Set line numbers
set number

set backupdir=~/.vim/backups   " Set directory for backup files.
set directory=~/.vim/swaps     " Set directory for .swp files.

" Prevent arrow keys on normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" move up/down consider wrapped lines
nnoremap j gj
nnoremap k gk

nnoremap <C-D> :bnext<CR>
nnoremap <C-S> :bprev<CR>

" ============================
"     ______          __
"    / ____/___  ____/ /
"   / __/ / __ \/ __  / 
"  / /___/ / / / /_/ /  
" /_____/_/ /_/\__,_/   
" ============================

" ---------------------------------------------------------
let NERDTreeShowHidden=1

" Language specific settings

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_snippet_engine = "neosnippet"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


" Rust
let g:rustfmt_autosave = 1


" Ale
let g:ale_linters = {
\   'go': ['gopls', 'golint', 'go vet'],
\}

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'


" End language specific settings


" ----------------------------------------------------------------------
" | Helper Functions                                                   |
" ----------------------------------------------------------------------
function! StripTrailingWhitespaces()

    " Save last search and cursor position.

    let searchHistory = @/
    let cursorLine = line(".")
    let cursorColumn = col(".")

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Strip trailing whitespaces.

    %s/\s\+$//e

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Restore previous search history and cursor position.

    let @/ = searchHistory
    call cursor(cursorLine, cursorColumn)


endfunction

function! ToggleRelativeLineNumbers()

    if ( &relativenumber == 1 )
        set number
    else
        set relativenumber
    endif

endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" End Helper Functions
" ----------------------------------------------------------------------

" Shortcuts/Map Leader
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Change mapleader
let mapleader=","
" NERDTree
nmap <leader>t :NERDTreeToggle<cr>
" Clear highlight search
map <leader>cs :nohlsearch<cr>
" Close current buffer
map <leader>w :bd<cr>
" [,* ] Search and replace the word under the cursor.
nmap <leader>* :%s/\<<C-r><C-w>\>//<Left>
" [,ss] Strip trailing whitespace.
nmap <leader>ss :call StripTrailingWhitespaces()<CR>
" [,cc] Toggle code comments.
" https://github.com/tomtom/tcomment_vim
map <leader>cc :TComment<CR>

" [,w] Close current buffer
map <leader>w :bdelete<CR>

"----------------------------------------------
" Splits
"----------------------------------------------
" Create horizontal splits below the current window
set splitbelow
set splitright

" Creating splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Closing splits
nnoremap <leader>q :close<cr>
" End Splits

" Make `Tab` autocomplete.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Prevent `Enter` to create new line when selecting from omni-completion
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" Keep a menu item always highlighted
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"----------------------------------------------
" Plugin: 'junegunn/fzf.vim'
"----------------------------------------------
nnoremap <c-p> :FZF<cr>


" End Map leader

autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" Status line for `lightline`
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

let g:lightline = {}

let g:lightline.colorscheme = 'wombat'

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 'right': [[ 'fileformat', 'fileencoding', 'percent', 'filetype', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]],
			\										 'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]
			\	}

let g:lightline.component_function = {
      \     'gitbranch': 'fugitive#head',
			\			'cocstatus': 'coc#status',
			\			'currentfunction': 'CocCurrentFunction'
      \ }
" End status line

"----------------------------------------------
" Plugin: 'ctrlpvim/ctrlp.vim'
"----------------------------------------------
" Note: We are not using CtrlP much in this configuration. But vim-go depend on
" it to run GoDecls(Dir).

" Disable the CtrlP mapping, since we want to use FZF instead for <c-p>.
let g:ctrlp_map = ''

"----------------------------------------------
" Plugin: Ag
"----------------------------------------------
" Open Ag
nnoremap <leader>a :Ag<space>

" Mappings
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>gd <Plug>(go-def)
au FileType go nmap gc <Plug>(go-coverage-toggle)
au FileType go nmap gt <Plug>(go-test)
au FileType go nmap gf <Plug>(go-test-func)
au FileType go nmap gr <Plug>(go-run)
