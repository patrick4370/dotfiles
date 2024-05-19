# Set the directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download zinit if it isn't there
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light momo-lab/zsh-smartinput
zinit light Aloxaf/fzf-Tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light ael-code/zsh-colored-man-pages
zinit ice wait atload _history_substring_search_config

# Add in zinit snippets
zinit snippet OMZP::extract
zinit snippet OMZP::archlinux
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Zinit completions
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Start the completion and autoload system
autoload -Uz compinit; compinit
zmodload -i zsh/complist
autoload -Uz edit-command-line; zle -N edit-command-line
autoload -Uz history-substring-search-down; zle -N history-substring-search-down
autoload -Uz history-substring-search-up; zle -N history-substring-search-up

# Replay all cached completions
zinit cdreplay -q

# Setup additional PATHs
typeset -U path PATH
path=(~/.local/bin $path)
export PATH

# Additional function and site-function paths 
fpath=($fpath)

# Completion parameters
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:::::default' menu yes select
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' verbose yes
zstyle ':completion:*:*:*:*:descriptions' format '-- %d --'
zstyle ':completion:*:*:*:*:corrections' format '!- %d (errors: %e) -!'
zstyle ':completion:*:messages' format ' -- %d --'
zstyle ':completion:*:warnings' format ' -- no matches found --'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
zstyle ':completion:*' rehash true
zstyle ':completion:*' file-sort modification

# History Parameters
HISTFILE=$XDG_CONFIG_HOME/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS     # do not put duplicated command into history list
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS        # do not save duplicated command
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS       # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY         # record command start time

# setopt options
setopt KSH_OPTION_PRINT

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v                                          #vi mode
bindkey -M vicmd v edit-command-line
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey  "^[[H"   beginning-of-line
bindkey  -a "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  -a "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey -a '^[[3~' delete-char
bindkey -M viins -r "^H"
bindkey -s "^H" 'cd\n'

# Source files
[ -f $HOME/.zshenv ] && source $HOME/.zshenv  || echo "$HOME/.zshenv not found"
[ -f $XDG_CONFIG_HOME/zsh/.alias.zsh ] && source $XDG_CONFIG_HOME/zsh/.alias.zsh || echo "$XDG_CONFIG_HOME/zsh/.alias.zsh not found" 
[ -f $XDG_CONFIG_HOME/zsh/.functions.zsh ] && source $XDG_CONFIG_HOME/zsh/.functions.zsh || echo "$XDG_CONFIG_HOME/zsh/.functions.zsh not found"
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh || echo "/usr/share/fzf/completion.zsh not found"  
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh || echo "/usr/share/fzf/key-bindings.zsh not found" 

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval $(keychain --eval --quiet --agents ssh pidns_ecdsa pxe_ecdsa github_ed25519)
clear
