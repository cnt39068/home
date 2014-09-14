"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

"Sets how many lines of history VIM har to remember
set history=400

"Enable filetype plugin
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast saving
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
nmap <leader>c :close<cr>
nmap <leader>r :cs add /localdisk/data/src/tags/cscope.out<cr>
"nmap <leader>t :set tags=/localdisk/data/src/tags/tags<cr>
nmap <leader>l :let g:LookupFile_TagExpr = '"/localdisk/data/src/tags/filenametags"'<cr>
nmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>sp :set paste<cr>
nmap <leader>usp :set paste!<cr>

"Switch to current dir
map <leader>cd :cd %:p:h<cr>

"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <leader>e :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
"cutocmd! bufwritepost vimrc source ~/.vimrc

"Turn backup off
set nobackup
set nowb
set noswapfile

"Favorite filetypes
set ffs=unix,dos,mac

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax on
syntax enable

"Set the color scheme
colorscheme koehler
"colorscheme murphy 

" set the terminal
if &term=="xterm"
  set t_Co=8
  set t_Sb=^[[4%dm
  set t_Sf=^[[3%dm
endif

"Highlight current
set cursorline

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=1

"Show line number
set nu

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase
set incsearch

" Sound disable
set noeb
set novb

"Set magic on, see more by :help magic
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set vb t_vb=

"show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=2

"Highlight search things
set hlsearch

""""""""""""""""""""""""""""""
" Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> /

"Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Moving fast to front, back and 2 sides ;)
imap <m-4> <end>

set sessionoptions+=unix,slash

"Move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $( <esc>`>a)<esc>`<i(<esc>
vnoremap $[ <esc>`>a]<esc>`<i[<esc>
vnoremap ${ <esc>`>a}<esc>`<i{<esc>
vnoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>
vnoremap $< <esc>`>a<<esc>`<i><esc>
vnoremap $\| <esc>`>a\|<esc>`<i\|<esc>
vnoremap $* <esc>`>a*<esc>`<i*<esc>

"Map auto complete of (, ", ', [
inoremap $( ()<esc>:let leavechar=")"<cr>i
inoremap $[ []<esc>:let leavechar="]"<cr>i
inoremap $4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap ${ {}<esc>:let leavechar="}"<cr>i
inoremap $< <><esc>:let leavechar=">"<cr>i
inoremap $' ''<esc>:let leavechar="'"<cr>i
inoremap $" ""<esc>:let leavechar='"'<cr>i

"imap <d-l> <esc>:exec "normal f" . leavechar<cr>a
"imap <m-l> <esc>:exec "normal f" . leavechar<cr>a

set autoindent
set autowrite
" Should consider the case
set ic
syntax on
set tabstop=4
set shiftwidth=2
set expandtab
"%retab
set cindent
if &term=="xterm"
  set t_Co=8
  set t_Sb=^[[4%dm
  set t_Sf=^[[3%dm
endif
set tags=./tags
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
set cscopequickfix=s-,c-,d-,i-,t-,e-

" the following lines define the shortkey for the cscope
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>l :let g:LookupFile_TagExpr = '"./filenametags"'<CR><CR>
"nmap <C-_>l :let g:LookupFile_TagExpr = '"/localdisk/data/ltecore/stags/filenametags"'<CR><CR>

" refresh the tags
nmap <C-F12> :!~/tool/ctags57/bin/ctags -R --exclude=lost+found --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" enable the auto-completion
set nocp
filetype plugin on

" shortcuts to load the tags
func! LoadDefaultTags()
  set tags=./tags
  cs add ./cscope.out
"  let g:LookupFile_TagExpr = '"/git_store1/eqtuabe/tags/passport/filenametags"'
endfunc

func! LoadGitPpTags()
  set tags=/git_store1/eqtuabe/tags/passport/tags
  cs add /git_store1/eqtuabe/tags/passport/cscope.out
  let g:LookupFile_TagExpr = '"/git_store1/eqtuabe/tags/passport/filenametags"'
endfunc

func! LoadGitGpmTags()
  set tags=/git_store1/eqtuabe/tags/gpm/tags
  cs add /git_store1/eqtuabe/tags/gpm/cscope.out
  let g:LookupFile_TagExpr = '"/git_store1/eqtuabe/tags/gpm/filenametags"'
endfunc

func! LoadSpmTags()
  set tags=/net/ecngzns002/view_store_3/eqtuabe/tags/pvg-spm/tags
  cs add /net/ecngzns002/view_store_3/eqtuabe/tags/pvg-spm/cscope.out
  let g:LookupFile_TagExpr = '"/net/ecngzns002/view_store_3/eqtuabe/tags/pvg-spm/filenametags"'
endfunc

func! LoadSsmTags()
  set tags=/net/ecngzns002/view_store_3/eqtuabe/tags/inta-ssm/tags
  cs add /net/ecngzns002/view_store_3/eqtuabe/tags/inta-ssm/cscope.out
  let g:LookupFile_TagExpr = '"/net/ecngzns002/view_store_3/eqtuabe/tags/inta-ssm/filenametags"'
endfunc

func! LoadPassportTags()
  set tags=/net/ecngzns002/view_store_3/eqtuabe/tags/passport/tags
  cs add /net/ecngzns002/view_store_3/eqtuabe/tags/passport/cscope.out
  let g:LookupFile_TagExpr = '"/net/ecngzns002/view_store_3/eqtuabe/tags/passport/filenametags"'
endfunc

func! LoadLteMtTags()
"  set tags=/net/ecngzns002/view_store_3/eqtuabe/tags/passport/tags
  cs add ~/tags/mt/cscope.out
  set tags=~/tags/mt/tags
  let g:LookupFile_TagExpr = '"/proj/lteWorkspace/eqtuabe/tags/mt/filenametags"'
endfunc

func! LoadLteLratTags()
"  set tags=/net/ecngzns002/view_store_3/eqtuabe/tags/passport/tags
  cs add /workspace/eqtuabe/tags/cscope.out
  set tags=/workspace/eqtuabe/tags/tags
  let g:LookupFile_TagExpr = '"/workspace/eqtuabe/tags/filenametags"'
endfunc

func! LoadLteOmfTags()
"  set tags=/net/ecngzns002/view_store_3/eqtuabe/tags/passport/tags
  cs add /workspace/eqtuabe/tags/omf/cscope.out
  set tags=/workspace/eqtuabe/tags/omf/tags
  let g:LookupFile_TagExpr = '"/workspace/eqtuabe/tags/omf/filenametags"'
endfunc

func! LoadLteNcMainTags()
"  set tags=/net/ecngzns002/view_store_3/eqtuabe/tags/passport/tags
  cs add ~/tags/ncmain/cscope.out
  set tags=~/tags/ncmain/tags
  let g:LookupFile_TagExpr = '"/proj/lteWorkspace/eqtuabe/tags/ncmain/filenametags"'
endfunc

func! LoadLteL13bTags()
"  set tags=/net/ecngzns002/view_store_3/eqtuabe/tags/passport/tags
  cs add ~/tags/l13b/cscope.out
  set tags=~/tags/l13b/tags
  let g:LookupFile_TagExpr = '"/proj/lteWorkspace/eqtuabe/tags/l13b/filenametags"'
endfunc

func! LoadLteFtTags()
"  set tags=/net/ecngzns002/view_store_3/eqtuabe/tags/passport/tags
  cs add ~/tags/ft/cscope.out
  set tags=~/tags/ft/tags
  let g:LookupFile_TagExpr = '"/proj/lteWorkspace/eqtuabe/tags/ft/filenametags"'
endfunc

" load the tags, cscope out file and filename according to the current path
if match(getcwd(), "MGW_CDN") > -1
  call LoadGitPpTags()
elseif match(getcwd(), "MGW_GPM") > -1
  call LoadGitGpmTags()
elseif match(getcwd(), "clearlib") > -1
  call LoadPassportTags()
elseif (match(getcwd(), "pvg-spm") > -1)
  call LoadSpmTags()
elseif (match(getcwd(), "inta-ssm") > -1)
  call LoadSsmTags()
" elseif (match(getcwd(), "erbs") > -1)
"   call LoadLteMtTags()
elseif match(getcwd(), "linux") > -1
  set tags=/home/willc/tags/linux-kernel/tags
  cs add /home/willc/tags/linux-kernel/cscope.out
  let g:LookupFile_TagExpr = '"/home/willc/tags/linux-kernel/filenametags"'
elseif match($CLEARCASE_ROOT, "88.4.5") > -1
  " call LoadCmccFt8845()
elseif match($CLEARCASE_ROOT, "19") > -1
  " call LoadMt19()
elseif match($CLEARCASE_ROOT, "mt") > -1
  call LoadLteMtTags()
elseif match($CLEARCASE_ROOT, "trial") > -1
  call LoadLte1914Tags()
elseif match(getcwd(), "omf") > -1
  call LoadLteOmfTags()
elseif match(getcwd(), "lrat") > -1
  call LoadLteLratTags()
else
  set tags=./tags
  cs add ./cscope.out
  let g:LookupFile_TagExpr = '"./filenametags"'
endif

nmap <leader>gp :call LoadSpmTags()<CR>
nmap <leader>gs :call LoadSsmTags()<CR>

" aspell shortcut
"nmap <leader>t :!aspell check %<cr>
nmap <leader>t :!aspell check %<cr>:e! %<cr>

" Session related
nmap <leader>m :mks! ~/.vim/Session.vim<cr>
nmap <leader>o :so ~/.vim/Session.vim<cr>

" netrw setting
let g:netrw_winsize = 30
nmap <leader>fe :Sexplore!<cr>

" Enable the TXT taglist?
" Automatically set the syntax for specific file type.
" au BufRead,BufNewFile *.txt exe 'TlistDebug debug.log'
" au BufRead,BufNewFile *.txt setfiletype java
syntax on
filetype plugin on 
au BufEnter *.txt setlocal ft=txt
