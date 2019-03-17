" Vim syntax file
" Language: Kinesis Advantage2 keyboard layout file
" Maintainer: Arjen Laarhoven
"
if exists("b:current_syntax")
  finish
endif

syn case ignore

syn match knsComment		"*.*" contains=@Spell
syn match knsLocationMap	">"
syn match knsMacroMap		">"

syn match knsLocationChar	"\[\@<=\%(kp-\)\?[a-z0-9\\',./;`=]\]\@=" contained
syn match knsMacroChar		"{\@<=\%(kp-\)\?[a-z0-9\\',./;`=]}\@=" contained

syn match knsLocationToken	"\%(kp-\)\?\(f\(1[0-9]\?\|2[0-4]\?\|[3-9]\)\)\]\@=" contained
syn match knsLocationToken	"\<kp\%(div\|plus\|mult\|min\|enter[12]\|=mac\|toggle\|[0-9]\)\>" contained
syn match knsLocationToken	"\<\%(kp-\)\?\(obrack\|cbrack\|hyphen\)\>" contained
syn match knsLocationToken	"\<\%(kp-\)\?\(bspace\|insert\|home\|escape\|caps\)\>" contained
syn match knsLocationToken	"\<\%(kp-\)\?\(next\|prev\|play\|mute\)\>" contained
syn match knsLocationToken	"\<\%(kp-\)\?\(enter\|tab\|space\|delete\|bspace\|insert\|home\|pup\|pdown\|left\|right\|up\|down\|end\)\>" contained
syn match knsLocationToken	"\<\%(kp-\)\?\(escape\|prtscr\|scroll\|caps\|pause\|calc\|shutdn\|menu\|numlk\|null\)\>" contained
syn match knsLocationToken	"\<\%(kp-\)\?\(vol+\|vol-\|intl-\\\)\%([}\]]\)\@=" contained
syn match knsLocationToken	"\<kp\%([.=\\]\)\%([}\]]\)\@=" contained

syn match knsModifier		"\<\%(kp-\)\?\([lr]\?shift\|lwin\|rwin\|lalt\|ralt\|lctrl\|rctrl\)\>" contained
syn match knsModifier		"\<\%(kpshift\)\>" contained
syn match knsModifier		"\<\%(speed[1-9]\)\>" contained
syn match knsModifier		"\<\%(d\%(125\|500\)\)\>" contained

syn region knsRemap		matchgroup=knsBrack nextgroup=knsLocationMap start="\[" end="\]" contains=knsLocationChar,knsLocationToken,knsModifier oneline
syn region knsMacro		matchgroup=knsBrace nextgroup=knsMacroMap start="{" end="}" contains=knsMacroChar,knsLocationToken,knsModifier,knsDelay,knsSpeed oneline
syn region knsMacroModifier	matchgroup=knsBrace nextgroup=knsMacroMap start="{\%([+-]\)" end="}" contains=knsModifier

hi def link knsComment Comment
hi def link knsLocationMap Operator
hi def link knsMacroMap Operator
hi def link knsLocationToken Constant
hi def link knsLocationChar Constant
hi def link knsMacroChar String
hi def link knsModifier Structure
hi def link knsBrack Keyword
hi def link knsBrace Keyword

let b:current_syntax = "advantage2"
