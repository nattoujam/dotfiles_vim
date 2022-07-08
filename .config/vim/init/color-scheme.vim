syntax enable

" set t_Co=256
" tmuxで色を付けるよう
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:cpp_class_scope_highlight = 1                                                

" カラースキーマの指定
colorscheme tender
set t_ut=
" hi Normal guibg=black
" highlight Visual ctermbg=22 guibg=#2e8b57
highlight Search term=reverse cterm=bold ctermfg=15 ctermbg=242 gui=bold guifg=#ffffff guibg=#666666
