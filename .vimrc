call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'rhysd/vim-crystal'
Plug 'haya14busa/incsearch.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'brookhong/ag.vim'
Plug 'scrooloose/nerdtree'

call plug#end()

"gitgutter update time
set updatetime=100

"show file path in window's title
set title

syntax enable
set noswapfile
set nowrap

"line length limit line
set colorcolumn=85
highlight ColorColumn ctermbg=238

"Line number
set number
set relativenumber

"Line and column no. in bottom right
set ruler

"Be smart when using indents
set smarttab
set autoindent
set smartindent

"1 tab == 2 spaces
set tabstop=2
set shiftwidth=2

"Use spaces instead of tabs
set expandtab

"Ignore case when searching
set ignorecase

"Remove u for lowercase binding, causes missclicks
vmap u <Nop>

"NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

function! ToggleNERDTreeFind()
    if g:NERDTree.IsOpen()
        execute ':NERDTreeClose'
    endif
    execute ':NERDTreeFind'
endfunction

map <Leader>tt <ESC>:NERDTreeToggle<CR>
map <Leader>tr <ESC>:call ToggleNERDTreeFind()<CR>

"Reorder tabs
noremap <Leader><Left>  :tabmove -1<CR>
noremap <Leader><Right> :tabmove +1<CR>

"Save and close bindings
map <C-x> <ESC>:q<CR>
map <C-s> <ESC>:w<CR>
imap <C-s> <ESC>:w<CR>

"Find current word in project
map <F6> <ESC>:Ag <cword><CR>

"Gitgutter refresh all signs
"use after commits 
map <F7> <ESC>:GitGutterAll<CR>

"Reload .vimrc
map <F8> <ESC>:so $MYVIMRC<CR>

"insearch bindings
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

filetype plugin on
