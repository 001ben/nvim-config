function! OpenInSplitIfBufferDirty(...)
  if a:0 == 0 || a:1==''
    let s:command = 'FuzzyOpen'
  else
    let s:command = 'e ' . a:1
  endif

  if line('$') == 1 && getline(1) ==''
    exec ':' . s:command
  else
    exec ':call DWM_New() | ' . s:command
  endif
endfunction
