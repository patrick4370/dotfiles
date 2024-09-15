# vim:syntax=sh filetype=sh
# 06-06-2023 08:47 +1000  
alias ..='cd ..'
alias 0='exit'
alias alsamixer='alsamixer -c 1'
alias audio='yt-dlp --config-locations ~/.config/yt-dlp/audio'
alias cat='bat --style=grid,snip,header-filename,header-filesize'
alias cd='z'
alias cls='clear'
alias cp='cp -iv'
alias d='dirs -v'
alias duf='duf --hide-fs tmpfs --hide special -style unicode -theme dark --sort=size -width 220 -output mountpoint,used,avail,usage,type,filesystem'
alias dirs='dirs -v'
alias dlnascan="minidlnad -f ~/.config/minidlna/minidlna.conf -R"
alias feh='feh -. -d -Z --fontpath $HOME/.local/share/fonts --font "MesloLGS NF Bold/15" --sort mtime 2>/dev/null'
alias free='free -ht --si'
alias gc='git clone'
alias grep='grep --color=always'
alias gs='git status'
alias history="fc -lE 1"
alias hy=" fc -ln 0 | awk '!a[\$0]++' | fzf --tac | xclip -selection clipboard"
alias i3save='i3-msg -t get_config > ~/i3config-backup'
alias ip='ip -color=auto'
alias l.='lsd --sort version -dvlFh .??*'
alias l='lsd -lFvAhX --group-directories-first --sort version'
alias lease='ssh patrick@pidns "TERM=tmux-256color ~/lease.sh"'
alias ll='lsd -lhF'
alias ls='ls --group-directories-first --color=auto'
alias lt='systemctl --all --user list-timers'
alias mc=". /usr/lib/mc/mc-wrapper.sh --nosubshell"
alias meminfo='vmstat -s -S M | \grep mem'
alias merge='xrdb -load -I$HOME ~/.Xresources'
alias mkdir='mkdir -pv'
alias mux='tmuxinator'
alias ncdu='ncdu -2 --extended --color dark-bg'
alias pac_explicit='pacman -Qqen > ~/explicit.txt'
alias pac_foreign='pacman -Qqm > ~/foreign.txt'
alias pac_inup="grep --color=never "$(date +"%Y-%m-%d")" /var/log/pacman.log | grep -i 'installed\|upgraded'"
alias pacbackup='comm -23 <(pacman -Qeq|sort) <(pacman -Qmq|sort) > pkglist.txt'
alias pacdiff='pacdiff --backup --sudo --threeway'
alias pdf='zathura'
alias ping='ping -4 -c 4'
alias pitemp="ssh -t -p 549 patrick@pidns 'vcgencmd measure_temp' 2> /dev/null" 
alias pkgdep="pacman -Qq | fzf --preview 'pactree -lur {} | sort' --layout reverse --bind 'enter:execute(pactree -lu {} | sort | less)'"
alias pkgowner='pacman -Qo' 
alias popd='>/dev/null popd'
alias pushd='>/dev/null pushd'
alias reload='exec zsh && echo "zsh configuration files reloaded"'
alias removekey='sed -i $1d ~/.ssh/known_hosts'
alias rm='rm -I'
alias rts='/usr/bin/rofi-theme-selector'
alias sprunge='stripansi | curl -F "sprunge=<-" http://sprunge.us'
alias stripansi="perl -pe 's/\e\[?.*?[\@-~]//g'"
alias swapinfo='vmstat -s -S M | \grep swap'
alias tlw="tmux list-windows | sed -n 's/.*layout \(.*\)] @.*/\1/p'"
alias v='vim -X'
alias video='yt-dlp --config-locations "~/.config/yt-dlp/video" '
alias vs='sudo vim -X '
alias vss='sort -u "${HOME}"/.config/nvim/spell/en.utf-8.add -o "${HOME}"/.config/nvim/spell/en.utf-8.add'
alias wget='wget -c'
alias zswap_stats='sudo grep -r . /sys/kernel/debug/zswap'

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
alias -s md=vim
alias -s mkv=mpv
alias -s mp4=mpv
alias -s odt=zaread
alias -s pdf=zathura
alias -s sc=sc-im
alias -s tex=texmaker
alias -s txt=vim
alias -s {yml,yaml,toml}=nvim

# Global Aliases
alias -g G='| grep'
alias -g L='| less'
alias -g W='| wc -l'

alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
