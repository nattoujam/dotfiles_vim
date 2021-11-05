let g:ale_linters = {
      \ 'ruby': ['rubocop'],
      \ 'python': ['flake8', 'pyls'],
      \}

let g:ale_python_flake8_options = "--ignore=E501"

let g:aleJ_linters_explicit = 1
let g:airline#extensions#ale#enebled = 1
