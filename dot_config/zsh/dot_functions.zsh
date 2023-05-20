
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

ze()
{
    pushd ~/.config/zsh

    file_array=("${(@f)$(\ls -ap | \grep -v / | \grep "^\.")}");


        
    printf "%s\n" $file_array | sort -r \
    | fzf --exact --height 30% --bind="ctrl-space:toggle-preview" --preview-window=:hidden \
    --layout=reverse-list --border --prompt="Select Script(s) To Edit: " \
    --preview='bat --force-colorization --line-range 1:60 {}' --cycle \
    --header="The ZSH dot file Editor" --preview-window=right,50% --multi | \
    xargs -or $EDITOR;

    popd
}

# Uses FZF to present a list of files to edit in the config directory
ce() 
{  
    mydirs=(~/.config/alacritty/alacritty.yml ~/.config/dunst/dunstrc ~/.config/i3/config \
            ~/.config/i3status-rust/config.toml ~/.config/lsd/* ~/.config/mpd/mpd.conf \
            ~/.config/mpv/mpv.conf ~/.config/ncmpcpp/config \
            ~/.config/nsxiv/* ~/.config/nvim/init.vim ~/.config/picom/picom.conf \
            ~/.config/ranger/rc.conf ~/.config/rofi/config.rasi ~/.config/tmux/tmux.conf \
            ~/.config/weechat/*.conf ~/.config/zathura/zathurarc \
           )
    du -a  ${mydirs[*]} | \
        awk '{print $2}' | uniq | sort -r \
        | fzf --exact --height 40% --cycle \
        --layout=reverse-list --border --prompt="Select Script(s) To Edit: " \
        --preview='bat --force-colorization --line-range 1:60 {}' \
        --header="The Script Editor" --preview-window=right,50% --multi | \
        xargs -or $EDITOR;
}

# Last pacman update
lstupg()
{
    tac /var/log/pacman.log | sed -n '/full system upgrade/q;s/.*\[ALPM\] upgraded //p'
}

# Create archive
compress() 
{
    if [ -n "$1" ] ; then
	FILE=$1
        case $FILE in
        *.tar) shift && tar cf $FILE $* ;;
        *.tar.bz2) shift && tar cjf $FILE $* ;;
        *.tar.gz) shift && tar czf $FILE $* ;;
        *.tgz) shift && tar czf $FILE $* ;;
        *.zip) shift && zip $FILE $* ;;
        *.rar) shift && rar $FILE $* ;;
        esac
else
echo "usage: compress <archive.tar.gz> <archive> <files>"
    fi
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

# Colours for man pages
# man() {
#     LESS_TERMCAP_md=$'\e[1;31m' \
#     LESS_TERMCAP_me=$'\e[0m' \
#     LESS_TERMCAP_so=$'\e[38;5;88m' \
#     LESS_TERMCAP_se=$'\e[0m' \
#     LESS_TERMCAP_us=$'\e[1;32m' \
#     LESS_TERMCAP_ue=$'\e[0m' \
#     command man "$@"
# }

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

nuke() 
{
  local pid
  pid=$(ps -ef | grep -v ^root \
      | sed 1d | fzf --multi --layout=reverse-list \
      --header="🔪 Kill that process 🔪" --prompt="Kill process: " \
      --height 50% --bind 'ctrl-/:toggle-search' | awk '{print $2}')

  [[ ! -z "$pid" ]] && echo $pid | xargs kill -${1:-9} 2>/dev/null
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
se() 
{  
    mydirs=(~/.local/bin/*)
    du -a  ${mydirs[*]} | awk '{print $2}' | uniq | sort -r | \
           fzf --height 50% --algo=v2 --bind 'ctrl-d:clear-selection,ctrl-a:select-all' \
           --layout=reverse-list --prompt="🔎 Select Script(s) To Edit: " \
           --preview='bat --theme base16-256 --language bash --line-range 1:70 --force-colorization {}' \
           --preview-window=right,50% --multi | xargs -or $EDITOR;
}

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

function git_prompt_info() {
  # If we are on a folder not tracked by git, get out.
  # Otherwise, check for hide-info at global and local repository level
  if ! __git_prompt_git rev-parse --git-dir &> /dev/null \
     || [[ "$(__git_prompt_git config --get oh-my-zsh.hide-info 2>/dev/null)" == 1 ]]; then
    return 0
  fi

  local ref
  ref=$(__git_prompt_git symbolic-ref --short HEAD 2> /dev/null) \
  || ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) \
  || return 0

  # Use global ZSH_THEME_GIT_SHOW_UPSTREAM=1 for including upstream remote info
  local upstream
  if (( ${+ZSH_THEME_GIT_SHOW_UPSTREAM} )); then
    upstream=$(__git_prompt_git rev-parse --abbrev-ref --symbolic-full-name "@{upstream}" 2>/dev/null) \
    && upstream=" -> ${upstream}"
  fi

  echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${ref:gs/%/%%}${upstream:gs/%/%%}$(parse_git_dirty)${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS
  local -a FLAGS
  FLAGS=('--porcelain')
  if [[ "$(__git_prompt_git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ "${DISABLE_UNTRACKED_FILES_DIRTY:-}" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    case "${GIT_STATUS_IGNORE_SUBMODULES:-}" in
      git)
        # let git decide (this respects per-repo config in .gitmodules)
        ;;
      *)
        # if unset: ignore dirty submodules
        # other values are passed to --ignore-submodules
        FLAGS+="--ignore-submodules=${GIT_STATUS_IGNORE_SUBMODULES:-dirty}"
        ;;
    esac
    STATUS=$(__git_prompt_git status ${FLAGS} 2> /dev/null | tail -n 1)
  fi
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

# Gets the difference between the local and remote branches
function git_remote_status() {
    local remote ahead behind git_remote_status git_remote_status_detailed
    remote=${$(__git_prompt_git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]]; then
        ahead=$(__git_prompt_git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        behind=$(__git_prompt_git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

        if [[ $ahead -eq 0 ]] && [[ $behind -eq 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE"
        elif [[ $ahead -gt 0 ]] && [[ $behind -eq 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE"
            git_remote_status_detailed="$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE$((ahead))%{$reset_color%}"
        elif [[ $behind -gt 0 ]] && [[ $ahead -eq 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE"
            git_remote_status_detailed="$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE$((behind))%{$reset_color%}"
        elif [[ $ahead -gt 0 ]] && [[ $behind -gt 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE"
            git_remote_status_detailed="$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE$((ahead))%{$reset_color%}$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE$((behind))%{$reset_color%}"
        fi

        if [[ -n $ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX${remote:gs/%/%%}$git_remote_status_detailed$ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX"
        fi

        echo $git_remote_status
    fi
}

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}


# Gets the number of commits ahead from remote
function git_commits_ahead() {
  if __git_prompt_git rev-parse --git-dir &>/dev/null; then
    local commits="$(__git_prompt_git rev-list --count @{upstream}..HEAD 2>/dev/null)"
    if [[ -n "$commits" && "$commits" != 0 ]]; then
      echo "$ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX$commits$ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX"
    fi
  fi
}

# Gets the number of commits behind remote
function git_commits_behind() {
  if __git_prompt_git rev-parse --git-dir &>/dev/null; then
    local commits="$(__git_prompt_git rev-list --count HEAD..@{upstream} 2>/dev/null)"
    if [[ -n "$commits" && "$commits" != 0 ]]; then
      echo "$ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX$commits$ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX"
    fi
  fi
}

# Outputs if current branch is ahead of remote
function git_prompt_ahead() {
  if [[ -n "$(__git_prompt_git rev-list origin/$(git_current_branch)..HEAD 2> /dev/null)" ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
}

# Outputs if current branch is behind remote
function git_prompt_behind() {
  if [[ -n "$(__git_prompt_git rev-list HEAD..origin/$(git_current_branch) 2> /dev/null)" ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
}

# Outputs if current branch exists on remote or not
function git_prompt_remote() {
  if [[ -n "$(__git_prompt_git show-ref origin/$(git_current_branch) 2> /dev/null)" ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_REMOTE_EXISTS"
  else
    echo "$ZSH_THEME_GIT_PROMPT_REMOTE_MISSING"
  fi
}

# Formats prompt string for current git commit short SHA
function git_prompt_short_sha() {
  local SHA
  SHA=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}

# Formats prompt string for current git commit long SHA
function git_prompt_long_sha() {
  local SHA
  SHA=$(__git_prompt_git rev-parse HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}

function git_prompt_status() {
  [[ "$(__git_prompt_git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]] && return

  # Maps a git status prefix to an internal constant
  # This cannot use the prompt constants, as they may be empty
  local -A prefix_constant_map
  prefix_constant_map=(
    '\?\? '     'UNTRACKED'
    'A  '       'ADDED'
    'M  '       'ADDED'
    'MM '       'MODIFIED'
    ' M '       'MODIFIED'
    'AM '       'MODIFIED'
    ' T '       'MODIFIED'
    'R  '       'RENAMED'
    ' D '       'DELETED'
    'D  '       'DELETED'
    'UU '       'UNMERGED'
    'ahead'     'AHEAD'
    'behind'    'BEHIND'
    'diverged'  'DIVERGED'
    'stashed'   'STASHED'
  )

  # Maps the internal constant to the prompt theme
  local -A constant_prompt_map
  constant_prompt_map=(
    'UNTRACKED' "$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    'ADDED'     "$ZSH_THEME_GIT_PROMPT_ADDED"
    'MODIFIED'  "$ZSH_THEME_GIT_PROMPT_MODIFIED"
    'RENAMED'   "$ZSH_THEME_GIT_PROMPT_RENAMED"
    'DELETED'   "$ZSH_THEME_GIT_PROMPT_DELETED"
    'UNMERGED'  "$ZSH_THEME_GIT_PROMPT_UNMERGED"
    'AHEAD'     "$ZSH_THEME_GIT_PROMPT_AHEAD"
    'BEHIND'    "$ZSH_THEME_GIT_PROMPT_BEHIND"
    'DIVERGED'  "$ZSH_THEME_GIT_PROMPT_DIVERGED"
    'STASHED'   "$ZSH_THEME_GIT_PROMPT_STASHED"
  )

  # The order that the prompt displays should be added to the prompt
  local status_constants
  status_constants=(
    UNTRACKED ADDED MODIFIED RENAMED DELETED
    STASHED UNMERGED AHEAD BEHIND DIVERGED
  )

  local status_text
  status_text="$(__git_prompt_git status --porcelain -b 2> /dev/null)"

  # Don't continue on a catastrophic failure
  if [[ $? -eq 128 ]]; then
    return 1
  fi

  # A lookup table of each git status encountered
  local -A statuses_seen

  if __git_prompt_git rev-parse --verify refs/stash &>/dev/null; then
    statuses_seen[STASHED]=1
  fi

  local status_lines
  status_lines=("${(@f)${status_text}}")

  # If the tracking line exists, get and parse it
  if [[ "$status_lines[1]" =~ "^## [^ ]+ \[(.*)\]" ]]; then
    local branch_statuses
    branch_statuses=("${(@s/,/)match}")
    for branch_status in $branch_statuses; do
      if [[ ! $branch_status =~ "(behind|diverged|ahead) ([0-9]+)?" ]]; then
        continue
      fi
      local last_parsed_status=$prefix_constant_map[$match[1]]
      statuses_seen[$last_parsed_status]=$match[2]
    done
  fi

  # For each status prefix, do a regex comparison
  for status_prefix in ${(k)prefix_constant_map}; do
    local status_constant="${prefix_constant_map[$status_prefix]}"
    local status_regex=$'(^|\n)'"$status_prefix"

    if [[ "$status_text" =~ $status_regex ]]; then
      statuses_seen[$status_constant]=1
    fi
  done

  # Display the seen statuses in the order specified
  local status_prompt
  for status_constant in $status_constants; do
    if (( ${+statuses_seen[$status_constant]} )); then
      local next_display=$constant_prompt_map[$status_constant]
      status_prompt="$next_display$status_prompt"
    fi
  done

  echo $status_prompt
}

# Outputs the name of the current user
# Usage example: $(git_current_user_name)
function git_current_user_name() {
  __git_prompt_git config user.name 2>/dev/null
}

# Outputs the email of the current user
# Usage example: $(git_current_user_email)
function git_current_user_email() {
  __git_prompt_git config user.email 2>/dev/null
}

# Output the name of the root directory of the git repository
# Usage example: $(git_repo_name)
function git_repo_name() {
  local repo_path
  if repo_path="$(__git_prompt_git rev-parse --show-toplevel 2>/dev/null)" && [[ -n "$repo_path" ]]; then
    echo ${repo_path:t}
  fi
}

# get the nvm-controlled node.js version
function nvm_prompt_info() {
  which nvm &>/dev/null || return
  local nvm_prompt=${$(nvm current)#v}
  echo "${ZSH_THEME_NVM_PROMPT_PREFIX}${nvm_prompt:gs/%/%%}${ZSH_THEME_NVM_PROMPT_SUFFIX}"
}

ssh-fix()
{
    if [ -z "$1" ]; then
        echo -e "No parameter passed\nssh-fix <hostname|IP Address>"
    else
        ssh-keygen -f "/home/patrick/.ssh/known_hosts" -R "$1"  
    fi
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
