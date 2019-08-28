" Vim syntax file
" Language: Kinesis Advantage2 keyboard layout file
" Maintainer: Arjen Laarhoven
"
if exists("b:current_syntax")
  finish
endif

syn case ignore

syn match advComment		"*.*" contains=@Spell
syn match advLocationMap	">"
syn match advMacroMap		">"

syn match advLocationChar	"\[\@<=\%(kp-\)\?[a-z0-9\\',./;`=]\]\@=" contained
syn match advLocationCode	"\[\@<=\(0\{1,2}[1-9]\|0\?[1-9][0-9]\?\|1[0-589][0-9]\|16[0-4]\|17[6-9]\|2[013-9][0-9]\|22[014-9]\)\]\@=" contained
syn match advMacroChar		"{\@<=\%(kp-\)\?[a-z0-9\\',./;`=]}\@=" contained

syn match advLocationToken	"\%(kp-\)\?\(f\(1[0-9]\?\|2[0-4]\?\|[3-9]\)\)[\]}]\@=" contained
syn match advLocationToken	"\<kp\%(div\|plus\|mult\|min\|enter[12]\|=mac\|toggle\|[0-9]\|\\\)\>" contained
syn match advLocationToken	"\<\%(kp-\)\?\(obrack\|cbrack\|hyphen\)\>" contained
syn match advLocationToken	"\<\%(kp-\)\?\(bspace\|insert\|home\|escape\|caps\)\>" contained
syn match advLocationToken	"\<\%(kp-\)\?\(next\|prev\|play\|mute\)\>" contained
syn match advLocationToken	"\<\%(kp-\)\?\(enter\|tab\|space\|delete\|bspace\|insert\|home\|pup\|pdown\|left\|right\|up\|down\|end\)\>" contained
syn match advLocationToken	"\<\%(kp-\)\?\(escape\|prtscr\|scroll\|caps\|pause\|calc\|shutdn\|menu\|numlk\|null\)\>" contained
syn match advLocationToken	"\<\%(kp-\)\?\(vol+\|vol-\|intl-\\\)\%([}\]]\)\@=" contained
syn match advLocationToken	"\<kp\%([.=\\]\)\%([}\]]\)\@=" contained

syn match advModifier		"\<\%(kp-\)\?\([lr]\?shift\|lwin\|rwin\|lalt\|ralt\|lctrl\|rctrl\)\>" contained
syn match advModifier		"\<\%(kpshift\)\>" contained
syn match advModifier		"\<\%(speed[1-9]\)\>" contained
syn match advModifier		"\<\%(d\%(125\|500\)\)\>" contained
syn match advModifier		"\<\%(t&h[1-9][0-9]\{0,2}\|hyper\|meh\)\>" contained

syn region advRemap		matchgroup=advBrack nextgroup=advLocationMap start="\[" end="\]" contains=advLocationChar,advLocationCode,advLocationToken,advModifier oneline
syn region advMacro		matchgroup=advBrace nextgroup=advMacroMap start="{" end="}" contains=advMacroChar,advLocationToken,advModifier,advDelay,advSpeed oneline
syn region advMacroModifier	matchgroup=advBrace nextgroup=advMacroMap start="{\%([+-]\)" end="}" contains=advModifier

hi def link advComment Comment
hi def link advLocationMap Operator
hi def link advMacroMap Operator
hi def link advLocationToken Constant
hi def link advLocationChar Constant
hi def link advLocationCode Constant
hi def link advMacroChar String
hi def link advModifier Structure
hi def link advBrack Keyword
hi def link advBrace Keyword

let b:current_syntax = "advantage2"
