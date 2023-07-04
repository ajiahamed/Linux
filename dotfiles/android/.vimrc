set nocompatible
filetype on
filetype plugin on
filetype indent on

syntax on
set number
set ruler
set cursorline
set cursorcolumn
set showmode
set title

set visualbell
set noerrorbells

colorscheme molokai                                                                         

set t_Co=256

"highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black

"let g:currentmode={
"       \ 'n'  : 'NORMAL ',
"       \ 'v'  : 'VISUAL ',
"       \ 'V'  : 'V·Line ',
"       \ "\<C-V>" : 'V·Block ',
"       \ 'i'  : 'INSERT ',
"       \ 'R'  : 'R ',
"       \ 'Rv' : 'V·Replace ',
"       \ 'c'  : 'Command ',
"       \}

"set statusline=
"set statusline+=\ %{toupper(g:currentmode[mode()])}
"set statusline+=\[%{(g:currentmode[mode()])}\]
"set statusline+=\ %F\ %M\ %Y\ %R
"set statusline+=%=
"set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%
"set laststatus=2
"
function! IsCv() 
  return "\<C-v>" == mode()  " because \" is a comment, we need a function for this…
endfunction

set statusline=
set statusline+=%#Search#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffAdd#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#DiffChange#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#DiffChange#%{(IsCv())?'\ \ VISUAL\ ':''}
set statusline+=%#Cursor#        " colour
set statusline+=\ %n\            " buffer number
set statusline+=%#Visual#        " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#      " colour
set statusline+=%w               " preview flag
set statusline+=%h               " help flag
set statusline+=%r               " readonly flag
set statusline+=%m               " modified [+] flag
set statusline+=%#CursorLine#    " colour
set statusline+=\ %t\            " short file name
set statusline+=%=               " right align
set statusline+=%#CursorLine#    " colour
set statusline+=\ %{&filetype}\  " file type (%Y and %y are too ugly)
set statusline+=%#Visual#        " colour
set statusline+=\ %3l:%-2c\      " line + column
set statusline+=%#Cursor#        " colour
set statusline+=\ %3p%%\         " percentage
set statusline+=%#CursorLine#    " colour
set laststatus=2
