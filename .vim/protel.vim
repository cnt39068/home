" Vim syntax file
" Language:	protel
" Maintainer:	Peter Shook
" Last change:	Aug 3 1999

" Remove any old syntax stuff hanging around
syn clear

syn case ignore

syn match	pDirective	"^\$.*"
"syn match	pComment	"%.*$"
"syn match       pComment        /%.*$/
"syntax region   pComment        start=/%.*/     end=/$/
syn region	pString		start=+'+	end=+'+
syn keyword	pNumber		FALSE TRUE NIL
syn match	pNumber		"-\=\<[0-9]\+\>"
syn match	pNumber		"#\<[0-9a-fA-F]\+\>"
syn match	pByte		"\$[0-9a-fA-F]\+\>"

syn match   pFunction	"\h[_a-zA-Z0-9\$]\+\s*("
syn match   pFunction	"\s\+\$[_a-zA-Z0-9\$]\+\s*("
syn keyword pFunction	PROC RETURN RETURNS ENTRY FORWARD EXTERN
syn keyword pFunction	RESOLVE INTRINSIC
syn keyword pFunction	METHOD CLASS ENDCLASS

syn keyword pStatement	SECTION DEFINITIONS INTERFACE USES
syn keyword pStatement	PERPROCESS SWAPPABLE

syn keyword pLabel	BLOCK ENDBLOCK CASE SELECT ENDCASE ENDSELECT
syn keyword pLabel	INSPECT ANY ENDINSPECT IN OUT EXIT GOTO
syn match   pLabel	"{\s*\w\+\s*}\s*:"

syn keyword pConditional	IF ELSE THEN ELSEIF ENDIF

syn keyword pRepeat		DO FOR WHILE ENDDO FROM OVER BY
syn match   pRepeat		"UP TO"
syn match   pRepeat		"DOWN TO"

syn match  pMatrixDelimiter	"[][]"
syn match  pMatrixDelimiter	"[)(]"
"syn match  pMatrixDelimiter	"[}{]"

" If you don't like tabs
"syn match pShowTab	"\t"

syn keyword pOperator	CAST AS
syn keyword pOperator	INCL NOTINCL
syn match   pOperator	"<RARE>"
syn match   pOperator	"<USUAL>"
syn match   pOperator	"{OVERRIDING}:"
syn match   pOperator	"\*\*NEW"
syn match   pOperator	"\*\*OLD"
syn keyword pOperator	MOD
syn keyword pOperator	SET UPB TDSIZE SELF SUPER TYPEDESC
syn match   pOperator	"\^="
syn match   pOperator	"="
syn match   pOperator	"\^"
syn match   pOperator	"\&"
syn match   pOperator	">"
syn match   pOperator	"<"
syn match   pOperator	"@"
syn match   pOperator	">>"
syn match   pOperator	"<<"
syn match   pOperator	">="
syn match   pOperator	"<="
syn match   pOperator	"->"
syn match   pOperator	"|"


syn keyword pType	AREA ENDAREA REFINES UNRESTRICTED
syn keyword pType	STRUCT ENDSTRUCT OVLY ENDOVLY
syn keyword pType	TYPE BIND IS INIT DCL BOOL TABLE DESC PTR OF PACK TO
syn match   pType	"\$CLASSDESC"
syn match   pType	"\$UNIVERSAL_PTR"
syn match   pType	"\$CREATE_CLASS_PTR"
syn match   pType	"\$UNIVERSAL_READ_PTR"
syn match   pType	"\$READONLY"
syn match   pType	"\$OBJECT"
syn match   pType	"\$VARDESC"
syn match   pType	"\$REFDESC"
syn match   pType	"\$ANYTHING"
syn match   pType	"\$TYPEDESC"
syn match   pType	"\$LONGINT"
syn match   pType	"\$UINT"
syn match   pType	"\$INT"
syn keyword pType	ABSTRACT REF UPDATES OBSOLETE VAL
syn keyword pType	PRIVATE PROTECTED SCRATCH SHARED LITERAL
syntax  region      pComment        start=/%/     end=/$/
syntax  region      pComment        start=/'/     end=/'/
set softtabstop=3
set shiftwidth=3

syn sync lines=500

if !exists("did_protel_syntax_inits")
  let did_protel_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later
  hi link pDirective		PreProc
  hi link pComment		Comment
  hi link pString		String
  hi link pStatement		Statement
  hi link pLabel		Label
  hi link pConditional		Conditional
  hi link pRepeat		Repeat
  hi link pTodo			Todo
  hi link pMatrixDelimiter	Identifier
  hi link pNumber		Number
  hi link pByte			Number
  hi link pOperator		Operator
  hi link pFunction		Function
  hi link pType			Type

  "hi link pShowTab		Error
endif

let b:current_syntax = "protel"

" vim: ts=8
