" いい感じに行末/行頭を削除する
" author: qpwakabe

inoremap <silent> <expr> <BS> <SID>DeleteLeft(getcurpos())
inoremap <silent> <expr> <Delete> <SID>DeleteRight(getcurpos())

function s:DeleteLeft(curpos)
  let l:left = strpart(getline(a:curpos[1]), 0, a:curpos[2] - 1)
  if (l:left =~ "^  *$")
    if (a:curpos[1] > 1)
      let l:current_indent = strlen(l:left)
      let l:above_indent = strlen(matchstr(getline(a:curpos[1] - 1), '^ *'))
      redir => l:sts
      silent set softtabstop?
      redir END
      let l:softtabstop = matchstr(l:sts, '\d')
      if (l:softtabstop == 0)
        let l:softtabstop = 1
      endif
      if (l:current_indent > l:above_indent)
        let l:spaces = l:current_indent - l:above_indent
        if (l:spaces >= l:softtabstop)
          let l:spaces =  l:spaces / l:softtabstop
        endif
        return repeat("\<C-h>", l:spaces)
      endif
      return "\<C-w>"
    endif
  endif
  return "\<BS>"
endfunction

function s:DeleteRight(curpos)
  let l:right = strpart(getline(a:curpos[1]), a:curpos[2] - 1)
  if (l:right == '')
    let l:below_indent = strlen(matchstr(getline(a:curpos[1] + 1), '^ *'))
    return repeat("\<Delete>", 1 + l:below_indent)
  else
    return "\<Delete>"
  endif
endfunction
