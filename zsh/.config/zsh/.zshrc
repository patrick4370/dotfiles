# Start the completion system
autoload -Uz compinit; compinit
zmodload -i zsh/complist
autoload -Uz edit-command-line; zle -N edit-command-line
autoload -Uz history-substring-search-down; zle -N history-substring-search-down
autoload -Uz history-substring-search-up; zle -N history-substring-search-up

# Setup additional PATHs
typeset -U path PATH
path=(~/.local/bin $path)
export PATH

# Completion parameters
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*:*:cp:*' file-sort size
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' verbose yes
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{#ff0000}-- no matches found --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# History Parameters
HISTFILE=$XDG_CONFIG_HOME/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS     # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS        # do not save duplicated command
setopt HIST_REDUCE_BLANKS       # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY         # record command start time
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS



# Keybindings
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v
bindkey -M vicmd v edit-command-line
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey  "^[[H"   beginning-of-line
bindkey  -a "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  -a "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey -a '^[[3~' delete-char

# Source files
source $HOME/.zshenv
source $XDG_CONFIG_HOME/zsh/.alias.zsh
source $XDG_CONFIG_HOME/zsh/.functions.zsh
source /usr/share/fzf/completion.zsh   
source /usr/share/fzf/key-bindings.zsh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit load zsh-users/zsh-syntax-highlighting
zinit load remino/omz-plugin-git-aliases
zinit load momo-lab/zsh-smartinput
zinit load Aloxaf/fzf-Tab
zinit load zsh-users/zsh-autosuggestions
zinit load 'zsh-users/zsh-history-substring-search'
zinit ice wait atload '_history_substring_search_config'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
