" jzwiki syntax file, based on help.vim.

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

if has("ebcdic")
  syn match jzHyperTextJump	"\\\@<!|[^"*|]\+|"		contains=jzBar
  syn match jzHyperTextEntry	"\*[^"*|]\+\*\s"he=e-1		contains=jzStar
  syn match jzHyperTextEntry	"\*[^"*|]\+\*$"			contains=jzStar

  " For link entries, hide the root, e.g. *page#abc* shows just "abc".
  if has("conceal")
    syn match jzHyperTextRoot	contained "[^"*|#]\{-}#" transparent conceal
  endif
else
  syn match jzHyperTextJump	"\\\@<!|[#-)!+-~]\+|"		contains=jzBar
  syn match jzHyperTextEntry	"\*[#-)!+-~]\+\*\s"he=e-1	contains=jzStar
  syn match jzHyperTextEntry	"\*[#-)!+-~]\+\*$"		contains=jzStar
endif

if has("conceal")
  syn match jzBacktick		contained "`"	transparent conceal
  syn match jzBar		contained "|"	transparent conceal
  syn match jzBraceL		contained "{"	transparent conceal
  syn match jzBraceR		contained "}"	transparent conceal
  syn match jzFwdSlash		contained "/"	transparent conceal
  syn match jzIgnore		contained "."	transparent conceal
  syn match jzStar		contained "\*"	transparent conceal
  syn match jzTilde		contained "\~"	transparent conceal
  syn match jzUnderscore	contained "\<_"	transparent conceal
  syn match jzUnderscore	contained "_\>"	transparent conceal
else
  syn match jzBacktick		contained "`"	transparent
  syn match jzBar		contained "|"	transparent
  syn match jzBraceL		contained "{"	transparent
  syn match jzBraceR		contained "}"	transparent
  syn match jzFwdSlash		contained "/"	transparent
  syn match jzIgnore		contained "."	transparent
  syn match jzStar		contained "\*"	transparent
  syn match jzTilde		contained "\~"	transparent
  syn match jzUnderscore	contained "_"	transparent
endif

syn region jzCodeBlock		start=/```/ end=/```/
syn match jzBolded		"\(^\|\s\)\zs{[^}]\+}\ze\($\|\s\)"	contains=jzBraceL,jzBraceR
syn match jzCommand		"\(^\|\s\)\zs`[^`]\+`\ze\($\|\s\)"	contains=jzBacktick
syn match jzItalic		"\(^\|\s\)\zs/[^/]\+/\ze\($\|\s\)"	contains=jzFwdSlash
syn match jzStrikethrough	"\(^\|\s\)\zs\~[^\~]\+\~\ze\($\|\s\)"	contains=jzTilde
syn match jzUnderlined		"\(^\|\s\)\zs_[^_]\+_\ze\($\|\s\)"	contains=jzUnderscore

syn match jzCheckboxF		"\[[^Xx-]\]"
syn match jzCheckboxT		"\[[Xx-]\]"
syn match jzError		"\cerror:"
syn match jzLine		"^\s*-\{3,\}$"
syn match jzModeline		"^\s*vim:.*"
syn match jzNavigation		"\c\(prev\|next\):"
syn match jzNote		"\c\(todo\|note\):"
syn match jzSectionDelim	"^#\+.*$"	contains=jzHyperTextEntry
syn match jzSpecial		"<[^>]\+>"
syn match jzStatus		"\cstatus:"
syn match jzWarning		"\cwarn\(ing\)\?:"

syn sync minlines=40

" Custom highlights
hi Bold				cterm=bold gui=bold
hi Italic			cterm=italic gui=italic
hi Strikethrough		ctermfg=10 cterm=strikethrough gui=strikethrough
hi Underline			cterm=underline gui=underline

hi def link Subtitle		Identifier
hi def link jzBacktick		Ignore
hi def link jzBar		Ignore
hi def link jzBolded		Bold
hi def link jzCheckboxF		Type
hi def link jzCheckboxT		Comment
hi def link jzCodeBlock		Comment
hi def link jzCommand		Comment
hi def link jzError		Error
hi def link jzExample		Comment
hi def link jzHeader		PreProc
hi def link jzHyperTextEntry	helpHyperTextEntry
hi def link jzHyperTextJump	helpHyperTextJump
hi def link jzIgnore		Ignore
hi def link jzItalic		Italic
hi def link jzLine		Comment
hi def link jzModeline		Comment
hi def link jzNavigation	PreProc
hi def link jzNotVi		Special
hi def link jzNote		Todo
hi def link jzOption		Type
hi def link jzSectionDelim	Special
hi def link jzSpecial		helpVim
hi def link jzStar		Ignore
hi def link jzStatus		PreProc
hi def link jzStrikethrough	Strikethrough
hi def link jzTodo		Todo
hi def link jzURL		String
hi def link jzUnderlined	Underline
hi def link jzWarning		Preproc

let b:current_syntax = "jzwiki"

" vim: ts=8 sw=2 sts=-1 et
