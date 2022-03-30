" Custom help wiki syntax settings, based on help.vim.

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1
let b:undo_ftplugin = 'setl fo< number< ts< sw< sts< isk< cole< cocu<'

let s:cpo_save = &cpo
set cpo&vim

setlocal formatoptions+=tcroql
setlocal nonumber ts=2 sw=0 sts=-1 isk=@,33,35,45,48-58,_,192-255
if has('conceal')
  setlocal cole=2 cocu=nc
endif

" Set all the valid variables if unset.
let g:jzwiki_no_mappings = get(g:, 'jzwiki_no_mappings', 0)
let g:jzwiki_modeline = get(g:, 'jzwiki_modeline', ' vim:ft=jzwiki:')
let g:jzwiki_root_file = get(g:, 'jzwiki_root_file', '.wiki_root')
let g:jzwiki_max_depth = get(g:, 'jzwiki_max_depth', -1)
let g:jzwiki_index_tag = get(g:, 'jzwiki_index_tag', '')
let g:jzwiki_toggle_caps = get(g:, 'jzwiki_toggle_caps', 0)

nnoremap <silent> <script> <Plug>JzwikiHelpTags :call jzwiki#create_help_tags()<CR>
nnoremap <silent> <script> <Plug>JzwikiHLine :call jzwiki#horizontal_line()<CR>
nnoremap <silent> <script> <Plug>JzwikiModeline :call jzwiki#modeline()<CR>
nnoremap <silent> <script> <Plug>JzwikiCreateFile :call jzwiki#create_file()<CR>
nnoremap <silent> <script> <Plug>JzwikiCreateFileSplit :split <Bar> call jzwiki#create_file()<CR>
nnoremap <silent> <script> <Plug>JzwikiCreateFileVSplit :vsplit <Bar> call jzwiki#create_file()<CR>
nnoremap <silent> <script> <Plug>JzwikiCreateFileTab <C-w>s<C-w>T:call jzwiki#create_file()<CR>
nnoremap <silent> <script> <Plug>JzwikiToggleCheckbox :call jzwiki#toggle_checkbox()<CR>

if !g:jzwiki_no_mappings
  nmap <silent> <buffer> <Leader>ht <Plug>JzwikiHelpTags
  nmap <silent> <buffer> <Leader>hl <Plug>JzwikiHLine
  nmap <silent> <buffer> <Leader>hL <Plug>JzwikiModeline
  nmap <silent> <buffer> <Leader>hC <Plug>JzwikiCreateFile
  nmap <silent> <buffer> <Leader>hcs <Plug>JzwikiCreateFileSplit
  nmap <silent> <buffer> <Leader>hcv <Plug>JzwikiCreateFileVSplit
  nmap <silent> <buffer> <Leader>hct <Plug>JzwikiCreateFileTab
  nmap <silent> <buffer> <Leader>tt <Plug>JzwikiToggleCheckbox
endif

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ft=vim:et:ts=2:sw=0:sts=-1
