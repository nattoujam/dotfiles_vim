" 時計表示
let s:time = ""
function! Updater(timer)
  let s:time = strftime("%m/%d(%a) %H:%M:%S")
  call lightline#update()
endfunction

let timer = timer_start(1000, function("Updater"), { "repeat" : -1 })

set laststatus=2
set showtabline=2
" set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P])]}>
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \        'left': [['mode', 'paste'], ['gitbranch', 'filename', 'readonly', 'modified']],
  \       'right': [['time'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
  \ },
  \ 'tabline': {
  \       'right': [['mode']]
  \ },
  \ 'tab': {
  \      'active': [ 'filename', 'modified' ],
  \    'inactive': [ 'filename', 'modified' ]
  \ },
  \ 'component': {
  \       'hello': 'Hello world!'
  \ }
  \ }

" function
let g:lightline.component_function = {
  \    'gitbranch': 'gitbranch#name',
  \         'time': 'CurrentTime',
  \     'modefird': 'LightlineModified',
  \     'readonly': 'LightlineReadonly',
  \     'filename': 'LightlineFilename',
  \   'fileformat': 'LightlineFilefomat',
  \     'filetype': 'LightlineFiletype',
  \ 'fileencoding': 'LightlineFileencoding',
  \         'mode': 'LightlineMode'
  \ }

function! CurrentTime()
  return winwidth(0) > 70 ? s:time : ''
endfunction

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return &ft == 'unite' ? 'Unite' :
       \ &ft == 'vimfiler' ? 'VimFiler' :
       \ &ft == 'vimshell' ? 'VimShell' :
       \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" function (tab)
let g:lightline.tab_component_function = {
  \ 'filename': 'LightlineTabFilename',
  \ 'modified': 'lightline#tab#modified',
  \ 'readonly': 'lightline#tab#readonly',
  \ 'tabnum': 'lightline#tab#tabnum' 
  \ }

function! LightlineTabFilename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = pathshorten(expand('#'.buflist[winnr - 1].':f'))
  return _ !=# '' ? _ : '[No Name]'
endfunction
