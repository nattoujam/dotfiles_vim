" うまく環境構築できなかった場合は、以下のコマンドを実行
" :call dein#recache_runtimepath()

" 起動時Replaceモードになるのを防ぐ
set t_u7=
set t_RV=

" no sound
set visualbell t_vb=
set belloff=all

" vim doc の優先順位
set helplang=ja,en

" -----file type------
" rosのlaunchファイル
autocmd BufNewFile,BufRead *.launch set filetype=xml

" -----key config-----
"  {{{
nnoremap s <C-w>

" HOME and END
nnoremap <S-l> <S-$>
vnoremap <S-l> <S-$>
nnoremap <S-h> <S-^>
vnoremap <S-h> <S-^>

" move Word unit
nnoremap <C-l> e
vnoremap <C-l> e
nnoremap <C-h> b
vnoremap <C-h> b
nnoremap <C-L> E
vnoremap <C-L> E
nnoremap <C-H> B
vnoremap <C-H> B

" move window unit
nnoremap <C-k> <C-u>
vnoremap <C-k> <C-u>
nnoremap <C-j> <C-d> 
vnoremap <C-j> <C-d> 

nnoremap <Right> gt
nnoremap <Left> gT

tnoremap <C-n> <C-W>N

nnoremap Q <Nop>

" 直近の検索ハイライトを解除する
nnoremap <C-e> :noh<CR>
" }}}

set nobackup
set autoread
set showcmd
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set nowrap "折り返ししない
set foldmethod=marker

" --- Encoding ---
set fenc=utf-8
set encoding=utf-8
set fileformat=unix

" clipboard
set clipboard=unnamed, autoselect

"折り返ししないで横スクロール
set sidescroll=2    "スクロール幅
set sidescrolloff=8 

" 見た目
set cmdheight=2
set title
set number
set smartindent
" set cursorline
"hi clear Cursorline
"set showmatch

" 検索
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

" filer
filetype plugin on

"" 自動的に閉じ括弧を補間
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>


" ----------dein----------
"  {{{
"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  " plugin
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Your plugin
  " .vimがいるやつと、つけたらダメなやつがあるので注意
  call dein#add('preservim/nerdtree')
  call dein#add('kana/vim-submode')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('tpope/vim-surround')
  call dein#add('jacoborus/tender')
  call dein#add('nattoujam/kokuban')
  call dein#add('tyru/caw.vim')
  call dein#add('dense-analysis/ale')
  call dein#add('itchyny/lightline.vim')
  call dein#add('itchyny/vim-gitbranch')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimfiler')
  call dein#add('alpertuna/vim-header')

  call dein#end()
  call dein#save_state()
endif
" 文字化けする場合はエンコードの設定をここに入れる。
filetype plugin indent on
syntax enable
" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------
" }}}

" ----------vim-submode----------
"  {{{
call submode#enter_with('term_size', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('term_size', 'n', '', '<C-w><', '<C-w><')
call submode#map('term_size', 'n', '', '>', '<C-w>>')
call submode#map('term_size', 'n', '', '<', '<C-w><')

call submode#enter_with('tab', 'n', '', 'gt', 'gt')
call submode#enter_with('tab', 'n', '', 'gT', 'gT')
call submode#map('tab', 'n', '', 't', 'gt')
call submode#map('tab', 'n', '', 'T', 'gT')
" }}}

" ----------vim-header-----------
"  {{{
let g:header_field_timestamp_format = '%Y %m/%d'
map <F4> :AddHeader<CR>
" }}}

" ----- .vimrc の分割先を参照 -----
set runtimepath+=~/dotfs_vim/.config/vim
runtime! init/*.vim
runtime! plugins/*.vim
runtime! private/*.vim
