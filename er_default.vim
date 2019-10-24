highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=dark
let colors_name = "er_default"

highlight Normal ctermbg=black

"comment colour
highlight Comment ctermfg=green

"visual selection colour
highlight Visual term=reverse ctermbg=237 guibg=#3a3a3a

"line number colour
highlight LineNr ctermfg=238

"line length limit line
highlight ColorColumn ctermbg=233
