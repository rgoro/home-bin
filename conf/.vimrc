" Configuration file for vim
"set runtimepath=~/.vim,/etc/vim,/usr/share/vim/vimcurrent/vimfiles,/usr/share/vim/vimcurrent/addons,/usr/share/vim/vimcurrent/vimfiles,/usr/share/vim/vimcurrent/addons/after,~/.vim/after

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

" Now we set some defaults for the editor 
" set autoindent	" always set autoindenting on
" set linebreak		" Don't wrap words by default
set textwidth=0		" Don't wrap lines by default 
set nobackup		" Don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set grepprg=grep\ -nH\ $*

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

if has("autocmd")
 " Enabled file type detection
 " Use the default filetype settings. If you also want to load indent files
 " to automatically do language-dependent indenting add 'indent' as well.
 filetype plugin on
 filetype indent on
endif " has ("autocmd")

" Set paper size from /etc/papersize if available (Debian-specific)
try
  if filereadable('/etc/papersize')
    let s:papersize = matchstr(system('/bin/cat /etc/papersize'), '\p*')
    if strlen(s:papersize)
      let &printoptions = "paper:" . s:papersize
    endif
    unlet! s:papersize
  endif
catch /E145/
endtry

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
set cinwords=if,else,elseif,while,switch,case,for,do
set tabstop=4
set shiftwidth=4
set nowrapscan
set nu

"La inversa de J
map <C-J> i<CR><ESC>k$

autocmd FileType c,cpp,php,javascript,perl set cindent |set foldmethod=syntax

autocmd FileType haskell set textwidth=90

autocmd BufNewFile,BufRead *.p6 setf perl6
autocmd FileType perl6 source ~/.vim/perl6.vim
"autocmd FileType html,php source ~/.vim/html_dead.vim
autocmd FileType asm set tabstop=8 "| set filetype=nasm
 
"comandos para compilar latex
"¿Obsoletos desde que uso vim-latex ?
"autocmd FileType tex  map <F2> :w<CR> :!pdflatex % <CR>| map! <F2> <Esc> <F2>
"autocmd FileType tex  map <F3> :! evince *.pdf 2>/dev/null&<CR>| map! <F3> <Esc> <F3>
"autocmd FileType tex  map <F3> :w<CR> :!NEW=%;NEWFILE=`echo $NEW \| sed 's/tex/pdf/g;'`; pdflatex $NEW && evince $NEWFILE <CR>| map! <F3><Esc> <F3>
autocmd FileType tex  map! á 'a
autocmd FileType tex  map! í 'i
autocmd FileType tex  map! ó 'o
autocmd FileType tex  map! ú 'u
autocmd FileType tex  map! ñ ~n

"otras compilaciones (chequeos de sintáxis sólamente)
autocmd FileType c,cpp map <F2> :w<CR> :!gcc -c -Wall %<CR>| map! <F2> <Esc> <F2>
autocmd FileType php map <F2> :w<CR> :!php -l  %<CR>| map! <F2> <Esc> <F2>
autocmd FileType perl map <F2> :w<CR> :!perl -c -w %<CR>| map! <F2> <Esc> <F2>
autocmd FileType python map <F2> :w<CR> :!python -c "import %"<CR>| map! <F2> <Esc> <F2>

map ; $a;<ESC>

" helptags ~/.vim/doc

set nocp

map <C-F12> :!ctags-exuberant -R .<CR>
