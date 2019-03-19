" Vim syntax file
" Language: Kinesis Freestyle Edge/Pro keyboard layout file
" Maintainer: Arjen Laarhoven
"
if exists("b:current_syntax")
  finish
endif

syn case ignore

syn match fstComment		"*.*" contains=@Spell
syn match fstLocationMap	">"
syn match fstMacroMap		">"

syn match fstLocationChar	"\[\@<=[a-z0-9\\/=-]\]\@=" contained
syn match fstMacroChar		"{\@<=[a-z0-9\\/=-]}\@=" contained

syn match fstLocationToken	"\<\%(f\%(1[0-9]\?\|2[0-4]\?\|[3-9]\)\)[\]}]\@=" contained
syn match fstLocationToken	"\<\%(hk\%(10\?\|[2-9]\)\)\>" contained
syn match fstLocationToken	"\<\%(obrk\|cbrk\|per\|com\|apos\|tilde\)\>" contained
syn match fstLocationToken	"\<\%(mute\|play\|next\|prev\|lmous\|rmous\|mmous\|mous4\|mous5\)\>" contained
syn match fstLocationToken	"\<\%(ent\|tab\|spc\|del\|bspc\|home\|end\|pup\|pdn\|lft\|rght\|up\|dwn\|esc\|prnt\|pause\|scrlk\|ins\)\>" contained
syn match fstLocationToken	"\<\%(numlk\|kp1\|kp2\|kp3\|kp4\|kp5\|kp6\|kp7\|kp8\|kp9\|kp0\|kpent\|kp=\)\>" contained
syn match fstLocationToken	"\<\%(caps\|fntog\|fnshf\|menu\|calc\|shtdn\|led\|null\)\>" contained
syn match fstLocationToken	"\<\%(vol+\|vol-\|intl/\|kp*\|kp.\|kp-\|kp+\)[\]}]\@=" contained

syn match fstModifier		"\<\%([lr]\%(shft\|win\|alt\|ctrl\)\)\>" contained
syn match fstModifier		"\<\%(d\%(125\|500\)\)\>" contained
syn match fstMacroPlaybackSpdPfx	"{\@<=s[1-9]}" contained
syn match fstMacroMultiplayPfx	"{\@<=x[1-9]}" contained

syn region fstRemap		matchgroup=fstBrack nextgroup=fstLocationMap start="\[" end="\]" contains=fstLocationChar,fstLocationToken,fstModifier oneline
syn region fstMacro		matchgroup=fstBrace nextgroup=fstMacroMap start="{" end="}" contains=fstMacroChar,fstLocationToken,fstModifier,fstDelay,fstSpeed,fstMacroPbkSpd,fstMacroMltPly oneline
syn region fstMacroModifier	matchgroup=fstBrace nextgroup=fstMacroMap start="{\%([+-]\)" end="}" contains=fstModifier
syn match fstFn			"fn" contains=fstRemap,fstMacro,fstMacroModifier

hi def link fstComment Comment
hi def link fstLocationMap Operator
hi def link fstMacroMap Operator
hi def link fstLocationToken Constant
hi def link fstLocationChar Constant
hi def link fstMacroChar String
hi def link fstMacroPlaybackSpdPfx Structure
hi def link fstMacroMultiplayPfx Structure
hi def link fstModifier Structure
hi def link fstBrack Keyword
hi def link fstBrace Keyword
hi def link fstFn Operator

let b:current_syntax = "freestyle"
