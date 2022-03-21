" Detect root directory if it exists.
function jzwiki#detect_root()
  let l:root_dir = getcwd()
  if !empty(g:jzwiki_root_file)
    let l:depth = g:jzwiki_max_depth
    let l:maybe_root = fnamemodify(l:root_dir, ":p")
    while !empty(l:maybe_root) && l:depth != 0
      if !empty(glob(l:maybe_root . '/' . g:jzwiki_root_file))
        let l:root_dir = l:maybe_root
        break
      endif

      " If next root is same as current one, we are at the root, so abort.
      let l:next_root = fnamemodify(l:maybe_root, ":h")
      if l:next_root == l:maybe_root
        break
      endif

      let l:maybe_root = l:next_root
      let l:depth -= 1
    endwhile
  endif

  return l:root_dir
endfunction

function jzwiki#create_help_tags() abort
  " It's more efficient to cache this but we want to respect the user changing
  " the g: variables after starting vim, so we should just retrieve it every
  " time.
  let l:root_dir = jzwiki#detect_root()
  echo 'Generating tags in: ' . l:root_dir
  execute 'helptags ' . l:root_dir
endfunction

function jzwiki#horizontal_line(...) abort
  " Accepts an optional single argument to define what character to use.
  let l:char = get(a:, 1, '-')

  " Always create 1 less than the textwidth so as to not cause a wrap.
  if &tw == 0
    let l:length = 79
  else
    let l:length = &tw - 1
  endif
  execute 'normal! ' . l:length . 'i' . l:char
endfunction

function jzwiki#modeline() abort
  call jzwiki#horizontal_line()
  execute 'normal! o' . g:jzwiki_modeline
endfunction

function jzwiki#create_index_tag() abort
  if empty(g:jzwiki_index_tag)
    return
  endif

  execute 'normal! a|' . g:jzwiki_index_tag . '|'
endfunction

function jzwiki#new_file_preamble() abort
  call jzwiki#create_index_tag()
  if empty(g:jzwiki_index_tag)
    let l:extra_lines = 2
  else
    let l:extra_lines = 4
  endif
  execute 'normal! ' . l:extra_lines . 'o'
  call jzwiki#modeline()
  execute 'normal! 3k'
endfunction

function jzwiki#create_file() abort
  let l:new_file_path = expand('%:p:h')
  let l:new_file_name = l:new_file_path . '/' . expand('<cexpr>') . '.txt'

  " If file exists, just open it.
  if filereadable(l:new_file_name)
    execute 'edit ' . l:new_file_name
    return
  endif

  " If it doesn't exist, create it and insert the standard boilerplate.
  execute 'edit +set\ ft=jzwiki ' . l:new_file_name
  call jzwiki#new_file_preamble()
endfunction

function jzwiki#toggle_checkbox() abort
  let l:saved_view = winsaveview()
  let l:line = getline('.')
  if l:line =~? '\[x\]'
    s/\[x\]/[ ]/ei
  elseif g:jzwiki_toggle_caps
    s/\[ \]/[X]/ei
  else
    s/\[ \]/[x]/ei
  endif
  call winrestview(l:saved_view)
endfunction

" vim: ft=vim:et:ts=2:sw=0:sts=-1
