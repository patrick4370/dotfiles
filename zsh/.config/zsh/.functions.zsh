# Functions
# 29-10-2023 16:44 +1000

paste() 
{
    local file=${1:-/dev/stdin}
    curl --data-binary @${file} https://paste.rs
}

get_pkgbuild()
{
    set -e
    pkgname=$1

    if [ "$pkgname" = "" ]; then
        echo "No package given ... quitting!"
        return
    fi

    pkgctl repo clone --protocol=https "$pkgname"

    if [ "$?" -ne 0 ]; then
        echo "Not a valid package name"
    fi
}

# lir()
# {
#     if [ "$#" -ne 1 ];
#         echo "Please enter a repository name"
#         exit 1
#     fi

#     comm -12 <(pacman -Qq | sort) <(pacman -Sql $1 | sort)
# }

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

se() 
{  
        # This function has been modified from a function written by Luke
        # Smith. I didn't like the use of du piping into awk etc, I have
        # minimised the amount of pipes by redirecting the array into fzf by
        # using '< <(printf "%s\n" "${myscripts[@]}"'. This works extremely
        # well. Date: 06-06-2023 09:02 +1000

        myscripts=(~/.local/bin/*)
        
        local string=" The Script Editor "
        
        fzf --height 40% --cycle --border-label="$string" \
        --layout=reverse --tac --border --color=label:italic:white --prompt="Select Script(s) To Edit: " \
        --preview='bat --force-colorization --line-range 1:100 {}' \
        --preview-window=right,70% --multi< <(printf "%s\n" "${(@nO)myscripts}") | xargs -ro vim -X
}

ze()
{
        # This function has been modified from a function written by Luke
        # Smith. I didn't like the use of du piping into awk etc, I have
        # minimised the amount of pipes by redirecting the array into fzf by
        # using '< <(printf "%s\n" "${myscripts[@]}"'. This works extremely
        # well. Date: 06-06-2023 09:02 +1000

        myzsh=(
                ~/.zshenv
                $XDG_CONFIG_HOME/zsh/.zshrc
                $XDG_CONFIG_HOME/zsh/.zle.zsh
                $XDG_CONFIG_HOME/zsh/.functions.zsh
                $XDG_CONFIG_HOME/zsh/.alias.zsh
                $XDG_CONFIG_HOME/zsh/.zlogin
                $XDG_CONFIG_HOME/zsh/.zlogout
                /home/patrick/.config/zsh/.zprofile
               )

        local string=" The ZSH Config Editor "

        fzf --exact --height 40% --cycle --border-label="$string" \
        --layout=reverse --tac --border --color=label:italic:white --prompt="Select ZSH configs To Edit: " \
        --preview='bat --force-colorization --line-range 1:100 {}' \
        --preview-window=right,70% --multi< <(printf "%s\n" "${(@nO)myzsh}")  | xargs -ro vim -X
}

ce() 
{  
        # This function has been modified from a function written by Luke
        # Smith. I didn't like the use of du piping into awk etc, I have
        # minimised the amount of pipes by redirecting the array into fzf by
        # using '< <(printf "%s\n" "${myscripts[@]}"'. This works extremely
        # well. Date: 06-06-2023 09:02 +1000

        myconfigs=(
                 $HOME/.vimrc
                 $XDG_CONFIG_HOME/alacritty/alacritty.toml 
                 $XDG_CONFIG_HOME/bat/config
                 $XDG_CONFIG_HOME/dunst/dunstrc 
                 $XDG_CONFIG_HOME/i3/config
                 $XDG_CONFIG_HOME/i3status-rust/config.toml 
                 $XDG_CONFIG_HOME/lsd/* 
                 $XDG_CONFIG_HOME/mpd/mpd.conf
                 $XDG_CONFIG_HOME/mpv/mpv.conf 
                 $XDG_CONFIG_HOME/ncmpcpp/config
                 $XDG_CONFIG_HOME/nsxiv/* 
                 $XDG_CONFIG_HOME/picom/picom.conf
                 $XDG_CONFIG_HOME/ranger/rc.conf 
                 $XDG_CONFIG_HOME/rofi/config.rasi 
                 $XDG_CONFIG_HOME/starship.toml
                 $XDG_CONFIG_HOME/tmux/tmux.conf
                 $XDG_CONFIG_HOME/weechat/*.conf 
                 $XDG_CONFIG_HOME/yazi/*    
                 $XDG_CONFIG_HOME/zathura/zathurarc
               )

        local string=" Config Editor ~/.config "

        fzf --exact --height 40% --cycle --border-label="$string" \
        --layout=reverse --tac --border --color=label:italic:white --prompt="Select Configs(s) To Edit: " \
        --preview='bat --force-colorization --line-range 1:100 {}' \
        --preview-window=right,70% --multi< <(printf "%s\n" "${(@nO)myconfigs}")  | xargs -ro vim -X

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
local_ip()
{
    local MY_IP=$(ip -4 -j a | jq -r '.[] | select(.operstate=="UP") | .addr_info[].local')
    echo $MY_IP
}

yy() 
{
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		\cd -- "$cwd"
	fi
	rm -f -- "$tmp"
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

# Returns the public IP address
public_ip()
{
    local MY_IP=$(curl http://ipecho.net/plain 2>/dev/null; echo)
    echo $MY_IP
}


# Uninstalls unnecessary packages 
orphans() 
{
  if [[ ! -n $(pacman -Qdt) ]]; then
    printf  "\n%s\n" "No Unused Dependencies to remove"
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

# Cursor colours
zvm_config() {
  # Retrieve default cursor styles
  local ncur=$(zvm_cursor_style $ZVM_NORMAL_MODE_CURSOR)
  local icur=$(zvm_cursor_style $ZVM_INSERT_MODE_CURSOR)

  # Append your custom color for your cursor
  ZVM_INSERT_MODE_CURSOR=$icur'\e\e]12;#FFD700\a'
  ZVM_NORMAL_MODE_CURSOR=$ncur'\e\e]12;\a'
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

function _suto_prompt () {
  if [[ $(_suto) == 0 ]]; then
    echo $1
  else
    echo $2
  fi
}

function _suto () {
  sudo -n true &> /dev/null
  r=$?
  echo $r
}

getPublicIP() {
    data_path="$HOME/.config/neofetch/data-public-ip.txt"
    duration=604800

    if [[ -e "$data_path" ]]; then
        public_ip_date="$(stat -c '%Y' $data_path)"
        current_date="$(date +%s)"
        date_diff=$(($current_date - $public_ip_date))

        if [ $date_diff -ge $duration ]; then
            get_public_ip
            savePublicIP
        else
            savePublicIP
        fi
    else
        get_public_ip
        savePublicIP
    fi

    showPublicIP
}
savePublicIP() {
    if [[ "${#public_ip}" -gt 0 ]]; then
        echo "$public_ip" > "$data_path"
    else
        public_ip="$(cat $data_path)"
    fi
}
showPublicIP() {
   print "Public IP" "$public_ip"
}

get_public_ip() {
    if [[ ! -n "$public_ip_host" ]] && type -p dig >/dev/null; then
        public_ip="$(dig +time=1 +tries=1 +short myip.opendns.com @resolver1.opendns.com)"
       [[ "$public_ip" =~ ^\; ]] && unset public_ip
    fi

    if [[ ! -n "$public_ip_host" ]] && [[ -z "$public_ip" ]] && type -p drill >/dev/null; then
        public_ip="$(drill myip.opendns.com @resolver1.opendns.com | \
                     awk '/^myip\./ && $3 == "IN" {print $5}')"
    fi

    if [[ -z "$public_ip" ]] && type -p curl >/dev/null; then
        public_ip="$(curl -L --max-time "$public_ip_timeout" -w '\n' "$public_ip_host")"
    fi

    if [[ -z "$public_ip" ]] && type -p wget >/dev/null; then
        public_ip="$(wget -T "$public_ip_timeout" -qO- "$public_ip_host")"
    fi
}

