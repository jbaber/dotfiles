" " Give me history!
set history=999
"
" " Show current mode
set showmode
"
" " Allow for display of matching braces with %
set showmatch
"
" " dont autowrap lines
set wrapmargin=0
"
" " trim trailing spaces
" abbr _trim %s/ *$//
"
" " abbreviate sinc Sincerely yours, John B.
" " abbr sinc Sincerely yours, John B.
" " experimental sinc
" " abbr sinc mz1Gj!`zpar d -g `zi Sincerely yours, John B.
abbr sinc i Sincerely yours,   John B.
abbr sincc i Sincerely yours,   John

" " Try to copy Jusify functionality of nano
" " map  mz{j0!}par -g{j0dt.0!}par -g{j0dt.I  `z
map  {j0!}par -g{j0:s/^ *//0I  0!}par -g 

" >> and << shift indentation by two spaces
set shiftwidth=2

" Pressing <tab> translates to two spaces.  Now you must type Ctrl-v then tab
" to get a real tab character.
set expandtab
" Pressing <tab> moves the cursor two spaces
set tabstop=2
" >>, <<, and <tab> move to a multiple of two spaces to keep things aligned
set shiftround

" Always show the tab line (tabs as in browser tabs)
set showtabline=2

" Keep at least 10 lines visible below and above cursor
" set scrolloff=10

" Underline current line
set cursorline

" <Space> toggles highlighting search
map <Space> : set invhlsearch<CR>

" Highlight trailing whitespace as if it's an error
match ErrorMsg '\v(\s+)$'

" Highlight any character in the 80-st column as if it's an error.
2mat ErrorMsg '\%80v.'

" Terminal vim listens to mouse clicks.
" set mouse=a
"
"
" " Set g to compile with gcc
" " map g :!gcc %
"
" " Set g to format
" " map g {ji  !}par
"
" " Set ^P to insert PubDate in an RSS feed
" map  Oi!$/arpa/gm/j/jbaber/bin/rfc822timeI      <pubDate>A</pubDate>
"
" " Ignore case in searches
" " set ignorecase

" " Try to map _ to deleting the last two lines (for removing the URL from my signature)
map _ mzG$kd2d`z
"
" " Stuff to make tex-ing work
"

"         map ,pdftex :!pdftex "%"
"         map ,pdflatex :!pdflatex "%"
"         map ,latex :!latex "%"
" map ,b :!rm a.out:!gcc % -lcurses:!./a.out

set scrolloff=6 "Set to 999 to get center of screen cursor position at all times.

" source ~/vim_plugins/check-mutt-attachments.vim
" source ~/vim_plugins/showmarks.vim

" Inteded behavior is just softwrap at 60 so I can see what it _would_ look like, but don't actually insert those newlines
" set columns=60
" There doesn't seem to be any way to undo this!

" Turn on syntax highlighting with 256 colors
set t_Co=256
syntax on

" Comment this out if you're not using vimpathogen
" https://github.com/tpope/vim-pathogen
" execute pathogen#infect()
" Nobody should ever use vim-pathogen again, now you can just
" git clone into subdirectories of $HOME/.vim/pack

" Shortcuts for moving around windows without pressing shift.
map ,w <C-w>
map ,h <C-w>h
map ,j <C-w>j
map ,k <C-w>k
map ,l <C-w>l

" Shortcuts
map ,ce :e 
map ,cte :tabedit 
map ,cw :w<Enter>
map ,cq <c-w>q<Enter>
map ,v <c-w>v
map ,s <c-w>s
map ,co q:
map ,coo q:
map ,/ q/
map ,vt :vertical terminal<Enter>
map ,te :terminal<Enter>

" Make Ctrl-j and Ctrl-k move the page up and down
map <C-k> <C-y>
map <C-j> <C-e>

filetype plugin on
" set omnifunc=syntaxcomplete#Complete

" Local to the machine settings
source ~/.local/conf/vimrc
