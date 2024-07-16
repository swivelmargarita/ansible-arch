Xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
if [[ $Xaxis -eq 1920 ]]
then
	echo Xft.dpi: 120 > ~/.Xresources
elif [[ $Xaxis -eq 2560 ]]
then
	echo Xft.dpi: 144 > ~/.Xresources
fi

 
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

dwmblocks &
numlockx &
sxhkd &
udiskie &
exec ssh-agent dwm
