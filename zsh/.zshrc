typeset -U path PATH
path=(~/.local/bin $path)
export PATH

autoload -Uz compinit; compinit
