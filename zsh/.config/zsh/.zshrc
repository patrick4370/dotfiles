# Last Updated 29-10-2023 15:46 +1000
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# History Variables and options
setopt APPEND_HISTORY                                   # append to history file
setopt EXTENDED_HISTORY                                 # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST                           # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS                                # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS                             # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS                                 # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE                                # Do not record an event starting with a space.
setopt HIST_NO_STORE                                    # Don't store history commands
setopt HIST_SAVE_NO_DUPS                                # Do not write a duplicate event to the history file.
setopt HIST_VERIFY                                      # Do not execute immediately upon history expansion.
setopt INC_APPEND_HISTORY                               # Write to the history file immediately, not when the shell exits.
setopt PROMPT_SUBST
setopt SHARE_HISTORY                                    # Share history between all sessions.

export HISTFILE="${XDG_CONFIG_HOME}/zsh/zsh/histfile"   # Where the history file is saved
export HISTSIZE=1000000                                 # Size of History file
export SAVEHIST=$HISTSIZE                               # Allows history to be saved

# Initialize the completion for the current Zsh session 
autoload -U compinit; compinit -i
autoload -Uz promptinit
promptinit
autoload -Uz +X bashcompinit && bashcompinit
autoload -U colors && colors

# Move these files to the cache directory
compinit -d "${XDG_CACHE_HOME}/zsh/zcompdump-$ZSH_VERSION"
zstyle ':completion::complete:*' cache-path ${XDG_CACHE_HOME}/zsh/zcompdump-$ZSH_VERSION
zstyle ':chpwd:*' recent-dirs-file "${XDG_CACHE_HOME}/zsh/chpwd-recent-dirs"

zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' format %d
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Use vi mode
bindkey -v
export KEYTIMEOUT=1

## Init
setopt PROMPT_SUBST

TRAPUSR1() { rehash }

setopt COMPLETE_ALIASES		                            # Prevent aliases being expanded
setopt PUSHD_MINUS                                      # Exchanges the meanings of `+' and `-' when used with a number to specify a directory in the stack.
setopt EXTENDED_GLOB		                            # Treat the `#', `~' and `^' characters as part of patterns for filename generation
setopt GLOB_COMPLETE                                    # When the current word has a glob pattern, do not insert all the words resulting from the expansion 
                                                        # but generate matches as for completion and cycle through them like MENU_COMPLETE. The matches are
                                                        # generated as if a `*' was added to the end of the word, or inserted at the cursor when COMPLETE_IN_WORD 
                                                        # is set. This actually uses pattern matching, not globbing, so it works not only for files but for any 
                                                        # completion, such as options, user names, etc.
setopt INTERACTIVECOMMENTS                              # Allow comments at the prompt
setopt LIST_PACKED                                      # Try to make the completion list smaller by printing the matches in columns with different widths.
setopt LIST_ROWS_FIRST                                  # Lay out the matches in completion lists sorted horizontally, that is, the second match is to the 
                                                        # right of the first one, not under it as usual.
setopt MENU_COMPLETE                                    # On  an  ambiguous  completion,  instead of listing possibilities or beeping, insert the first match 
                                                        # immediately. Then when completion is requested again, remove the first match and insert the second
                                                        # match, etc. When there are no more matches, go back to the first one  again.
setopt PUSHD_IGNORE_DUPS	                            # Don't push multiple copies of the same directory onto the directory stack	
setopt PUSHD_MINUS			                            # Exchanges the meanings of `+' and `-' when used with a number to specify a directory in the stack
setopt PUSHD_SILENT			                            # Do not print the directory stack after pushd or popd
setopt PUSHD_TO_HOME		                            # Have pushd with no arguments act like `pushd $HOME'
setopt AUTO_CD                                          # If a command is issued that can't be executed as a normal command, and the command is the name of a 
                                                        # directory, perform the cd command to that directory.
setopt AUTO_PUSHD                                       # Make cd push the old directory onto the directory stack. 
setopt PUSHD_IGNORE_DUPS                                # Don't push multiple copies of the same directory onto the directorY stack.    

# Quick cd'ing in ZSH by setting a 'cdpath'
export cdpath=($HOME/Documents $HOME/Downloads $HOME/Pictures $HOME/Videos)

# Export LANG
export LANG=en_AU.UTF-8

# Load and merge changes in ~/.Xresouces
# if (( ${+DISPLAY}  )); then
#     [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
# fi

# Plugin Manager

# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

ZVM_INIT_MODE=sourcing
 
# Source zcomet.zsh
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

