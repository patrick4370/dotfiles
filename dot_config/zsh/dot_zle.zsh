# Shortcut to exit shell on partial command line
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

function prepend-sudo() {
  [[ -z $BUFFER ]] && zle up-history
  if [[ $BUFFER == sudo\ * ]]; then
    LBUFFER="${LBUFFER#sudo }"
  else
    LBUFFER="sudo $LBUFFER"
  fi
}

zle -N prepend-sudo
# defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" prepend-sudo
# defined shortcut keys: [Ctrl-s]
bindkey "^w" prepend-sudo
