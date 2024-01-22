#This is a comment
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
dwmblocks &
numlockx &
sxhkd &
exec dwm
