showrepo()
{
    if [ $# -eq 0 ]; then
        echo "No arguments supplied"
        exit 1
fi

    pacman -Sl $1 | grep "\[installed\]"
}

# Backup a file with a .bak extension
bakup()
{
	cp $1{,.bak}
}	

be()
{
    myfiles=( \
             ~/.bashrc \
             ~/.bash_alias \
             ~/.bash_profile \
             ~/.bash_logout \
             ~/.inputrc \
             ~/.profile \
            )

    du -a  ${myfiles[*]} | \
        awk '{print $2}' | uniq | sort -r \
        | fzf --cycle --exact --height 40% --bind="ctrl-space:toggle-preview" --preview-window=:hidden \
        --layout=reverse-list --border --prompt="Select Script(s) To Edit: " \
        --preview='bat --force-colorization --line-range 1:60 {}' \
        --header="The BASH dot file Editor" --preview-window=right,50% --multi | \
        xargs -or $EDITOR;

}

se() 
{  
        myscripts=(~/.local/bin/*)

        selected_file=$(fzf --tac --exact --height 40% --cycle \
        --layout=reverse-list --border --prompt="Select Script(s) To Edit: " \
        --preview='bat --force-colorization --line-range 1:60 {}' \
        --header="The Script Editor" --preview-window=right,50% --multi< <(printf "%s\n" "${myscripts[@]}" | sort -r))

        if [ -n "$selected_file" ]; then
            nvim $selected_file
        fi
}

ze()
{
    myzsh=(
            ~/.zshenv
            ~/.config/zsh/.zshrc
            ~/.config/zsh/.functions.zsh
            ~/.config/zsh/.alias.zsh
           )

        selected_file=$(fzf --tac --exact --height 40% --cycle \
        --layout=reverse-list --border --prompt="Select Script(s) To Edit: " \
        --preview='bat --force-colorization --line-range 1:60 {}' \
        --header="The Script Editor" --preview-window=right,50% --multi< <(printf "%s\n" "${myzsh[@]}"))

        if [ -n "$selected_file" ]; then
            nvim $selected_file
        fi
}

ce() 
{  
    myconfigs=(
             ~/.config/zathura/zathurarc
             ~/.config/weechat/*.conf 
             ~/.config/tmux/tmux.conf
             ~/.config/rofi/config.rasi 
             ~/.config/ranger/rc.conf 
             ~/.config/picom/picom.conf
             ~/.config/nvim/init.vim 
             ~/.config/nsxiv/* 
             ~/.config/ncmpcpp/config
             ~/.config/mpv/mpv.conf 
             ~/.config/mpd/mpd.conf
             ~/.config/lsd/* 
             ~/.config/i3status-rust/config.toml 
             ~/.config/i3/config
             ~/.config/dunst/dunstrc 
             ~/.config/alacritty/alacritty.yml 
           )

           selected_file=$(fzf --tac --exact --height 40% --cycle \
           --layout=reverse-list --border --prompt="Select Script(s) To Edit: " \
           --preview='bat --force-colorization --line-range 1:60 {}' \
           --header="The Script Editor" --preview-window=right,50% --multi< <(printf "%s\n" "${myconfigs[@]}"))

       if [ -n "$selected_file" ]; then
           nvim $selected_file
       fi
}

# Last pacman update
lstupg()
{
    tac /var/log/pacman.log | sed -n '/full system upgrade/q;s/.*\[ALPM\] upgraded //p'
}

zsh-stats() 
{
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' \
      | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n25
}

vplay()
{
    mpv "$1" 2>/dev/null
}

# Returns the local IP address
localip()
{
    local MY_IP=$(ip -4 -j a | jq -r '.[] | select(.operstate=="UP") | .addr_info[].local')
    echo $MY_IP
}

# Creates a thumbnail image
makethumb() 
{
   if [ "$1" != "" ]; then
	   convert -thumbnail 640 $1 Resized_$1
   else
	   echo 'Missing positional parameter'
	   exit
   fi
}


# Create a directory and change to it
mkcd() 
{
	mkdir -p $1
	cd $1
}

# Returns the local IP address
myip()
{
    local MY_IP=$(curl http://ipecho.net/plain 2>/dev/null; echo)
    echo $MY_IP
}


# Uninstalls unnecessary packages 
orphans() 
{
  if [[ ! -n $(pacman -Qdt) ]]; then
    echo No orphan packages to remove!
  else
    sudo pacman -Rs $(pacman -Qdtq)
  fi
}

# Show package dependencies
pac_pkgdep() 
{
	echo -e "--- $1's dependencies ---\n"
	pacman -Si $1 | awk -F'[:<=>]' '/^Depends/ {print $2}' | xargs -n1 | sort -u
	echo -e "\n"
}

r()
{
    if [[ -z ${1} ]]; then
        ranger $(pwd) --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR" 2>/dev/null
    else
        ranger ${1} --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR" 2>/dev/null
    fi
}

# Uses FZF to present a list of files to edit
# Shows throughput on ssh connection
sshspeed()
{	
	( yes | pv | ssh -C $1 "cat > /dev/null" )
}

# Returns external IP
wanip()
{
	echo $(curl -s http://ipecho.net/plain; echo)
}

# What package does a command belong to
whatpackage()
{
	pacman -F $1
}

# What service and timer files are in a package
whatservice() 
{
	pacman -Qql $1 | grep -e .service -e .socket
}

# Gets the weather forecast
wttr()
{
    local request="wttr.in/${1-Warwick+QLD}"
    [ "$(tput cols)" -lt 125 ] && request+='?n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}

cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'       # Block cursor
    cursor_beam='\e[4 q'        # Underline

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

fixkey()
{
    if [[ -n $1 ]]; then
        ssh-keygen -R $1
    else
        echo "No IP or hostname provided!"
    fi
}

cursor_mode

# The git prompt's git commands are read-only and should not interfere with
# other processes. This environment variable is equivalent to running with `git
# --no-optional-locks`, but falls back gracefully for older versions of git.
# See git(1) for and git-status(1) for a description of that flag.
#
# We wrap in a local function instead of exporting the variable directly in
# order to avoid interfering with manually-run git commands by the user.
function __git_prompt_git() {
  GIT_OPTIONAL_LOCKS=0 command git "$@"
}

ssh-fix()
{
    if [ -z "$1" ]; then
        echo -e "No parameter passed\nssh-fix <hostname|IP Address>"
    else
        ssh-keygen -f "/home/patrick/.ssh/known_hosts" -R "$1"  
    fi
}

