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

"-------------------------------------------Core--------------------------------
"show file path in window's title
set title
syntax enable
set noswapfile
set nowrap
set clipboard=unnamedplus

filetype indent on
"-----------------------------------------Styling--------------------------------
""tell vim what colour b/g is
"set bg=dark

""comment colour
"highlight Comment ctermfg=green

""visual selection colour
"highlight Visual term=reverse ctermbg=237 guibg=#3a3a3a

""colo simpleblack
"""inactive tab colour
""hi TabLine ctermfg=250
"""selected tab colour
""hi TabLineSel ctermfg=80

""line number colour
"highlight LineNr ctermfg=238

""line length limit line
"highlight ColorColumn ctermbg=233

colo er_default
set colorcolumn=85

set number "linu numer

"Line and column no. in bottom right
set ruler
"------------------------------------------Abs-----------------------------------
ab glf !git log -p %
ab gll !git log -L 1,4:%
"------------------------------------------Misc----------------------------------
set expandtab "spaces insetad of tabs
set smarttab "correct char when pressing tab

set shiftwidth=4 "autoindentation depth
set tabstop=4 "how many spaces a tab takes

set ai "Auto indent
set si "Smart indent

"Ignore case when searching
set ignorecase
"---------------------------------------Bindings----------------------------------
"Remove u for lowercase binding, causes missclicks
vmap u <Nop>

"Reorder tabs
noremap <Leader><Left>  :tabmove -1<CR>
noremap <Leader><Right> :tabmove +1<CR>

"Save and close
map <C-x> <ESC>:q<CR>
map <C-s> <ESC>:w<CR>
imap <C-s> <ESC>:w<CR>

"Reload .vimrc
map <F8> <ESC>:so $MYVIMRC<CR>
"-------------------------------------Extensions---------------------------------
"gitgutter update time
set updatetime=100

"ctrlp
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

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
map <F4> <ESC>:tabnew<CR><ESC>:Ag -Fi "

"Find current word in project - open new tab beforehand
function! SearchProject()
  let var = expand('<cword>')
  execute ':tabnew'
  execute ':Ag -Fi "' . var . '"'
endfunction

"map <F6> <ESC>:Ag <cword><CR>
map <F6> <ESC>:call SearchProject()<CR>

"Gitgutter refresh all signs - use after commits 
map <F7> <ESC>:GitGutterAll<CR>

"insearch bindings
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
