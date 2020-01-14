" Help wiki syntax file, based on help.vim.

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match helpSectionDelim	"^===.*===$"
syn match helpSectionDelim	"^---.*--$"
if has("conceal")
  syn region helpExample	matchgroup=helpIgnore start=" >$" start="^>$" end="^[^ \t]"me=e-1 end="^<" concealends
else
  syn region helpExample	matchgroup=helpIgnore start=" >$" start="^>$" end="^[^ \t]"me=e-1 end="^<"
endif
if has("ebcdic")
  syn match helpHyperTextJump	"\\\@<!|[^"*|]\+|" contains=helpBar
  syn match helpHyperTextEntry	"\*[^"*|]\+\*\s"he=e-1 contains=helpStar
  syn match helpHyperTextEntry	"\*[^"*|]\+\*$" contains=helpStar
else
  syn match helpHyperTextJump	"\\\@<!|[#-)!+-~]\+|" contains=helpBar
  syn match helpHyperTextEntry	"\*[#-)!+-~]\+\*\s"he=e-1 contains=helpStar
  syn match helpHyperTextEntry	"\*[#-)!+-~]\+\*$" contains=helpStar
endif
if has("conceal")
  syn region helpExample	matchgroup=helpIgnore start=" >$" start="^>$" end="^[^ \t]"me=e-1 end="^<" concealends
else
  syn region helpExample	matchgroup=helpIgnore start=" >$" start="^>$" end="^[^ \t]"me=e-1 end="^<"
endif
if has("conceal")
  syn match helpBar		contained "|" conceal
  syn match helpBacktick	contained "`" conceal
  syn match helpStar		contained "\*" conceal
  syn match helpBraceL		contained "{" conceal
  syn match helpBraceR		contained "}" conceal
else
  syn match helpBar		contained "|"
  syn match helpBacktick	contained "`"
  syn match helpStar		contained "\*"
  syn match helpBraceL		contained "{"
  syn match helpBraceR		contained "}"
endif
syn match helpNormal		"|.*====*|"
syn match helpNormal		"|||"
syn match helpModeline		"vim:.*"
syn match helpOption		"'[a-z]\{2,\}'"
syn match helpOption		"'t_..'"
syn match helpCommand		"`[^`]\+`"hs=s+1,he=e-1 contains=helpBacktick
syn match helpHeader		"\s*\zs.\{-}\ze\s\=\~$" nextgroup=helpIgnore
syn match helpGraphic		".* \ze`$" nextgroup=helpIgnore
if has("conceal")
  syn match helpIgnore		"." contained conceal
else
  syn match helpIgnore		"." contained
endif
syn keyword helpNote		note Note NOTE note: Note: NOTE: Notes Notes:
syn match helpSpecial		"\<N\>"
syn match helpSpecial		"\<N\.$"me=e-1
syn match helpSpecial		"\<N\.\s"me=e-2
syn match helpSpecial		"(N\>"ms=s+1
syn match helpSpecial		"\[N]"
" avoid highlighting N  N in help.txt
syn match helpSpecial		"N  N"he=s+1
syn match helpSpecial		"Nth"me=e-2
syn match helpSpecial		"N-1"me=e-2
syn match helpSpecial		"{[-a-zA-Z0-9'"*+/:%#=[\]<>., ]\+}" contains=helpBraceL,helpBraceR
syn match helpSpecial		"\s\[[-a-z^A-Z0-9_]\{2,}]"ms=s+1
syn match helpSpecial		"<[-a-zA-Z0-9_ ]\+>"
syn match helpNormal		"<---*>"

" Highlight group items in their own color.
syn match helpCheckboxT		"\[[Xx]\]"
syn match helpCheckboxF		"\[[^Xx]\]"
syn match helpNavigation	"\([Pp]rev\|[Nn]ext\)[\t:]"
syn match helpStatus		"[Ss]tatus[\t:]"
syn match helpError		"[Ee]rror[\t:]"
syn match helpTodo		"[Tt]odo[\t:]"

syn sync minlines=40


" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link helpIgnore		Ignore
hi def link helpHyperTextJump	Subtitle
hi def link helpBar		Ignore
hi def link helpBacktick	Ignore
hi def link helpStar		Ignore
hi def link helpHyperTextEntry	String
hi def link helpHeader		PreProc
hi def link helpSectionDelim	PreProc
hi def link helpVim		Identifier
hi def link helpModeline	Comment
hi def link helpCommand		Comment
hi def link helpExample		Comment
hi def link helpOption		Type
hi def link helpNotVi		Special
hi def link helpSpecial		Special
hi def link helpNote		Todo
hi def link Subtitle		Identifier

hi def link helpCheckboxT	Comment
hi def link helpCheckboxF	Type
hi def link helpNavigation	PreProc
hi def link helpStatus		PreProc
hi def link helpError		Error
hi def link helpTodo		Todo
hi def link helpURL		String

let b:current_syntax = "jzwiki"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8 sw=2
