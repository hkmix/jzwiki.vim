" Custom help wiki syntax settings, same as help.vim.

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1
let b:undo_ftplugin = 'setl fo< number< ts< sw< sts< isk< cole< cocu<'

let s:cpo_save = &cpo
set cpo&vim

setlocal formatoptions+=tcroql
setlocal nonumber ts=2 sw=0 sts=-1 isk=@,33,45,48-58,_,192-255
if has('conceal')
  setlocal cole=2 cocu=nc
endif

" Set all the valid variables if unset.
let g:jzwiki_no_commands = get(g:, 'jzwiki_no_commands', 0)
let g:jzwiki_root_file = get(g:, 'jzwiki_root_file', '.wiki_root')
let g:jzwiki_max_depth = get(g:, 'jzwiki_max_depth', -1)

" Detect root directory if it exists.
function! jzwiki#detect_root()
  let l:root_dir = getcwd()
  if !empty(g:jzwiki_root_file)
    let l:depth = g:jzwiki_max_depth
    let l:maybe_root = l:root_dir
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

function! jzwiki#create_help_tags() abort
  " It's more efficient to cache this but we want to respect the user changing
  " the g: variables after starting vim, so we should just retrieve it every
  " time.
  let l:root_dir = jzwiki#detect_root()
  echo 'Generating tags in: ' . l:root_dir
  execute 'helptags ' . l:root_dir
endfunction

command! JzwikiHelpTags call jzwiki#create_help_tags()

if !g:jzwiki_nomappings
  nnoremap <silent> <buffer> <Leader>ht :JzwikiHelpTags<CR>
  nnoremap <silent> <buffer> <Leader>hl 79i-<Esc>
  nnoremap <silent> <buffer> <Leader>hL i<Bar>index<Bar><CR><CR><CR><CR><Esc>79i-<Esc>o vim:ft=jzwiki:<Esc>3k
  nnoremap <silent> <buffer> <Leader>hC T<Bar>"zyt<Bar>:sp <C-R>z.txt<CR>i<Bar>index<Bar><CR><CR>*<C-R>z*<CR><CR><CR><CR><Esc>79i-<Esc>o vim:ft=jzwiki:<Esc>3k:set filetype=jzwiki<CR>
  nnoremap <silent> <buffer> <Leader>tt mz:s/\[ \]/[X]/eI<CR>:s/\[x\]/[ ]/eI<CR>:s/\[X\]/[x]/eI<CR>`z
endif

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ft=vim
