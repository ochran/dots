call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'rhysd/vim-crystal'
Plug 'haya14busa/incsearch.vim'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'brookhong/ag.vim'
Plug 'scrooloose/nerdtree'

set updatetime=100 "gitgutter update time

"set laststatus=2
"set statusline+=%F

set title
syntax enable

"line length limit line
set colorcolumn=85
highlight ColorColumn ctermbg=238

"colo monokai
"colo eldar
"colo badwolf

set number
set ruler
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase

"Remove u for lowercase binding, causes missclicks
vmap u <Nop>

"NERDTree
map <Leader>tt <ESC>:NERDTreeToggle<CR>
map <Leader>tr <ESC>:NERDTreeFind<cr>

"Save and close bindings
map <C-x> <ESC>:q<CR>
map <C-s> <ESC>:w<CR>
imap <C-s> <ESC>:w<CR>

"Find current word in project
map <F6> :Ag <cword><CR>

"Gitgutter refresh all signs
"use after commits 
map <F7> :GitGutterAll<CR>

"insearch bindings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
filetype plugin on
call plug#end()

