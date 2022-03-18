" Custom help wiki syntax settings, same as help.vim.

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = "setl fo< cole< cocu<"

setlocal formatoptions+=tcroql
setlocal nonumber ts=2 sw=0 sts=-1 isk=@,33,45,48-58,_,192-255
if has("conceal")
  setlocal cole=2 cocu=nc
endif

nnoremap <silent> <buffer> <Leader>ht :helptags ./ <Bar> echo "Generated tags."<CR>
nnoremap <silent> <buffer> <Leader>hl 79i-<Esc>
nnoremap <silent> <buffer> <Leader>hL i<Bar>index<Bar><CR><CR><CR><CR><Esc>79i-<Esc>o vim:ft=jzwiki:<Esc>3k
nnoremap <silent> <buffer> <Leader>hC T<Bar>"zyt<Bar>:sp <C-R>z.txt<CR>i<Bar>index<Bar><CR><CR>*<C-R>z*<CR><CR><CR><CR><Esc>79i-<Esc>o vim:ft=jzwiki:<Esc>3k:set filetype=jzwiki<CR>
nnoremap <silent> <buffer> <Leader>tt mz:s/\[ \]/[X]/eI<CR>:s/\[x\]/[ ]/eI<CR>:s/\[X\]/[x]/eI<CR>`z

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ft=vim
