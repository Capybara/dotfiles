function! VimrcFolds()
  let thisline = getline(v:lnum)
  if match(thisline, '^"""') >= 0
    return ">3"
  elseif match(thisline, '^""') >= 0
    return ">2"
  elseif match(thisline, '^"') >= 0
    return ">1"
  else
    return "="
  endif
endfunction
setlocal foldmethod=expr
setlocal foldtext=VimrcFolds()

function! VimrcFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction
setlocal foldtext=VimrcFoldText()
