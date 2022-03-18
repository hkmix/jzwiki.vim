" jz wiki syntax file, based on help.vim.

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

if has("ebcdic")
  syn match jzHyperTextJump	"\\\@<!|[^"*|]\+|" contains=jzBar
  syn match jzHyperTextEntry	"\*[^"*|]\+\*\s"he=e-1 contains=jzStar
  syn match jzHyperTextEntry	"\*[^"*|]\+\*$" contains=jzStar
else
  syn match jzHyperTextJump	"\\\@<!|[#-)!+-~]\+|" contains=jzBar
  syn match jzHyperTextEntry	"\*[#-)!+-~]\+\*\s"he=e-1 contains=jzStar
  syn match jzHyperTextEntry	"\*[#-)!+-~]\+\*$" contains=jzStar
endif

if has("conceal")
  syn match jzBacktick		contained "`" conceal
  syn match jzBar		contained "|" conceal
  syn match jzBraceL		contained "{" conceal
  syn match jzBraceR		contained "}" conceal
  syn match jzFwdSlash		contained "/" conceal
  syn match jzIgnore		contained "." conceal
  syn match jzItalic		contained "/" conceal
  syn match jzStar		contained "\*" conceal
  syn match jzUnderscore	contained "_" conceal
else
  syn match jzBacktick		contained "`"
  syn match jzBar		contained "|"
  syn match jzBraceL		contained "{"
  syn match jzBraceR		contained "}"
  syn match jzFwdSlash		contained "/"
  syn match jzIgnore		contained "."
  syn match jzItalic		contained "/"
  syn match jzStar		contained "\*"
  syn match jzUnderscore	contained "_"
endif
syn match jzModeline		"^\s*vim:.*"
syn match jzModeline		"^\s*-\{3,\}$"
syn region jzCodeBlock		start=/```/ end=/```/
syn match jzCommand		"`[^`]\+`" contains=jzBacktick,jzBacktick
syn match jzItalic		"/[^/]\+/" contains=jzFwdSlash,jzFwdSlash
syn match jzUnderlined		"_[^_]\+_" contains=jzUnderscore,jzUnderscore
syn match jzNote		"\c\(todo\|note\):"
syn match jzBolded		"{[^}]\+}" contains=jzBraceL,jzBraceR
syn match jzSpecial		"<[-a-zA-Z0-9_ ]\+>"

syn match jzSectionDelim	"^#\+.*$"
syn match jzCheckboxT		"\[[Xx-]\]"
syn match jzCheckboxF		"\[[^Xx-]\]"
syn match jzNavigation		"\c\(prev\|next\):"
syn match jzStatus		"\cstatus:"
syn match jzError		"\cerror:"

syn sync minlines=40

" Custom highlights
hi Bold				cterm=bold gui=bold
hi Italic			cterm=italic gui=italic
hi Underline			cterm=underline gui=underline

hi def link Subtitle		Identifier
hi def link jzBacktick		Ignore
hi def link jzBar		Ignore
hi def link jzBolded		Bold
hi def link jzCodeBlock		Comment
hi def link jzCommand		Comment
hi def link jzExample		Comment
hi def link jzHeader		PreProc
hi def link jzHyperTextEntry	helpHyperTextEntry
hi def link jzHyperTextJump	helpHyperTextJump
hi def link jzIgnore		Ignore
hi def link jzItalic		Italic
hi def link jzModeline		Comment
hi def link jzNotVi		Special
hi def link jzNote		Todo
hi def link jzOption		Type
hi def link jzSectionDelim	Special
hi def link jzSpecial		helpVim
hi def link jzStar		Ignore
hi def link jzUnderlined	Underline

hi def link jzCheckboxT		Comment
hi def link jzCheckboxF		Type
hi def link jzNavigation	PreProc
hi def link jzStatus		PreProc
hi def link jzError		Error
hi def link jzTodo		Todo
hi def link jzURL		String

let b:current_syntax = "jzwiki"

" vim: ts=8 sw=2 noet
