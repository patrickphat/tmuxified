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
set relativenumber
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

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
Plugin 'tomtom/tcomment_vim'
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
Plugin 'itchyny/vim-gitbranch'
Plugin 'cocopon/iceberg.vim'
call vundle#end()

" Show git branch on lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'colorscheme': 'iceberg'
      \ }
colorscheme iceberg 
set bg=dark

" Commentary
nnoremap <silent> <Leader>/ :TComment<CR>
vnoremap <silent> <Leader>/ :TComment<CR>
autocmd FileType py setlocal commentstring="# %s"

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
