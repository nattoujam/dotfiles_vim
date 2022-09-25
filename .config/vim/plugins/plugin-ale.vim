let g:ale_linters = {
      \ 'ruby': ['rubocop'],
      \ 'python': ['flake8', 'pyls', 'mypy'],
      \ }

let g:ale_fixers = {
      \ 'python': ['autopep8', 'isort'],
      \ }

let g:ale_python_flake8_options = "--ignore=E501"
let g:ale_python_autopep8_options = "--max-line-length 120"

let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enebled = 1

" 各ツールで使うpythonのパス固定
" let g:ale_python_flake8_executable = g:python3_host_prog
" let g:ale_python_flake8_options = '-m flake8'
" let g:ale_python_autopep8_executable = g:python3_host_prog
" let g:ale_python_autopep8_options = '-m autopep8'
" let g:ale_python_isort_executable = g:python3_host_prog
" let g:ale_python_isort_options = '-m isort'
" let g:ale_python_pysl_executable = g:python3_host_prog
" let g:ale_python_pysl_options = '-m pysl'
" let g:ale_python_mypy_executable = g:python3_host_prog
" let g:ale_python_mypy_options = '-m mypy'

" nmap <silent> <S-f> <Plug>(ale_fix)
nmap <S-f> <Plug>(ale_fix)
