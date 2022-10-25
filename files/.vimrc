set number relativenumber

set nocompatible

filetype on
filetype plugin on
filetype indent on

syntax on

set cursorline

set shiftwidth=4
set tabstop=4
set expandtab

set nobackup

set nowrap

set incsearch
set showmatch
set hlsearch

set showcmd

set history=1000

set wildmenu
set wildmode=list:longest
set wildignore=*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img

call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'
    Plug 'preservim/nerdtree'
    Plug 'morhetz/gruvbox'
    Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme gruvbox
set bg=dark

