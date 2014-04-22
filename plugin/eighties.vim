if !exists("g:eighties_enabled")
  let g:eighties_show = 0
endif

function! s:ShowEighties()
  let b:eighties_show = 1
  let &colorcolumn=join(range(81,999),",")
endfunction

function! s:HideEighties()
  let b:eighties_show = 0
  let &colorcolumn = ''
endfunction

function! s:ToggleEighties()
  if b:eighties_show
    call <SID>HideEighties()
  else
    call <SID>ShowEighties()
  endif
endfunction

function! s:EnableShowEighties()
  if exists("b:eighties_show")
    return
  else
    let b:eighties_show = g:eighties_show
    if b:eighties_show
      call <SID>ShowEighties()
    else
      call <SID>HideEighties()
    endif
  endif
endfunction


autocmd BufWinEnter,WinEnter,FileType * call <SID>EnableShowEighties()

command! ShowEighties call <SID>ShowEighties()
command! HideEighties call <SID>HideEighties()
command! ToggleEighties call <SID>ToggleEighties()
