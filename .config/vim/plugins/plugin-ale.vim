let g:ale_linters = {
      \ 'ruby': ['rubocop'],
      \ 'python': ['flake8', 'pyls', 'mypy'],
      \ }

let g:ale_fixers = {
      \ 'python': ['autopep8', 'black', 'isort'],
      \ }

let g:ale_python_flake8_options = "--ignore=E501"

let g:aleJ_linters_explicit = 1
let g:airline#extensions#ale#enebled = 1

nmap <silent> <S-f> <Plug>(ale_fix)