zcomet load Aloxaf/fzf-Tab                              # Replace zsh's default completion selection menu with fzf!
zcomet load momo-lab/zsh-smartinput                     # character (), [], {}, ", ' and `. completion
zcomet load mattmc3/zman                                # Scrapes the Zsh docs for index words and phrases and navigate to the online docs.
zcomet load zsh-users/zsh-autosuggestions               # It suggests commands as you type based on history and completions.
zcomet load joshskidmore/zsh-fzf-history-search         # FZF History Search
zcomet load joel-porquet/zsh-dircolors-solarized        # Solarized dircolors plugin for zsh.
zcomet load jocelynmallon/zshmarks                      # ZSH directory bookmarks
zcomet load ael-code/zsh-colored-man-pages              # Coloured man pages
zcomet load zdharma-continuum/fast-syntax-highlighting  # Feature rich syntax highlighting for Zsh.
zcomet load jeffreytse/zsh-vi-mode

# Run compinit and compile its cache
zcomet compinit

unalias run-help
autoload -U run-help

eval $(keychain --quiet ~/.ssh/pidns_ecdsa ~/.ssh/pxe_ecdsa ~/.ssh/id_ed25519_gitlab)

# Local Aliases
[[ -f "$ZDOTDIR/.alias.zsh" ]] && source "$ZDOTDIR/.alias.zsh"

# Local functions
[[ -f "$ZDOTDIR/.functions.zsh" ]] && source "$ZDOTDIR/.functions.zsh"

# Sourced Plugins
[[ -f "~/.zshenv" ]] && source "~/.zshenv"
[[ -f "$HOME/.config/zsh/.zle.zsh" ]] && source "$HOME/.config/zsh/.zle.zsh"
[[ -f "~/.config/zsh/sudo-prepend.plugin.zsh" ]] && source "~/.config/zsh/sudo-prepend.plugin.zsh"
[[ -f "/usr/share/doc/pkgfile/command-not-found.zsh" ]] && source "/usr/share/doc/pkgfile/command-not-found.zsh"
[[ -f "~/.keychain/bella-sh" ]] && source "/home/patrick/.keychain/bella-sh"
[[ -f "/usr/share/fzf/key-bindings.zsh" ]] && source "/usr/share/fzf/key-bindings.zsh"
[[ -f "~/gitstatus/gitstatus.prompt.zsh" ]] && source "~/gitstatus/gitstatus.prompt.zsh"

# Custom completion directories
fpath=($HOME/.local/share/zsh/prompt $fpath)
 
bindkey -s '^o' 'mc^M'
bindkey -s '^h' 'cd ~^M'
bindkey -s '^[^E' 'cd ~/.config^M'
# bindkey -M vicmd '^R' fzf-history-widget
# bindkey -M viins '^R' fzf-history-widget
# bindkey '^R' fzf-history-widget

# export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=black,bg=green"

# PATH
typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/bin" "/usr/local/bin" "/usr/share/zsh/plugins/" "$path[@]")
export PATH

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# stty -ixon


ZSH_COMPDUMP="$HOME/.cache/zsh/zcompcache"

# Create the parent directory if it doesn't exist
[[ -d $ZSH_COMPDUMP ]] || mkdir -p $ZSH_COMPDUMP

_comp_files=($ZSH_COMPDUMP/zcompdump(Nm-20))
if (( $#_comp_files )); then
    autoload -Uz compinit -C -d "$ZSH_COMPDUMP/.zcompdump-${ZSH_VERSION}"
else
    autoload -Uz compinit -d "$ZSH_COMPDUMP/.zcompdump-${ZSH_VERSION}"
fi

# if xhost >& /dev/null; then
#     /usr/bin/numlockx on
#     setxkbmap -option caps:escape
# fi

# Command Prompt
# if [ -z $SSH_CONNECTION ]; then
    # export PROMPT='%F{240}[%f%F{33}%n%f%F{11}@%f%F{208}%m%f%F{240}]$(_suto_prompt "%F{240}[%{$fg_no_bold[red]%}%f%F{240}]%f" "%F{240}[%{$fg_no_bold[yellow]%}%f%F{240}]%f")%F{240}[%F{213}%~%f%F{240}]%f
# %F{240}[%f%(?.%B%F{70}%f%b.%B%F{196}%?%f)%f%b%F{240}]%f %F{39}>%f '
# export RPROMPT='$GITSTATUS_PROMPT'
# else
    # export PROMPT='%F{240}[%f%F{33}%n%f%F{11}@%f%F{208}%m%f%F{240}]$(_suto_prompt "%F{240}[%{$fg_no_bold[red]%}%f%F{240}]%f" "%F{240}[%{$fg_no_bold[yellow]%}%f%F{240}]%f")%F{240}[%f%F{160}%f%F{240}]%f%F{240}[%F{213}%~%f%F{240}]%f  
 # %F{240}[%f%(?.%B%F{70}%f%b.%F{94}%?%f)%F{240}]%f %F{39}>%f '
# export RPROMPT='$GITSTATUS_PROMPT'
# file
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
