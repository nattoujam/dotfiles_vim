" うまく環境構築できなかった場合は、以下のコマンドを実行
" :call dein#recache_runtimepath()

" 起動時Replaceモードになるのを防ぐ
set t_u7=
set t_RV=

" no sound
set visualbell t_vb=

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
set clipboard=unnamedplus

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
if &compatible
  set nocompatible
endif

" # dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.cache/dein')

" # dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " # dein.toml, dein_layz.tomlファイルのディレクトリをセット
    let s:toml_dir = expand('~/.config/vim')

  " # 起動時に読み込むプラグイン群
    call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " # 遅延読み込みしたいプラグイン群
    call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
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

" ----- .vimrc の分割先を参照 -----
set runtimepath+=~/.config/vim
runtime! init/*.vim
runtime! plugins/*.vim
