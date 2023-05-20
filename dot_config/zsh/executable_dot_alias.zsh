# vim:syntax=sh filetype=sh
# alias reload='. ~/.bash_profile && echo "bash files reloaded"'
alias ..='cd ..'
alias 0='exit'
alias alsamixer='alsamixer -c 1'
alias audio='yt-dlp --config-locations ~/.config/yt-dlp/audio'
alias bak_ff='rsync -avq --delete /home/patrick/.mozilla/firefox/pyl72xbe.default-release/ /home/patrick/GoogleDrive/Firefox/'
alias btr='sudo modprobe -r btusb ; sudo modprobe btusb'
alias cat='bat'
alias chmod='chmod -v '
alias config='cd ~/.config'
alias cp='cp -iv'
alias d='dirs -v'
alias dirs='dirs -v'
alias dlnascan="minidlnad -f ~/.config/minidlna/minidlna.conf -R"
alias dns_temp='ssh -t -p 549 patrick@pidns "/home/patrick/temp.py" 2> /dev/null'
alias enc='nvim ~/.config/nvim/init.vim'
alias feh='feh -. -d -Z --fontpath $HOME/.local/share/fonts --font "MesloLGS NF Bold/15" --sort mtime 2>/dev/null'
alias free='free -ht --si'
alias ftp='ftp -v'
alias gc='git clone'
alias grep='grep --color=always'
alias history="fc -lE 1"
alias hy=" fc -ln 0 | awk '!a[\$0]++' | fzf --tac | xclip -selection clipboard"
alias i3save='i3-msg -t get_config > ~/i3config-backup'
alias ip='ip -color=auto'
alias l.='lsd -dvlFh .??*'
alias l='lsd -lFvAhX'
alias ll='lsd -lhF'
alias lease='ssh patrick@pidns "TERM=tmux-256color ~/lease.sh"'
alias ls='ls --group-directories-first --color=auto'
alias lt='systemctl --all --user list-timers'
alias mc=". /usr/lib/mc/mc-wrapper.sh --nosubshell"
alias meminfo='vmstat -s -S M | \grep mem'
alias merge='xrdb -load -I$HOME ~/.Xresources'
alias mkdir='mkdir -pv'
alias ncdu='ncdu -2 --extended --color dark-bg'
alias pac_explicit='pacman -Qent > ~/explicit.txt'
alias pac_foreign='pacman -Qqm > ~/foreign.txt'
alias pac_inup="grep --color=never "$(date +"%Y-%m-%d")" /var/log/pacman.log | grep -i 'installed\|upgraded'"
alias pac_native='pacman -Qn > ~/native.txt'
alias pacbackup='comm -23 <(pacman -Qeq|sort) <(pacman -Qmq|sort) > pkglist.txt'
alias pdf='zathura'
alias ping='ping -4 -c 4'
alias pitemp="ssh -t -p 549 patrick@pidns 'vcgencmd measure_temp' 2> /dev/null" 
alias pkgowner='pacman -Qo' 
alias reload='exec zsh && echo "zsh configuration files reloaded"'
alias removekey='sed -i $1d ~/.ssh/known_hosts'
alias rm='rm -I'
alias rts='/usr/bin/rofi-theme-selector'
alias sprunge='stripansi | curl -F "sprunge=<-" http://sprunge.us'
alias stripansi="perl -pe 's/\e\[?.*?[\@-~]//g'"
alias subs='ytfzf --subs=5 --sort -f'
alias swapinfo='vmstat -s -S M | \grep swap'
alias tlw="tmux list-windows | sed -n 's/.*layout \(.*\)] @.*/\1/p'"
alias v='nvim '
alias video='yt-dlp --config-locations "~/.config/yt-dlp/video" '
alias vim='nvim'
alias vs='sudo nvim '
alias vss='sort -u "${HOME}"/.config/nvim/spell/en.utf-8.add -o "${HOME}"/.config/nvim/spell/en.utf-8.add'
alias wget='wget -c'

alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# Suffix Aliases
alias -s txt=vim
alias -s pdf=zathura
alias -s sc=sc-im
alias -s odt=zaread
alias -s {yml,yaml,toml}=nvim
alias -s mkv=mpv

# Global Aliases
alias -g G='| grep'
alias -g L='| less'
alias -g W='| wc -l'
