#Environment variables
export EDITOR=nvim
export VISUAL=nvim
export TERM=kitty
export BROWSER=firefox
export HISTTIMEFORMAT="[%y-%m-%d, %T] "
export DISPLAY=:0
export MANPAGER='nvim +Man!'
export PATH=/home/tvha/.local/bin:$PATH

autoload -U colors && colors #Load colors for use in promt

setopt APPENDHISTORY        #Append history, for multiple zsh sessions
setopt HISTIGNOREDUPS       #Don't record an entry that was just recorded again
setopt EXTENDEDHISTORY      #Add timestapm
setopt INCAPPENDHISTORY     #Immediate append
setopt HISTFINDNODUPS       #Ignore duplicates when scrolling through history items
setopt HIST_IGNORE_SPACE    #When command is preceeded with space ignore it 
#Auto cd
setopt autocd

#Initialize completion system
autoload -U compinit
zmodload zsh/complist
compinit

#Vim mode
bindkey -v
export KEYTIMEOUT=2


#Vim-like navigation in completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


#Show hidden files in completion
_comp_options+=(globdots)


#Menu-style completion
zstyle ':completion:*' menu select

#Auto load newly installed binaries in zsh
zstyle ':completion:*' rehash true





#History
HISTFILE="/home/tvha/.zsh_history"
HISTSIZE=420000069
SAVEHIST=420000069


setopt promptsubst #Necessary for promt colors and functions etc.
NEWLINE=$'\n'
export PROMPT='%F{cyan}%n%F{69}@%F{211}% %m %F{white}%~${NEWLINE} %F{99} ✌ %F{white}'


#nnn environment variables
export NNN_BMS="d:$HOME/Downloads;t:/run/media/tvha/TOSHIBA EXT/;h:$HOME;c:$HOME/College/;p:$HOME/Pictures;s:$HOME/Pictures/Screenshots;v:$HOME/Videos;e:$HOME/Downloads/Telegram Desktop"
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui'
export NNN_TRASH=1

#fzf show hidden files 
export FZF_DEFAULT_COMMAND="find -L"


#nnn function to cd on quit
nn (){
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    nnn "$@"
    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}


#Aliases
alias nvim="nvim -p"
alias z="zathura"
alias n="nn -AeaH"
alias dirs="dirs -v"
alias ls="ls --color=auto -AFgGhc"
alias ping="ping -c 5"
alias mv="mv -v"
alias cp="cp -v"
alias rm="timeout 7 rm -Iv --one-file-system"
alias diff="colordiff"
alias grep="grep --color=auto"
alias cal="cal -my"
alias hst="history 1 -1 | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -sel c"
alias yt-dlp1080="yt-dlp -c -f "'"bestvideo[height<=1080]+bestaudio/best"'
alias chadwm='startx ~/.config/chadwm/scripts/run.sh'
alias fzf='fzf -m --scroll-off=3'


#Source files
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh


#Accept autosuggestion with ctrl + space key(replaces right arrow key)
bindkey '^ ' autosuggest-accept
