function! Replaces()
  :%s/a><a/a><a/g
  :%s/><img/>  <img/g
  :%s/><\/a/><\/a/g
endfunction

map I O<div style="width: 100%; text-align:center; clear:both;"><CR>  <div style="float: left; width: 50%"><ESC>j
map D O</div><CR><div style="float: right; width: 50%"><ESC>j
map S o</div><ESC>
map X O<div style="text-align:center; clear:both;"><CR>
map T :call Replaces()<CR>


