autoload -U colors && colors
#PS1="%B%n%{$fg[green]%}@%{$fg[white]%}Debian %{$fg[green]%}%3d%{$fg[white]%}>%{$reset_color%}%b "
PS1="%B%n%F{137}@%fDebian %F{148}%3d%f>%b "
export KEYTIMEOUT=1

export PATH=$HOME/.local/bin:$PATH

# check if aliasrc exists and source it
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

export DISPLAY=localhost:0.0


# source the zsh-syntax-highlighting plugin
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey -s "^f" 'cd "$(dirname "$(fzf)")"\n'
bindkey -s "^p" 'winopen "$(find -type f | grep ".pdf" | fzf)"\n'

### DONT EDIT THIS PART ###
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=* l:|=*' 'r:|[._-]=* r:|=*'
zstyle :compinstall filename '/home/johnsonn/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.local/.cache/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
### NOW YOU CAN EDIT AGAIN ###

# Share between shell
setopt inc_append_history
setopt share_history

# enable comments in interactive prompt
setopt interactivecomments

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# dumb neofetch meme
#neofetch --memory_percent on --color_blocks off --disable Packages

# enable syntax highligting in man pages
# needs most (like less/more) installed
#export PAGER=most

