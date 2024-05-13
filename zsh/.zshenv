# export FONTPREVIEW_BG_COLOR='#383c4a'*/
# export FONTPREVIEW_FG_COLOR='#ffffff'
# export QT_QPA_PLATFORMTHEME="qt5ct"
export AUR_USER=patrick4370
export BW_SESSION="hXtFQyWEQ3LizI1bLu/OLbox+9Rr5mukTmku2yiMnIeoHzdcoPw3WtBxxWgMKWJsvabbbkDmWqod8c5PcQGicA=="
export CDPATH='.:/:~/:..:../..:~/Documents:~/Pictures:/etc:~/Videos/:~/Pictures/Screenshots/'
export CM_HISTLENGTH=20
export CM_LAUNCHER='/usr/bin/rofi'
export DIFFPROG='/usr/bin/vimdiff'
export DIRSTACKSIZE='20'
export EDITOR='/usr/bin/vim'
export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--cycle --tac --sort --layout=reverse --preview 'tree -C {} | head -50'"
export FZF_CTRL_R_OPTS='--tac --sort --extended --cycle' 
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview='bat -n --color=always {}' --height=100% --bind shift-up:preview-page-up,shift-down:preview-page-down"
export FZF_DEFAULT_COMMAND='fd --hidden --type f'
export FZF_DEFAULT_OPTS='--color=fg:bright-black,bg:#262626,hl:#005fff,border:#005fff --color=fg+:#005fff,bg+:#262626,hl+:bright-red --color=info:#afaf87,prompt:bright-green,pointer:bright-red,marker:green --color=header:bright-magenta,spinner:bright-magenta --prompt=":: " --border --info=inline --tac --pointer=" " --marker=" "'
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export GREP_COLORS='ms=0;32'
export GROFF_NO_SGR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export GTK_IM_MODULE=ibus
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg="#ffffff",bg="#005fd7",bold"
export LANG='en_AU.UTF-8'
export LESS='-Rixj5'
export LIBVA_DRIVER_NAME=i965
export LS_COLORS="$(vivid generate molokai)"
export MANPAGER="less"
export MANROFFOPT="-c"
export MINICOM='-c on'
export PAGER="most"
export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$GEM_HOME/bin"
export PF_COL1=2
export PF_COL2=6
export PF_COL3=1
export PF_COLOR=1
export PF_INFO="ascii title os host kernel uptime pkgs memory de shell editor palette"
export PF_SEP=":"
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export PROMPT_EOL_MARK=''
export QT_IM_MODULE=ibus
export QT_STYLE_OVERRIDE="kvantum"
export READER='/usr/bin/zathura'
export RESTIC_PASSWORD_FILE="/etc/restic/pw.txt"
export RESTIC_REPOSITORY="/run/media/patrick/D923-4A19/Restic_Backup/"
export SAVEHIST=100000
export TERM=xterm-256color
export TERMINAL='/usr/bin/alacritty'
export THEME_FONT_FACE="JetBrains Mono"
export THEME_FONT_SIZE="12"
export VDPAU_DRIVER=va_gl
export VISUAL='/usr/bin/vim'
export XCURSOR_SIZE=40
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:=$HOME/.local/share/:/usr/local/share:/usr/share}"
export XMODIFIERS=@im=ibus
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZSH_TMUX_CONFIG="${XDG_CONFIG_HOME}/tmux/tmux.conf"
