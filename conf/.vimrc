" Configuration file for vim

set runtimepath+=~/.vim/bundle/jshint2.vim/
set runtimepath+=~/.vim/pack/plugin/start/tagbar

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

set wildmenu
set wildmode=longest:full

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
set autowrite		" Automatically save before commands like :next and :make

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
set cinwords=if,else,elseif,while,switch,case,for,do
set tabstop=4
set shiftwidth=4
" set nowrap
" set nowrapscan
set nu

noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>

autocmd FileType c,cpp,javascript,perl set cindent |set foldmethod=syntax
autocmd FileType php set cindent |set foldmethod=indent

autocmd FileType haskell set textwidth=90

autocmd BufNewFile,BufRead *.p6 setf perl6
autocmd FileType perl6 source ~/.vim/perl6.vim
autocmd FileType asm set tabstop=8 "| set filetype=nasm
autocmd FileType tex set textwidth=0
 
"otras compilaciones (chequeos de sintáxis sólamente)
autocmd FileType c,cpp map <buffer> <F2> :w<CR> :!gcc -c -Wall %<CR>| map! <buffer> <F2> <Esc> <F2>
autocmd FileType php map <buffer> <F2> :w<CR> :!php -l  %<CR>| map! <buffer> <F2> <Esc> <F2>
autocmd FileType perl map <buffer> <F2> :w<CR> :!perl -c -w %<CR>| map! <buffer> <F2> <Esc> <F2>
autocmd FileType python map <buffer> <F2> :w<CR> :!python -m py_compile % 2>&1<CR>| map! <buffer> <F2> <Esc> <F2>
autocmd FileType html map <buffer> <F2> :w<CR> :! tidy -e -utf8 %<CR>| map! <buffer> <F2> <ESC><F2>
autocmd FileType javascript map <buffer> <F2> :w<CR> :JSHint<CR> | map! <buffer> <F2> <ESC><F2>

" helptags ~/.vim/doc

set nocp

set splitright
map <C-F12> :!ctags-exuberant -R .<CR>

autocmd FileType python map X :%s/	/    /g<CR>:w<CR>

 let g:tex_noindent_env = 'document\|verbatim\|lstlisting'
