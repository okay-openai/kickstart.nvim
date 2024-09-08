set nocompatible

" GENERAL OPTIONS {{{
let mapleader="\\"
let maplocalleader="]"

" Short Messages - Don't give me that file already being edited nonsense
set shortmess+=A

" all mouse functionality enabled
set mouse=a

" don't show mode in
set noshowmode

" Switch between buffers without saving the buffer first
set hidden
set breakindent 

" search options
set ignorecase
set smartcase

" show sign column always
set number
set signcolumn
set cursorline

" update time and timeout settings
set updatetime=250
set timeoutlen=300

set inccommand=split
set scrolloff=30

"itch that bufferscratching itch with jumping around.
set switchbuf=useopen
" Search settings
set showmatch
set incsearch

" Tabbing settings
set autoindent
set expandtab
set shiftwidth=2
set smarttab
set softtabstop=4
set tabstop=2
" wild menu and menu completion
set wildmenu
set completeopt=menu,menuone,preview,noinsert
" default to using marker folds
set foldmethod=marker
" show me the command!
set showcmd

set splitright

set path+=**
set wildignore+=**/node_modules/**
" set wildignore+=**/python*/**
set wildignore+=**/site-packages/**
set wildignore+=**/build/**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/db/*

" persistent undo across vim sessions
set swapfile
set undofile

silent !test -d ~/.vimrc/.swp || mkdir -p ~/.vim/.{undo,backup,swp}

syntax on 
" }}}

" MAPPINGS {{{
map <Leader>cc :source ~/.config/nvim/init.lua<CR>
inoremap <c-c> <esc>

" delete mark using dmX where X is the mark
nnoremap dm :execute 'delmarks '.nr2char(getchar())<cr>


" EXTRA G COMMANDS
" open file through xdg-open, use on images and the like
nmap gr :exec ":silent !open ".expand("<cWORD>")

" Set gp to select the last pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" trim ending whitespace (silently)
map <silent> <Leader>tr :silent! %s/\s\+$//g

" quick fix and tag select shortcuts
nmap [b :bp
nmap ]b :bn
nmap [g :cp
nmap ]g :cn
nmap [t :tp
nmap ]t :tn

" swap two words next to each other, like xp but word wise
" from http://vim.wikia.com/wiki/Swapping_characters,_words_and_lines
nnoremap <silent> xw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

" }}}
" vim: foldmethod=marker
