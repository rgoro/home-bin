" Configuration file for gvim
" Written for Debian GNU/Linux by W.Akkerman <wakkerma@debian.org>

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Extensions by i18n teams
if filereadable( "/etc/vim/langrc/" . $LANG . ".vim" )
   exe "so " . "/etc/vim/langrc/" . $LANG . ".vim"
endif

" You can also specify a different font, overriding the default font and the
" one from the hooks above:
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

if filereadable("/etc/vim/gvimrc.local")
  source /etc/vim/gvimrc.local
endif

colo desert

set guifont=Monospace\ 12
