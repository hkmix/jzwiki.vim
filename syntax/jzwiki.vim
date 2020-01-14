" Help wiki syntax file, based on help.vim.

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match helpHeadline		"^[-A-Z .][-A-Z0-9 .()]*[ \t]\+\*"me=e-1
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
syn match helpComment		"[Cc]omment[\t:]"
syn match helpConstant		"[Cc]onstant[\t:]"
syn match helpString		"[Ss]tring[\t:]"
syn match helpCharacter		"[Cc]haracter[\t:]"
syn match helpNumber		"[Nn]umber[\t:]"
syn match helpBoolean		"[Bb]oolean[\t:]"
syn match helpFloat		"[Ff]loat[\t:]"
syn match helpIdentifier	"[Ii]dentifier[\t:]"
syn match helpFunction		"[Ff]unction[\t:]"
syn match helpStatement		"[Ss]tatement[\t:]"
syn match helpConditional	"[Cc]onditional[\t:]"
syn match helpRepeat		"[Rr]epeat[\t:]"
syn match helpLabel		"[Ll]abel[\t:]"
syn match helpOperator		"[Oo]perator[\t:]"
syn match helpKeyword		"[Kk]eyword[\t:]"
syn match helpException		"[Ee]xception[\t:]"
syn match helpPreProc		"[Pp]reProc[\t:]"
syn match helpInclude		"[Ii]nclude[\t:]"
syn match helpDefine		"[Dd]efine[\t:]"
syn match helpMacro		"[Mm]acro[\t:]"
syn match helpPreCondit		"[Pp]reCondit[\t:]"
syn match helpType		"[Tt]ype[\t:]"
syn match helpStorageClass	"[Ss]torageClass[\t:]"
syn match helpStructure		"[Ss]tructure[\t:]"
syn match helpTypedef		"[Tt]ypedef[\t:]"
syn match helpSpecial		"[Ss]pecial[\t:]"
syn match helpSpecialChar	"[Ss]pecialChar[\t:]"
syn match helpTag		"[Tt]ag[\t:]"
syn match helpDelimiter		"[Dd]elimiter[\t:]"
syn match helpSpecialComment	"[Ss]pecialComment[\t:]"
syn match helpDebug		"[Dd]ebug[\t:]"
syn match helpUnderlined	"[Uu]nderlined[\t:]"
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
hi def link helpHeadline	Statement
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

hi def link helpComment		Comment
hi def link helpConstant	Constant
hi def link helpString		String
hi def link helpCharacter	Character
hi def link helpNumber		Number
hi def link helpBoolean		Boolean
hi def link helpFloat		Float
hi def link helpIdentifier	Identifier
hi def link helpFunction	Function
hi def link helpStatement	Statement
hi def link helpConditional	Conditional
hi def link helpRepeat		Repeat
hi def link helpLabel		Label
hi def link helpOperator	Operator
hi def link helpKeyword		Keyword
hi def link helpException	Exception
hi def link helpPreProc		PreProc
hi def link helpInclude		Include
hi def link helpDefine		Define
hi def link helpMacro		Macro
hi def link helpPreCondit	PreCondit
hi def link helpType		Type
hi def link helpStorageClass	StorageClass
hi def link helpStructure	Structure
hi def link helpTypedef		Typedef
hi def link helpSpecialChar	SpecialChar
hi def link helpTag		Tag
hi def link helpDelimiter	Delimiter
hi def link helpSpecialComment	SpecialComment
hi def link helpDebug		Debug
hi def link helpUnderlined	Underlined
hi def link helpError		Error
hi def link helpTodo		Todo
hi def link helpURL		String

let b:current_syntax = "jzwiki"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8 sw=2
