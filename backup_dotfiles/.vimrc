" general config"
set backspace=indent,eol,start
syntax on

set nocompatible 
set wildmenu
set mouse-=a
set tabstop=4
set shiftwidth=4
set shell=/bin/bash
set clipboard=unnamedplus " using system clipboard
set hlsearch
set incsearch
set linebreak
set foldmethod=indent
set foldlevel=10
set ignorecase
set smartcase
set lazyredraw
set wildmode=longest,full
set pastetoggle=<F2>
set splitright
set splitbelow
set laststatus=2

nnoremap <SPACE> <Nop>
let mapleader=" " " mapleader

if !has('gui_running')
  set t_Co=256
endif

" set the runtime path to include Vundle and fzf
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

" for plugin
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'preservim/nerdtree'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'yosiat/oceanic-next-vim'
Plugin 'tpope/vim-commentary'
Plugin 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
call vundle#end()

let g:gruvbox_contrast_dark = "medium"
set bg=dark
autocmd vimenter * ++nested colorscheme gruvbox

" Commentary
nnoremap <silent> <Leader>/ :Commentary<CR>
vnoremap <silent> <Leader>/ :Commentary<CR>

" for fzf
nnoremap <leader>f :FZF<CR>
let g:fzf_preview_window = ""
let g:fzf_preview_window = "right:60%"
let $FZF_DEFAULT_COMMAND = "rg --files --hidden"

" for Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader><Leader> :ZoomToggle<CR>

" for vim-pydocstring
let g:pydocstring_doq_path="/mnt/ai_filestore/home/patrick/app/miniconda3/bin/doq"
let g:pydocstring_formatter = 'google'

" for COC VIM
let g:coc_disable_startup_warning = 1   

