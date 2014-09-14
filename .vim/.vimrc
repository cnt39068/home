version 6.0
if !&cp | set cp | endif
let s:cpo_save=&cpo
set cpo&vim
map! <xHome> <Home>
map! <xEnd> <End>
map! <S-xF4> <S-F4>
map! <S-xF3> <S-F3>
map! <S-xF2> <S-F2>
map! <S-xF1> <S-F1>
map! <xF4> <F4>
map! <xF3> <F3>
map! <xF2> <F2>
map! <xF1> <F1>
map <xHome> <Home>
map <xEnd> <End>
map <S-xF4> <S-F4>
map <S-xF3> <S-F3>
map <S-xF2> <S-F2>
map <S-xF1> <S-F1>
map <xF4> <F4>
map <xF3> <F3>
map <xF2> <F2>
map <xF1> <F1>
let &cpo=s:cpo_save
unlet s:cpo_save
set mouse=a

:syntax on
:set autoindent
:set autowrite
:ab #d #define
:ab #i #include
:ab #b %%%%%%%%%%%%% BEGIN by W.Chau  %%%%%%%%%%%%%%%%
:ab #e %%%%%%%%%%%%%  END  by W.Chau  %%%%%%%%%%%%%%%%
:ab #l /*-------------------------------------------- */
:ab #j Jack Benny Show
:set shiftwidth=4
:set hlsearch
:set incsearch
:set textwidth=70
:so ~/.vim/protel.vim
:set ic
