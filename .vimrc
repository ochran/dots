"-------------------------------------------Core--------------------------------
"show file path in window's title
set title

syntax enable
set noswapfile
set nowrap
set clipboard=unnamedplus

filetype plugin indent on
"-----------------------------------------Styling--------------------------------
"line length limit line
highlight ColorColumn ctermbg=233
set colorcolumn=85

colo simpleblack

"tell vim what colour b/g is
set bg=dark
"line number colour
highlight LineNr ctermfg=237
"selected tab colour
hi TabLineSel ctermfg=80

"Line number
set number

"Line and column no. in bottom right
set ruler

"------------------------------------------Misc----------------------------------
"Be smart when using indents
set smarttab
"apply current indent to the next line
set autoindent
"reacts to sytanx of code being written
set smartindent

"1 tab == 2 spaces
"Tabstop applies to pressing tab.
set tabstop=2
"shiftwidth applies to =, >, and <.
set shiftwidth=2

""Use spaces instead of tabs
set expandtab

"Ignore case when searching
set ignorecase
"---------------------------------------Bindings----------------------------------

"Remove u for lowercase binding, causes missclicks
vmap u <Nop>

"Reorder tabs
noremap <Leader><Left>  :tabmove -1<CR>
noremap <Leader><Right> :tabmove +1<CR>

"Save and close bindings
map <C-x> <ESC>:q<CR>
map <C-s> <ESC>:w<CR>
imap <C-s> <ESC>:w<CR>

"Reload .vimrc
map <F8> <ESC>:so $MYVIMRC<CR>
"-------------------------------------Extensions---------------------------------
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'rhysd/vim-crystal'
Plug 'haya14busa/incsearch.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'brookhong/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'mkitt/tabline.vim'
Plug 'lucasprag/simpleblack'
call plug#end()

"gitgutter update time
set updatetime=100

"ctrlp - show hidden
let g:ctrlp_show_hidden=1

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

"Open new tab ready for Ag search
map <F4> <ESC>:tabnew<CR><ESC>:Ag -F "

"Find current word in project - open new tab beforehand
function! SearchProject()
  let var = expand('<cword>')
  execute ':tabnew'
  execute ':Ag -F "' . var . '"'
endfunction

"map <F6> <ESC>:Ag <cword><CR>
map <F6> <ESC>:call SearchProject()<CR>

"Gitgutter refresh all signs - use after commits 
map <F7> <ESC>:GitGutterAll<CR>

"insearch bindings
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
